class_name T00_Action extends T00_ActionNode
## Класс конкретного действия над объектом.
## Объект, над которым можно совершить это действие, - это _parent узла.
## Экземпляр этого класса НЕ ДОЛЖЕН содержать потомков (_children.size () должен быть равен нулю).


static var GREET: StringName = &"greet"
static var INSPECT: StringName = &"inspect"
static var COME_UP: StringName = &"come_up"
static var ASK_ABOUT_CLUE_CONTAINER: StringName = &"ask_about_clue_container"

static var _names_by_type: Dictionary = {
	GREET: "поздороваться",
	INSPECT: "осмотреть",
	COME_UP: "подойти",
	ASK_ABOUT_CLUE_CONTAINER: "спросить, что внутри",
}

var _type: StringName
var _name: String


func setup (type: StringName) -> T00_Action:
	
	assert (_names_by_type.has (type))
	
	_type = type
	_name = _names_by_type[type]
	
	return self


func get_panel_text () -> String:
	
	return "Abstract action" if !_name else _name


## Возвращает ссылку на внутриигровой Параметрик, которому соответствует T00_ObjectNode-владелец этого узла действия - другими словами, ссылку на Параметрик, над которым совершалось действие. Если родительский объект отсутствует или он не указывает на какой-либо Параметрик, возвращает null.
func get_target () -> S01_Parametric:
	
	var object_node: T00_ObjectNode = _parent as T00_ObjectNode
	if !object_node:
		return null
	
	return object_node._target


## Подменяет стандартное название действия, используемое для типа action_type, на новую строку new_name. Параметр action_type - константа класса T00_Action.
static func replace_name_for_type (action_type: StringName, new_name: String):
	
	_names_by_type[action_type] = new_name

