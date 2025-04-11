class_name S01_IntroductionPlaceType extends RefCounted
## Тип места, где происходит Интродакшен. Участвует в определении ветки истории.


static var HERO_HOME: S01_StringParamValue = create_param_value (&"hero_home")
static var HERO_WORK: S01_StringParamValue = create_param_value (&"hero_work")
static var POLICE_OFFICE: S01_StringParamValue = create_param_value (&"police_office")


## Создает значение параметра категории S01_ParamClass.INTRODUCTION_PLACE_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.INTRODUCTION_PLACE_TYPE, value)
