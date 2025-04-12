class_name S01_NounParamValue extends S01_ParamValue


var _value: T00_Noun


func _init (param_class: StringName, value: T00_Noun):
	
	super (param_class)
	_value = value


func clone_shallow () -> S01_ParamValue:
	
	return S01_NounParamValue.new (_param_class, _value)


func set_from (param_value: S01_ParamValue):
	
	var noun_param_value: S01_NounParamValue = param_value as S01_NounParamValue
	assert (noun_param_value)
	assert (_param_class == param_value._param_class)
	
	_value = noun_param_value._value


func copy_to (param_value: S01_ParamValue):
	
	var noun_param_value: S01_NounParamValue = param_value as S01_NounParamValue
	assert (noun_param_value)
	assert (_param_class == param_value._param_class)
	
	noun_param_value._value = _value


func get_value_variant () -> Variant:
	
	return _value


func equals (param_value: S01_ParamValue, deny_null_param: bool = false) -> bool:
	
	if !param_value && deny_null_param:
		printerr ("Trying to compare S01_ParamValue instance with null.")
		assert (false)
	
	var noun_param_value: S01_NounParamValue = param_value as S01_NounParamValue
	if !noun_param_value:
		return false
	return _value == noun_param_value._value


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var value: T00_Noun:
	
	get: return _value
	set (value):
		_value = value
