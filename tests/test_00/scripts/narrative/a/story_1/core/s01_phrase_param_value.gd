class_name S01_PhraseParamValue extends S01_ParamValue


var _value: T00_SimplePhrase


func _init (param_class: StringName, value: T00_SimplePhrase):
	
	super (param_class)
	_value = value.clone_shallow ()


func clone_shallow () -> S01_ParamValue:
	
	return S01_PhraseParamValue.new (_param_class, _value.clone_shallow ())


func set_from (param_value: S01_ParamValue):
	
	var phrase_param_value: S01_PhraseParamValue = param_value as S01_PhraseParamValue
	assert (phrase_param_value)
	assert (_param_class == param_value._param_class)
	
	_value = phrase_param_value._value.clone_shallow ()


func copy_to (param_value: S01_ParamValue):
	
	var phrase_param_value: S01_PhraseParamValue = param_value as S01_PhraseParamValue
	assert (phrase_param_value)
	assert (_param_class == param_value._param_class)
	
	phrase_param_value._value = _value.clone_shallow ()


func get_value_variant () -> Variant:
	
	return _value


## Возвращает true, если полексемное сравнение self._value и param_value._value дает true; в противном случае возвращает false. Запрещает сравнивать экземпляры S01_PhraseParamValue, если _value одного из них равен null.
func equals (param_value: S01_ParamValue, deny_null_param: bool = false) -> bool:
	
	if !param_value && deny_null_param:
		printerr ("Trying to compare S01_ParamValue instance with null.")
		assert (false)
	
	var phrase_param_value: S01_PhraseParamValue = param_value as S01_PhraseParamValue
	if !phrase_param_value:
		return false
	
	# На самом деле, null мог бы быть равным null, но, пожалуй, мне сразу стоит отсечь подобные проверки.
	if !_value || !phrase_param_value._value:
		printerr ("Only non-null value comparisons are allowed.")
		assert (false)
		return false
	
	return _value.equals (phrase_param_value._value)
