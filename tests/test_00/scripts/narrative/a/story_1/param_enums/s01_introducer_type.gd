class_name S01_IntroducerType extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Тип Интродьюсера". Влияет на определение ветки истории.


## Интродьюсер - офицер полиции, который закрывает дело о исчезновении Икса.
static var POLICE_OFFICER: S01_StringParamValue = create_param_value (&"police_officer")
## Интродьюсер - незнакомец, которому Икс передал послание.
static var STRANGER: S01_StringParamValue = create_param_value (&"stranger")
## Интродьюсер - курьер, приехавший с посылкой к герою (домой или на работу).
static var COURIER: S01_StringParamValue = create_param_value (&"courier")


## Создает значение параметра категории S01_ParamClass.INTRODUCER_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.INTRODUCER_TYPE, value)


## Возвращает массив, содержащий все варианты Значений Параметра класса INTRODUCER_TYPE, приемлемые для истории S01_Story.
static func get_choices_for_story () -> Array[S01_StringParamValue]:
	
	return [POLICE_OFFICER, STRANGER, COURIER]
