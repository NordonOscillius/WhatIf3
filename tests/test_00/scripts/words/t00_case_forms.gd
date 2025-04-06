class_name T00_CaseForms extends RefCounted

# Формы слова в разных падежах.

# Именительный: кто, что.
var _nominative: String
# Родительный: кого, чего.
var _genitive: String
# Дательный: кому, чему.
var _dative: String
# Винительный: кого, что.
var _accusative: String
# Творительный: кем, чем.
var _instrumental: String
# Предложный: о ком, о чем.
var _prepositional: String


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __nominative (value: String) -> T00_CaseForms:
	_nominative = value
	return self

func __genitive (value: String) -> T00_CaseForms:
	_genitive = value
	return self

func __dative (value: String) -> T00_CaseForms:
	_dative = value
	return self

func __accusative (value: String) -> T00_CaseForms:
	_accusative = value
	return self

func __instrumental (value: String) -> T00_CaseForms:
	_instrumental = value
	return self

func __prepositional (value: String) -> T00_CaseForms:
	_prepositional = value
	return self
