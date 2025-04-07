class_name T00_NounCaseForms extends RefCounted
## Формы существительного в разных падежах (в одном из чисел: единственном или множественном).


## Именительный: кто, что.
var _nominative: String
## Родительный: кого, чего.
var _genitive: String
## Дательный: кому, чему.
var _dative: String
## Винительный: кого, что.
var _accusative: String
## Творительный: кем, чем.
var _instrumental: String
## Предложный: о ком, о чем.
var _prepositional: String


func setup (nominative: String, genitive: String, dative: String, accusative: String, instrumental: String, prepositional: String) -> T00_NounCaseForms:
	
	_nominative = nominative
	_genitive = genitive
	_dative = dative
	_accusative = accusative
	_instrumental = instrumental
	_prepositional = prepositional
	return self

# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

## Именительный: кто, что.
func __nominative (value: String) -> T00_NounCaseForms:
	_nominative = value
	return self

## Родительный: кого, чего.
func __genitive (value: String) -> T00_NounCaseForms:
	_genitive = value
	return self

## Дательный: кому, чему.
func __dative (value: String) -> T00_NounCaseForms:
	_dative = value
	return self

## Винительный: кого, что.
func __accusative (value: String) -> T00_NounCaseForms:
	_accusative = value
	return self

## Творительный: кем, чем.
func __instrumental (value: String) -> T00_NounCaseForms:
	_instrumental = value
	return self

## Предложный: о ком, о чем.
func __prepositional (value: String) -> T00_NounCaseForms:
	_prepositional = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

## Возвращает форму существительного по указанному падежу.
func get_form_for_case (case: int) -> String:
	
	match case:
		T00_WordCase.NOMINATIVE:
			return _nominative
		T00_WordCase.GENITIVE:
			return _genitive
		T00_WordCase.DATIVE:
			return _dative
		T00_WordCase.ACCUSATIVE:
			return _accusative
		T00_WordCase.INSTRUMENTAL:
			return _instrumental
		T00_WordCase.PREPOSITIONAL:
			return _prepositional
		_:
			printerr ("Case not found.")
			return ""
