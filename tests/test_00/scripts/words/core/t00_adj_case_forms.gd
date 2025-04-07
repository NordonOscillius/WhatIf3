class_name T00_AdjCaseForms extends RefCounted
## Формы прилагательного в разных падежах.


## Именительный: муж какой, жена какая, солнце какое.
var _nominative: String
## Родительный: нет мужа какого, жены какой, солнца какого.
var _genitive: String
## Дательный: дать мужу какому, жене какой, солнцу какому.
var _dative: String
## Винительный (одушевленный): винить мужа какого, жену какую, солнце какое.
var _accusative_animate: String
## Винительный (неодушевленный): винить стул какой, табуретку какую, солнце какое.
var _accusative_inanimate: String
## Творительный: творить мужем каким, женой какой, солнцем каким.
var _instrumental: String
## Предложный: о муже каком, о жене какой, о солнце каком.
var _prepositional: String


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

## Именительный: муж какой, жена какая, солнце какое.
func __nominative (value: String) -> T00_AdjCaseForms:
	_nominative = value
	return self

## Родительный: нет мужа какого, жены какой, солнца какого.
func __genitive (value: String) -> T00_AdjCaseForms:
	_genitive = value
	return self

## Дательный: дать мужу какому, жене какой, солнцу какому.
func __dative (value: String) -> T00_AdjCaseForms:
	_dative = value
	return self

## Винительный (одушевленный): винить мужа какого, жену какую, солнце какое.
func __accusative_animate (value: String) -> T00_AdjCaseForms:
	_accusative_animate = value
	return self

## Винительный (неодушевленный): винить стул какой, табуретку какую, солнце какое.
func __accusative_inanimate (value: String) -> T00_AdjCaseForms:
	_accusative_inanimate = value
	return self

## Творительный: творить мужем каким, женой какой, солнцем каким.
func __instrumental (value: String) -> T00_AdjCaseForms:
	_instrumental = value
	return self

## Предложный: о муже каком, о жене какой, о солнце каком.
func __prepositional (value: String) -> T00_AdjCaseForms:
	_prepositional = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

func get_form_for_case_and_animacy (case: int, animacy: int) -> String:
	
	match case:
		T00_WordCase.NOMINATIVE:
			return _nominative
		T00_WordCase.GENITIVE:
			return _genitive
		T00_WordCase.DATIVE:
			return _dative
		T00_WordCase.ACCUSATIVE:
			if animacy == T00_WordAnimacy.ANIMATE:
				return _accusative_animate
			return _accusative_inanimate
		T00_WordCase.INSTRUMENTAL:
			return _instrumental
		T00_WordCase.PREPOSITIONAL:
			return _prepositional
		_:
			printerr ("Wrong case value.")
			return ""

