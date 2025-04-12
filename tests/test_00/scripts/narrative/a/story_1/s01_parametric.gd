class_name S01_Parametric extends RefCounted
## Параметрик - класс, хранящий переменный набор параметров (вернее, их значений), типизированных посредством S01_ParamValue.


## Dictionary[param_name: StringName, param_value: S01_ParamValue] Набор значений параметров, хранящихся по их имени. В качестве имени параметра выступает одна из констант подкласса Параметрика.
var _params_by_names: Dictionary = {}
## Имя Параметрика. Используется для дебаггинга. Устанавливается в подклассах в новое значение.
var _name: StringName = &"parametric"


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
