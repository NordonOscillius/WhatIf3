class_name S01_Story extends S01_Parametric


# Название параметра: тип Интродьюсера.
static var PNAME__INTRODUCER_TYPE: StringName = &"introducer_type"
# Название параметра: тип места Интродакшена.
static var PNAME__INTRODUCTION_PLACE_TYPE: StringName = &"introduction_place_type"


var _hero: S01_Person
var _x: S01_Person
var _introducer: S01_Person
var _clue_container: S01_ClueContainer

var _locations: Array[S01_Location] = []


func _init ():
	
	_name = &"story"


func generate ():
	
	_hero = S01_Person.new ()
	_hero.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.HERO)
	
	_x = S01_Person.new ()
	_x.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.X)
	
	_introducer = S01_Person.new ()
	_introducer.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.INTRODUCER)
	
	set_param (PNAME__INTRODUCER_TYPE, S01_IntroducerType.pick_random_for_story ())
	set_param (PNAME__INTRODUCTION_PLACE_TYPE, S01_IntroductionPlaceType.select_for_story ())
	
	var intro_location: S01_Location = S01_Location.new ()
	intro_location.set_param (S01_Location.PNAME__STORY_ROLE, S01_LocationStoryRole.INTRODUCTION_PLACE)
	intro_location.set_param (S01_Location.PNAME__LOCATION_TYPE, S01_LocationType.select_for_intro_location ())
	_locations.push_back (intro_location)
	
	# Генерируется с предметами внутри, включая зацепку.
	_clue_container = S01_ClueContainer.new ()
	_clue_container.generate ()
	
	pass


## Возвращает род деятельности героя; если до вызова метода род деятельности героя не был установлен, устанавливает его.
func get_or_clarify_hero_occupation () -> S01_ParamValue:
	
	var occupation: S01_ParamValue = _hero.get_param (S01_Person.PNAME__OCCUPATION)
	if !occupation:
		occupation = S01_Occupation.select_for_hero ()
		_hero.set_param (S01_Person.PNAME__OCCUPATION, occupation)
	
	return occupation

