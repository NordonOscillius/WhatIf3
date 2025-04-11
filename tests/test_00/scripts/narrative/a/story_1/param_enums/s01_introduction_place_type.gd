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


## Возвращает массив, содержащий все варианты Значений Параметра класса INTRODUCTION_PLACE_TYPE, приемлемые для истории S01_Story.
static func get_choices_for_story () -> Array[S01_StringParamValue]:
	
	return [HERO_HOME, HERO_WORK, POLICE_OFFICE]
