class_name S01_Story extends S01_Parametric


# Название параметра: тип места Интродакшена.
static var PNAME__INTRODUCTION_PLACE_TYPE: StringName = &"introduction_place_type"
# Название параметра: тип Интродьюсера.
static var PNAME__INTRODUCER_TYPE: StringName = &"introducer_type"


var _hero: S01_Person
var _x: S01_Person
var _introducer: S01_Person


func _init ():
	
	_hero = S01_Person.new ()
	_hero.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.HERO)
	
	_x = S01_Person.new ()
	_x.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.X)
	
	_introducer = S01_Person.new ()
	_introducer.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.INTRODUCER)
	
	set_param (PNAME__INTRODUCER_TYPE, S01_ParamValue.pick_from_array (S01_IntroducerType.get_choices_for_story () as Array[S01_ParamValue], T00_A_Globals.randomizer))
	
	pass


