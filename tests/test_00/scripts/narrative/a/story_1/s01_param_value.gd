class_name S01_ParamValue extends RefCounted
## Значение параметра, используемого в Параметрике. Это именно значение: передача должна производиться не по ссылке (с помощью оператора присваивания), а с помощью метода set_from() или copy_to().


## Класс параметра: к какой группе параметров он принадлежит. Константа класса S01_ParamClass.
var _param_class: StringName


func _init (param_class: StringName):
	
	_param_class = param_class


## Создает новый экземпляр конкретного подкласса S01_ParamValue и устанавливает его свойства из текущего экземпляра. Использовать ТОЛЬКО при создании новых параметров в Параметрике.
func clone_shallow () -> S01_ParamValue:
	
	printerr ("Abstract method")
	assert (false)
	return null


func set_from (param_value: S01_ParamValue):
	
	printerr ("Abstract method.")
	assert (false)


func copy_to (param_value: S01_ParamValue):
	
	printerr ("Abstract method.")
	assert (false)


func as_int_param_value () -> S01_IntParamValue:
	
	return self as S01_IntParamValue


func as_string_param_value () -> S01_StringParamValue:
	
	return self as S01_StringParamValue


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var param_class: StringName:
	
	get: return _param_class
