class_name S01_LocationStoryRole extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Роль Локации в истории".


static var UNKNOWN: S01_StringParamValue = create_param_value (&"unknown")
static var INTRODUCTION_PLACE: S01_StringParamValue = create_param_value (&"introduction_place")


## Создает значение параметра категории S01_ParamClass.LOCATION_STORY_ROLE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.LOCATION_STORY_ROLE, value)
