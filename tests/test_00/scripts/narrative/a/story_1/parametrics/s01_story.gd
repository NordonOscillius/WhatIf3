class_name S01_Story extends S01_Parametric


# Название параметра: тип Интродьюсера.
static var PNAME__INTRODUCER_TYPE: StringName = &"introducer_type"
# Название параметра: тип места Интродакшена.
static var PNAME__INTRODUCTION_PLACE_TYPE: StringName = &"introduction_place_type"
# Название параметра: кем Икс приходится герою. Категория: Family Relation или Friendship Relation.
static var PNAME__X_TO_HERO_RELATION: StringName = &"x_to_hero_relation"
# Название параметра: кем герой приходится Иксу. Категория: Family Relation или Friendship Relation.
static var PNAME__HERO_TO_X_RELATION: StringName = &"hero_to_x_relation"


var _hero: S01_Hero
var _x: S01_X
var _introducer: S01_Introducer
var _clue_container: S01_ClueContainer

var _locations: Array[S01_Location] = []


func _init ():
	
	_name = &"story"


func generate ():
	
	_hero = S01_Hero.new ()
	_hero.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.HERO)
	_hero.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
	_hero.pick_random_first_name_by_gender ()
	_hero.pick_random_last_name ()
	
	_x = S01_X.new ()
	_x.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.X)
	
	# Кем Икс приходится герою (родственник или друг), кем герой приходится Иксу и пол Икса.
	var x_to_hero_relation: S01_ParamValue = select_x_to_hero_relation ()
	set_param (PNAME__X_TO_HERO_RELATION, x_to_hero_relation)
	if x_to_hero_relation.param_class == S01_ParamClass.FAMILY_RELATION:
		_x.set_param (S01_Person.PNAME__GENDER, S01_Gender.get_for_family_relation (x_to_hero_relation))
		set_param (PNAME__HERO_TO_X_RELATION, S01_FamilyRelation.invert (x_to_hero_relation, _hero.get_gender ()))
	else:
		_x.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
		set_param (PNAME__HERO_TO_X_RELATION, x_to_hero_relation)
	
	_introducer = S01_Introducer.new ()
	_introducer.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.INTRODUCER)
	_introducer.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
	_introducer.pick_random_first_name_by_gender ([_hero._first_name])
	_introducer.pick_random_last_name ([_hero._last_name])
	
	set_param (PNAME__INTRODUCER_TYPE, S01_IntroducerType.pick_random_for_story ())
	set_param (PNAME__INTRODUCTION_PLACE_TYPE, S01_IntroductionPlaceType.select_for_story ())
	
	var intro_location: S01_Location = S01_Location.new ()
	intro_location.set_param (S01_Location.PNAME__STORY_ROLE, S01_LocationStoryRole.INTRODUCTION_PLACE)
	intro_location.set_param (S01_Location.PNAME__LOCATION_TYPE, S01_LocationType.select_for_intro_location ())
	_locations.push_back (intro_location)
	
	_hero.set_param (S01_Person.PNAME__LIVING_PLACE, S01_LivingPlace.select_for_hero (_hero))
	
	# Генерируется с предметами внутри, включая зацепку.
	_clue_container = S01_ClueContainer.new ()
	_clue_container.generate ()
	
	pass


func select_x_to_hero_relation () -> S01_ParamValue:
	
	var choices: Array[S01_ParamValue] = S01_FamilyRelation.get_choices_for_x_to_hero_relation ()
	choices.push_back (S01_FriendshipRelation.FRIEND)
	return S01_ParamValue.pick_random_param_value (choices)


## Возвращает род деятельности героя; если до вызова метода род деятельности героя не был установлен, устанавливает его.
func get_or_clarify_hero_occupation () -> S01_ParamValue:
	
	var occupation: S01_ParamValue = _hero.get_param (S01_Person.PNAME__OCCUPATION)
	if !occupation:
		occupation = S01_Occupation.select_for_hero ()
		_hero.set_param (S01_Person.PNAME__OCCUPATION, occupation)
	
	return occupation


# ==================================================
# ====================== TEXT ======================
# ==================================================

func get_text_for_outline__location () -> String:
	
	var intro_location: S01_Location = get_introduction_location ()
	if !intro_location:
		return "Генерация истории произошла с ошибкой: место действия первой сцены не определено."
	
	var loc_type: S01_ParamValue = intro_location.get_param (S01_Location.PNAME__LOCATION_TYPE)
	if !loc_type:
		return "Генерация истории произошла с ошибкой: место действия первой сцены не определено."
	
	# Берем инфу о том, где живет герой: в доме или квартире.
	var hero_living_place_text: String
	if S01_LivingPlace.APARTMENT.equals (_hero.get_living_place ()):
		hero_living_place_text = "квартиры"
	elif S01_LivingPlace.HOUSE.equals (_hero.get_living_place ()):
		hero_living_place_text = "дома"
	
	match loc_type.get_value_variant ():
		S01_LocationType.POLICE_CABINET.value:
			return "Действие начинается в кабинете полицейского участка."
		S01_LocationType.CALL_CENTER_OPEN_SPACE.value:
			return "Действие начинается в кабинете колл-центра."
		S01_LocationType.CLASSROOM.value:
			return "Действие начинается в классе школы."
		S01_LocationType.LAWYER_OFFICE.value:
			return "Действие начинается в офисе юридической конторы."
		S01_LocationType.HALLWAY.value:
			return "Действие начинается в прихожей " + hero_living_place_text + ", где живет главный герой."
		S01_LocationType.APARTMENT_ENTRANCE.value:
			return "Действие начинается в подъезде многоквартирного дома, где живет главный герой."
		S01_LocationType.FRONT_YARD.value:
			return "Действие начинается на дворе перед домом, где живет главный герой."
	
	printerr ("Wrong value for Location Type.")
	return ""


func get_text_for_outline__action () -> String:
	
	
	
	printerr ("Not implemented.")
	assert (false)
	return ""


func get_introduction_location () -> S01_Location:
	
	var i: int = _locations.size ()
	while i:
		i -= 1
		var location: S01_Location = _locations[i]
		var loc_story_role: S01_ParamValue = location.get_param (S01_Location.PNAME__STORY_ROLE)
		if loc_story_role && loc_story_role.get_value_variant () == S01_LocationStoryRole.INTRODUCTION_PLACE.value:
			return location
	
	return null
