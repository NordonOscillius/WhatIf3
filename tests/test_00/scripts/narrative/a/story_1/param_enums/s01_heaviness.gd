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


static func debug_test ():
	
	print ("LIGHT: ", LIGHT.value, ", USUAL: ", USUAL.value, ", HEAVY: ", HEAVY.value)
	print ("LIGHT + LIGHT = ", get_sum (LIGHT, LIGHT).value)
	print ("LIGHT + USUAL = ", get_sum (LIGHT, USUAL).value)
	print ("LIGHT + HEAVY = ", get_sum (LIGHT, HEAVY).value)
	print ("USUAL + LIGHT = ", get_sum (USUAL, LIGHT).value)
	print ("USUAL + USUAL = ", get_sum (USUAL, USUAL).value)
	print ("USUAL + HEAVY = ", get_sum (USUAL, HEAVY).value)
	print ("HEAVY + LIGHT = ", get_sum (HEAVY, LIGHT).value)
	print ("HEAVY + USUAL = ", get_sum (HEAVY, USUAL).value)
	print ("HEAVY + HEAVY = ", get_sum (HEAVY, HEAVY).value)
	print ("LIGHT: ", LIGHT.value, ", USUAL: ", USUAL.value, ", HEAVY: ", HEAVY.value)
	print ("Increased LIGHT: ", increase (LIGHT).value)
	print ("Increased USUAL: ", increase (USUAL).value)
	print ("Increased HEAVY: ", increase (HEAVY).value)
	print ("Decreased LIGHT: ", decrease (LIGHT).value)
	print ("Decreased USUAL: ", decrease (USUAL).value)
	print ("Decreased HEAVY: ", decrease (HEAVY).value)
	print ("LIGHT: ", LIGHT.value, ", USUAL: ", USUAL.value, ", HEAVY: ", HEAVY.value)


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
