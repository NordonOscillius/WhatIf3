class_name S01_LivingPlace extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Место проживания".


## Неизвестное место проживания.
static var UNKNOWN: S01_StringParamValue = create_param_value (&"unknown")
## Место проживания: отсутствует. Использовать для бродяг.
static var NONE: S01_StringParamValue = create_param_value (&"none")
## Место проживания: дом.
static var HOUSE: S01_StringParamValue = create_param_value (&"house")
## Место проживания: квартира в многоквартирном доме.
static var APARTMENT: S01_StringParamValue = create_param_value (&"apartment")


## Создает значение параметра категории S01_ParamClass.LIVING_PLACE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.LIVING_PLACE, value)


## Выбирает место проживания для переданного героя.
static func select_for_hero (hero: S01_Person) -> S01_StringParamValue:
	
	if !S01_CharStoryRole.HERO.equals (hero.get_param (S01_Person.PNAME__STORY_ROLE)):
		printerr ("Hero is not a hero...")
		return null
	
	var hero_occupation: S01_ParamValue = T00_A_Globals.story.get_or_clarify_hero_occupation ()
	match hero_occupation.get_value_variant ():
		S01_Occupation.UNKNOWN.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE, APARTMENT])
		S01_Occupation.HOMELESS.value: return S01_ParamValue.pick_random_string_param_value ([NONE])
		S01_Occupation.JANITOR.value: return S01_ParamValue.pick_random_string_param_value ([APARTMENT])
		S01_Occupation.BUILDER.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE, APARTMENT])
		S01_Occupation.FARMER.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE])
		S01_Occupation.CAR_MECHANIC.value: return S01_ParamValue.pick_random_string_param_value ([APARTMENT])
		S01_Occupation.CARPENTER.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE])
		S01_Occupation.SALESMAN.value: return S01_ParamValue.pick_random_string_param_value ([APARTMENT])
		S01_Occupation.TEACHER.value: return S01_ParamValue.pick_random_string_param_value ([APARTMENT])
		S01_Occupation.DOCTOR.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE])
		S01_Occupation.LAWYER.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE])
		S01_Occupation.DETECTIVE.value: return S01_ParamValue.pick_random_string_param_value ([APARTMENT])
		S01_Occupation.PENSIONER.value: return S01_ParamValue.pick_random_string_param_value ([HOUSE, APARTMENT])
	
	printerr ("Can't select a Living Place for a hero.")
	return null
