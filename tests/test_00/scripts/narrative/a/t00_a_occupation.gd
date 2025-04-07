class_name T00_A_Occupation extends RefCounted


static var HOMELESS: int = 0
static var JANITOR: int = 1
static var BUILDER: int = 2
static var FARMER: int = 3
static var CAR_MECHANIC: int = 4
static var CARPENTER: int = 5
static var SALESMAN: int = 6
static var TEACHER: int = 7
static var DOCTOR: int = 8
static var LAWYER: int = 9
static var DETECTIVE: int = 10
static var PENSIONER: int = 11

var _type: int
var _male_name: T00_Noun
var _female_name: T00_Noun


func _init (type: int):
	
	_type = type
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match type:
		HOMELESS:
			_male_name = w.brodyaga
			_female_name = w.brodyaga
		JANITOR:
			_male_name = w.uborschik
			_female_name = w.uborschitsa
		BUILDER:
			_male_name = w.stroitel
			_female_name = w.stroitel
		FARMER:
			_male_name = w.fermer
			_female_name = w.fermer
		CAR_MECHANIC:
			_male_name = w.avtoslesar
			_female_name = w.avtoslesar
		CARPENTER:
			_male_name = w.plotnik
			_female_name = w.plotnik
		SALESMAN:
			_male_name = w.prodavets
			_female_name = w.prodavets
		TEACHER:
			_male_name = w.uchitel
			_female_name = w.uchitelnitsa
		DOCTOR:
			_male_name = w.doctor
			_female_name = w.doctor
		LAWYER:
			_male_name = w.yurist
			_female_name = w.yurist
		DETECTIVE:
			_male_name = w.detectiv
			_female_name = w.detectiv
		PENSIONER:
			_male_name = w.pensioner
			_female_name = w.pensioner


static func generate_for_hero (randomizer: RandomNumberGenerator) -> T00_A_Occupation:
	
	var types: Array[int] = [SALESMAN, TEACHER, DOCTOR]
	var type_index: int = randomizer.randi_range (0, types.size () - 1)
	return T00_A_Occupation.new (types[type_index])
