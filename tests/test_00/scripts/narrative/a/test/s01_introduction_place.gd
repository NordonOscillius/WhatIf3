class_name S01_IntroductionPlace extends RefCounted


static var UNKNOWN: int = 0
static var HERO_HOME: int = 1
static var HERO_WORK: int = 2
static var POLICE_OFFICE: int = 3

var _state: int


func _init ():
	pass


func generate (randomizer: RandomNumberGenerator) -> S01_IntroductionPlace:
	
	_state = randomizer.randi_range (0, 2)
	return self
