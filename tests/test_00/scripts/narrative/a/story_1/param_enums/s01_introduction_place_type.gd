class_name S01_IntroductionPlaceType extends S01_ParamEnum
## Перечислитель типа места, где происходит Интродакшен. Участвует в определении ветки истории.


## Интродакшен происходит у героя дома.
static var HERO_HOME: S01_StringParamValue = create_param_value (&"hero_home")
## Интродакшен происходит у героя на работе.
static var HERO_WORK: S01_StringParamValue = create_param_value (&"hero_work")
## Интродакшен происходит в кабинете полицейского.
static var POLICE_OFFICE: S01_StringParamValue = create_param_value (&"police_office")


## Создает значение параметра категории S01_ParamClass.INTRODUCTION_PLACE_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.INTRODUCTION_PLACE_TYPE, value)


## Случайный образом возвращает одно из Значений Параметра этого перечислителя (используется глобальный рандомайзер).
static func select_for_story () -> S01_StringParamValue:
	
	var story: S01_Story = T00_A_Globals.story
	var introducer_type: S01_ParamValue = story.get_param (S01_Story.PNAME__INTRODUCER_TYPE)
	var choices: Array[S01_ParamValue]
	match introducer_type.get_value_variant ():
		S01_IntroducerType.POLICE_OFFICER.value:
			return POLICE_OFFICE
		S01_IntroducerType.STRANGER.value:
			return HERO_HOME
		S01_IntroducerType.COURIER.value:
			choices = [HERO_HOME, HERO_WORK]
			return S01_ParamValue.pick_random_param_value (choices)
	
	printerr ("Couldn't select a param value for IntroductionPlaceType; introducer_type = ", introducer_type.get_value_variant ())
	return null
