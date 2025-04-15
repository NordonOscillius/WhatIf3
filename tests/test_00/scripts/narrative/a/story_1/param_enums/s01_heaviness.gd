class_name S01_Heaviness extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Оценка тяжести".


static var LIGHT: S01_StringParamValue = create_param_value (&"light")
static var USUAL: S01_StringParamValue = create_param_value (&"usual")
static var HEAVY: S01_StringParamValue = create_param_value (&"heavy")


## Создает значение параметра категории S01_ParamClass.HEAVINESS.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.HEAVINESS, value)


static func get_greater (heaviness_1: S01_StringParamValue, heaviness_2: S01_StringParamValue) -> S01_StringParamValue:
	
	if heaviness_1.equals (HEAVY): return HEAVY
	if heaviness_1.equals (USUAL):
		if heaviness_2.equals (HEAVY): return HEAVY
		return USUAL
	# Light.
	return heaviness_2


static func increase (heaviness: S01_StringParamValue) -> S01_StringParamValue:
	
	if heaviness.equals (LIGHT): return USUAL
	return HEAVY


static func decrease (heaviness: S01_StringParamValue) -> S01_StringParamValue:
	
	if heaviness.equals (HEAVY): return USUAL
	return LIGHT


static func get_sum (param_value_1: S01_StringParamValue, param_value_2: S01_StringParamValue) -> S01_StringParamValue:
	
	match param_value_1.value:
		LIGHT.value:
			match param_value_2.value:
				LIGHT.value: return LIGHT
				USUAL.value: return USUAL
				HEAVY.value: return HEAVY
		USUAL.value:
			match param_value_2.value:
				LIGHT.value: return USUAL
				USUAL.value: return USUAL
				HEAVY.value: return HEAVY
		HEAVY.value:
			return HEAVY
	
	printerr ("Houston!")
	return null
