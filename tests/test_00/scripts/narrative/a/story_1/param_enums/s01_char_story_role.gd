class_name S01_CharStoryRole extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Роль персонажа в истории".


static var UNKNOWN: S01_StringParamValue = create_param_value (&"unknown")
static var HERO: S01_StringParamValue = create_param_value (&"hero")
static var X: S01_StringParamValue = create_param_value (&"x")
static var INTRODUCER: S01_StringParamValue = create_param_value (&"introducer")
static var EVIL_BOSS: S01_StringParamValue = create_param_value (&"evil_boss")
static var EVIL_HELPER: S01_StringParamValue = create_param_value (&"evil_helper")


## Создает значение параметра категории S01_ParamClass.CHAR_STORY_ROLE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.CHAR_STORY_ROLE, value)
