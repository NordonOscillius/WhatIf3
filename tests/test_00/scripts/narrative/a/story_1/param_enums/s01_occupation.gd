class_name S01_Occupation extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Род деятельности персонажа".


static var UNKNOWN: S01_StringParamValue = create_param_value (&"unknown")
static var HOMELESS: S01_StringParamValue = create_param_value (&"homeless")
static var JANITOR: S01_StringParamValue = create_param_value (&"janitor")
static var BUILDER: S01_StringParamValue = create_param_value (&"builder")
static var FARMER: S01_StringParamValue = create_param_value (&"farmer")
static var CAR_MECHANIC: S01_StringParamValue = create_param_value (&"car_mechanic")
static var CARPENTER: S01_StringParamValue = create_param_value (&"carpenter")
static var SALESMAN: S01_StringParamValue = create_param_value (&"salesman")
static var TEACHER: S01_StringParamValue = create_param_value (&"teacher")
static var DOCTOR: S01_StringParamValue = create_param_value (&"doctor")
static var LAWYER: S01_StringParamValue = create_param_value (&"lawyer")
static var DETECTIVE: S01_StringParamValue = create_param_value (&"detective")
static var PENSIONER: S01_StringParamValue = create_param_value (&"persioner")


## Создает значение параметра категории S01_ParamClass.OCCUPATION.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.OCCUPATION, value)


static func select_for_hero () -> S01_StringParamValue:
	
	return S01_ParamValue.pick_random_string_param_value ([FARMER, CARPENTER, SALESMAN, TEACHER, LAWYER])
