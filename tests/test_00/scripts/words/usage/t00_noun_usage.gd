class_name T00_NounUsage extends T00_WordUsage
## Объект, описывающий использование существительного: его падеж и число.


## Падеж, в котором используется существительное. Константа класса T00_WordCase.
var _case: int
## Число, в котором используется существительное. Константа класса T00_WordNumber.
var _number: int


func setup (case: int, number: int) -> T00_NounUsage:
	
	_case = case
	_number = number
	return self


func to_initial () -> T00_NounUsage:
	
	_case = T00_WordCase.NOMINATIVE
	_number = T00_WordNumber.SINGLE
	return self


static func create_initial () -> T00_NounUsage:
	
	return T00_NounUsage.new ().to_initial ()


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __case (value: int) -> T00_NounUsage:
	_case = value
	return self

func __number (value: int) -> T00_NounUsage:
	_number = value
	return self
