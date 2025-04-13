class_name T00_Constituent extends RefCounted
## Член предложения - лексема с присвоенной ей ролью внутри фразы.


## Лексема: существительное, прилагательное, глагол.
var _lexeme: T00_Lexeme
## Роль члена предложения: подлежащее, сказуемое, определение. Константа класса T00_ConstituentRole.
var _role: int


func setup (lexeme: T00_Lexeme, role: int) -> T00_Constituent:
	
	_lexeme = lexeme
	_role = role
	return self


func __lexeme (value: T00_Lexeme) -> T00_Constituent:
	_lexeme = value
	return self

func __role (value: int) -> T00_Constituent:
	_role = value
	return self
