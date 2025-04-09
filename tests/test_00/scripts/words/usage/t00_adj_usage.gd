class_name T00_AdjUsage extends T00_WordUsage
## Объект, описывающий использование прилагательного: его род, число, одушевленность и падеж.


## Род, в котором используется прилагательное. Константа класса T00_WordGender.
var _gender: int
## Число, в котором используется прилагательное. Константа класса T00_WordNumber.
var _number: int
## Одушевленность, в котором используется прилагательное. Константа класса T00_WordAnimacy.
var _animacy: int
## Падеж, в котором используется прилагательное. Константа класса T00_WordCase.
var _case: int


func setup (gender: int, number: int, animacy: int, case: int) -> T00_AdjUsage:
	
	_gender = gender
	_number = number
	_animacy = animacy
	_case = case
	return self


func to_initial () -> T00_AdjUsage:
	
	_gender = T00_WordGender.MASCULINE
	_number = T00_WordNumber.SINGLE
	_animacy = T00_WordAnimacy.INANIMATE
	_case = T00_WordCase.NOMINATIVE
	return self


static func create_initial () -> T00_AdjUsage:
	
	return T00_AdjUsage.new ().to_initial ()


func clone () -> T00_WordUsage:
	
	return T00_AdjUsage.new ().setup (_gender, _number, _animacy, _case)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __gender (value: int) -> T00_AdjUsage:
	_gender = value
	return self

func __number (value: int) -> T00_AdjUsage:
	_number = value
	return self

func __animacy (value: int) -> T00_AdjUsage:
	_animacy = value
	return self

func __case (value: int) -> T00_AdjUsage:
	_case = value
	return self
