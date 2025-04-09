class_name T00_VerbUsage extends T00_WordUsage
## Объект, описывающий использование глагола: его время, лицо, род и число.


## Время, в котором используется глагол. Константа класса T00_WordTense.
var _tense: int
## Лицо, в котором используется глагол. Константа класса T00_WordPerson.
var _person: int
## Род, в котором используется глагол. Константа класса T00_WordGender.
var _gender: int
## Число, в котором используется глагол. Константа класса T00_WordNumber.
var _number: int


func setup (tense: int, person: int, gender: int, number: int) -> T00_VerbUsage:
	
	_tense = tense
	_person = person
	_gender = gender
	_number = number
	return self


func to_infinitive () -> T00_VerbUsage:
	
	_tense = T00_WordTense.UNKNOWN
	_person = T00_WordPerson.UNKNOWN
	_gender = T00_WordGender.UNKNOWN
	_number = T00_WordNumber.UNKNOWN
	return self


static func create_infinitive () -> T00_VerbUsage:
	
	return T00_VerbUsage.new ().to_infinitive ()


func clone () -> T00_WordUsage:
	
	return T00_VerbUsage.new ().setup (_tense, _person, _gender, _number)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __tense (value: int) -> T00_VerbUsage:
	_tense = value
	return self

func __person (value: int) -> T00_VerbUsage:
	_person = value
	return self

func __gender (value: int) -> T00_VerbUsage:
	_gender = value
	return self

func __number (value: int) -> T00_VerbUsage:
	_number = value
	return self
