class_name S01_IntParamValue extends S01_ParamValue


var _value: int


func _init (param_class: StringName, value: int):
	
	super (param_class)
	_value = value


func clone_shallow () -> S01_ParamValue:
	
	return S01_IntParamValue.new (_param_class, _value)


func set_from (param_value: S01_ParamValue):
	
	var int_param_value: S01_IntParamValue = param_value as S01_IntParamValue
	assert (int_param_value)
	assert (_param_class == param_value._param_class)
	
	_value = int_param_value._value


func copy_to (param_value: S01_ParamValue):
	
	var int_param_value: S01_IntParamValue = param_value as S01_IntParamValue
	assert (int_param_value)
	assert (_param_class == param_value._param_class)
	
	int_param_value._value = _value


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var value: int:
	
	get: return _value
	set (value):
		_value = value
