class_name S01_StringParamValue extends S01_ParamValue


var _value: StringName


func _init (param_class: StringName, value: StringName):
	
	super (param_class)
	_value = value


func clone_shallow () -> S01_ParamValue:
	
	return S01_StringParamValue.new (_param_class, _value)


func set_from (param_value: S01_ParamValue):
	
	var string_param_value: S01_StringParamValue = param_value as S01_StringParamValue
	assert (string_param_value)
	assert (_param_class == param_value._param_class)
	
	_value = string_param_value._value


func copy_to (param_value: S01_ParamValue):
	
	var string_param_value: S01_StringParamValue = param_value as S01_StringParamValue
	assert (string_param_value)
	assert (_param_class == param_value._param_class)
	
	string_param_value._value = _value


func get_value_variant () -> Variant:
	
	return _value


func equals (param_value: S01_ParamValue, deny_null_param: bool = false) -> bool:
	
	if !param_value && deny_null_param:
		printerr ("Trying to compare S01_ParamValue instance with null.")
		assert (false)
	
	var string_param_value: S01_StringParamValue = param_value as S01_StringParamValue
	if !string_param_value:
		return false
	return _value == string_param_value._value


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var value: StringName:
	
	get: return _value
	set (value):
		_value = value
