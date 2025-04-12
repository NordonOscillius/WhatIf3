class_name S01_LocationType extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Тип Локации".


## Кабинет в здании полиции.
static var POLICE_CABINET: S01_StringParamValue = create_param_value (&"police_cabinet")
## Опен-спейс в колл-центре, где работают продавцы холодного обзвона.
static var CALL_CENTER_OPEN_SPACE: S01_StringParamValue = create_param_value (&"call_center_open_space")
## Классная комната.
static var CLASSROOM: S01_StringParamValue = create_param_value (&"classroom")
## Офис юриста.
static var LAWYER_OFFICE: S01_StringParamValue = create_param_value (&"lawyer_office")
## Прихожая (большая или маленькая).
static var HALLWAY: S01_StringParamValue = create_param_value (&"hallway")
## Подъезд в многоквартирном доме (с почтовыми ящиками).
static var APARTMENT_ENTRANCE: S01_StringParamValue = create_param_value (&"apartment_entrance")
## Передний двор (у дома, особняка).
static var FRONT_YARD: S01_StringParamValue = create_param_value (&"front_yard")


## Создает значение параметра категории S01_ParamClass.LOCATION_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.LOCATION_TYPE, value)


## Возвращает тип локации, используемой в Интродакшене.
static func select_for_intro_location () -> S01_StringParamValue:
	
	var story: S01_Story = T00_A_Globals.story
	var introduction_place_type: S01_ParamValue = story.get_param (S01_Story.PNAME__INTRODUCTION_PLACE_TYPE)
	match introduction_place_type.get_value_variant ():
		S01_IntroductionPlaceType.HERO_HOME.value:
			return HALLWAY
		S01_IntroductionPlaceType.HERO_WORK.value:
			# Просим Историю прояснить личность героя: кто он по профессии.
			var hero_occupation: S01_ParamValue = story.get_or_clarify_hero_occupation ()
			match hero_occupation.get_value_variant ():
				S01_Occupation.FARMER.value:
					return HALLWAY
				S01_Occupation.CARPENTER.value:
					return HALLWAY
				S01_Occupation.SALESMAN.value:
					return CALL_CENTER_OPEN_SPACE
				S01_Occupation.TEACHER.value:
					return CLASSROOM
				S01_Occupation.LAWYER.value:
					return LAWYER_OFFICE
			
			printerr ("Not implemented")
			return null
		S01_IntroductionPlaceType.POLICE_OFFICE.value:
			return POLICE_CABINET
	
	printerr ("Couldn't select a param value for LocationType.")
	return null
