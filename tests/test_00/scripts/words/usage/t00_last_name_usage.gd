class_name T00_LastNameUsage extends T00_WordUsage
## Объект, описывающий использование фамилии: род, число и падеж.


## Падеж, в котором используется фамилия. Константа класса T00_WordCase.
var _case: int
## Число, в котором используется фамилия. Константа класса T00_WordNumber.
var _number: int
## Род, в котором используется фамилия. Константа класса T00_WordGender.
var _gender: int


func setup (case: int, number: int, gender: int) -> T00_LastNameUsage:
	
	_case = case
	_number = number
	_gender = gender
	return self


func to_initial () -> T00_LastNameUsage:
	
	_case = T00_WordCase.NOMINATIVE
	_number = T00_WordNumber.SINGLE
	_gender = T00_WordGender.MASCULINE
	return self


static func create_initial () -> T00_LastNameUsage:
	
	return T00_LastNameUsage.new ().to_initial ()


func clone () -> T00_WordUsage:
	
	return T00_LastNameUsage.new ().setup (_case, _number, _gender)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __case (value: int) -> T00_LastNameUsage:
	_case = value
	return self

func __number (value: int) -> T00_LastNameUsage:
	_number = value
	return self

func __gender (value: int) -> T00_LastNameUsage:
	_gender = value
	return self

