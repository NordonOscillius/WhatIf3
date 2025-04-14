class_name S01_Parametric extends RefCounted
## Параметрик - класс, хранящий переменный набор параметров (вернее, их значений), типизированных посредством S01_ParamValue.


## Название параметра для названия объекта, отображаемого на панели действий. Параметр с этим именем должен быть установлен с помощью set_param() для интерактивных Параметриков.
static var PNAME__ACTION_PANEL_NAME: StringName = &"action_panel_name"


## Dictionary[param_name: StringName, param_value: S01_ParamValue] Набор значений параметров, хранящихся по их имени. В качестве имени параметра выступает одна из констант подкласса Параметрика.
var _params_by_names: Dictionary = {}
## Имя Параметрика. Используется для дебаггинга. Устанавливается в подклассах в новое значение.
var _name: StringName = &"parametric"
## Массив вложенных Параметриков.
var _children: Array[S01_Parametric] = []
## Родитель этого Параметрика.
var _parent: S01_Parametric
## Массив действий, которые можно применить к этому Параметрику. Экземпляры T00_Action не обязаны (и не должны) быть теми же самыми объектами, что показываются на панели действий; их свойства копируются во вновь созданные экземпляры. Если этот массив пуст, с объектом нельзя взаимодействовать, и он не будет показан на панели действий.
var _actions: Array[T00_Action] = []
## Дополнительный флаг, с помощью которого можно отключить взаимодействие с объектом из-под панели действий, даже если его массив _actions не является пустым. Выключение интерактивности для объекта косвенно отключает интерактивность и для его потомков: они не будут участвовать в сборе интерактивных потомков в collect_interactive_children(), даже если их флаг _enable_interaction установлен в true.
var _enable_interaction: bool = true


## Копирует значение переданного param_value.value в собственный параметр с именем param_name. Если собственный параметр уже существовал, то производит проверку на соответствие категорий (_param_class у обоих экземпляров должны совпадать). Если собственного параметра не существовало, создает его с теми же категорией и значением, что и у переданного экземпляра.
func set_param (param_name: StringName, param_value: S01_ParamValue):
	
	# Если параметр уже существует.
	if _params_by_names.has (param_name):
		# Получаем собственный экземпляр параметра.
		var own_param_value: S01_ParamValue = _params_by_names[param_name]
		# Типы обоих экземпляров должны совпадать.
		assert (own_param_value.param_class == param_value.param_class)
		# Копируем значения (shallow).
		own_param_value.set_from (param_value)
		print (_name, ": setting existing parameter '", param_name, "' to '", param_value.get_value_variant (), "'.")
	# Если параметра не существовало, добавляем новый.
	else:
		_params_by_names[param_name] = param_value.clone_shallow ()
		print (_name, ": setting non-existent parameter '", param_name, "' to '", param_value.get_value_variant (), "'.")


## Возвращает экземпляр параметра с именем param_name или null, если параметра с таким именем не найдено.
func get_param (param_name: StringName) -> S01_ParamValue:
	
	if _params_by_names.has (param_name):
		return _params_by_names[param_name]
	
	return null


func connect_to_parent (parent: S01_Parametric):
	
	if _parent:
		printerr ("This Parametric is a child of some object already.")
		return
	
	_parent = parent


func disconnect_from_parent ():
	
	_parent = null


func add_child (child: S01_Parametric):
	
	if child._parent:
		printerr ("The child is already added to some parent.")
		return
	
	child.connect_to_parent (self)
	_children.push_back (child)


func remove_child_at (index: int):
	
	var child: S01_Parametric = _children[index]
	child.disconnect_from_parent ()
	_children.remove_at (index)


func remove_child (child: S01_Parametric):
	
	var index: int = _children.find (child)
	if index < 0:
		printerr ("Child not found")
		return
	
	remove_child_at (index)


func get_child_at (index: int) -> S01_Parametric:
	
	return _children[index]


## Рекурсивно собирает всех потомков в массив result.
func collect_all_children (result: Array[S01_Parametric]):
	
	var num_children: int = _children.size ()
	var i: int = 0
	while i < num_children:
		var child: S01_Parametric = _children[i]
		result.push_back (child)
		child.collect_all_children (result)
		i += 1


func collect_interactive_children (result: Array[S01_Parametric]):
	
	var num_children: int = _children.size ()
	var i: int = 0
	while i < num_children:
		var child: S01_Parametric = _children[i]
		if child._enable_interaction && child._actions.size ():
			result.push_back (child)
			child.collect_interactive_children (result)
		i += 1


## Добавляет действие action в массив действий _action. Если такое действие уже присутствует в массиве, то действие не добавляется.
func add_action (action: T00_Action, sort_alphabetically: bool = false):
	
	var num_actions: int = _actions.size ()
	var i: int = 0
	while i < num_actions:
		var existing_action: T00_Action = _actions[i]
		# Если встретили такое же действие, выходим.
		if existing_action._type == action._type:
			return
		
		i += 1
	
	_actions.push_back (action)
	
	if sort_alphabetically:
		_actions.sort_custom (sort_actions_alphabetically_callback)


## Создает новое действие типа action_type, добавляет его в _actions с помощью add_action() и возвращает это действие.
func create_and_add_action (action_type: StringName, sort_alphabetically: bool = false) -> T00_Action:
	
	var action: T00_Action = T00_Action.new ().setup (action_type)
	add_action (action, sort_alphabetically)
	return action


## Удаляет первое попавшееся действие с типом _type, равным type. Параметр type - константа класса T00_Action. Если действие с указанным типом не найдено, то ничего не произойдет; но в этом случае, если параметр strict равен true, будет брошено предупреждение об ошибке в лог.
func remove_action (type: StringName, strict: bool = false):
	
	var num_actions: int = _actions.size ()
	var i: int = 0
	while i < num_actions:
		if _actions[i]._type == type:
			_actions.remove_at (i)
			return
		
		i += 1
	
	if strict:
		printerr ("Action not found.")


func get_action_at (index: int) -> T00_Action:
	
	return _actions[index]


func sort_actions_alphabetically_callback (a: T00_Action, b: T00_Action) -> bool:
	
	return a._name <= b._name


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_action_panel_name () -> S01_PhraseParamValue:
	return get_param (S01_ParamClass.ACTION_PANEL_NAME)


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var num_actions: int:
	
	get: return _actions.size ()

