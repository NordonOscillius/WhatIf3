class_name T00_NounOld extends RefCounted

# Declinable noun.

# Именительный: кто, что.
var _nominative_single: String
# Родительный: кого, чего.
var _genitive_single: String
# Дательный: кому, чему.
var _dative_single: String
# Винительный: кого, что.
var _accusative_single: String
# Творительный: кем, чем.
var _instrumental_single: String
# Предложный: о ком, о чем.
var _prepositional_single: String

# Именительный: кто, что.
var _nominative_plural: String
# Родительный: кого, чего.
var _genitive_plural: String
# Дательный: кому, чему.
var _dative_plural: String
# Винительный: кого, что.
var _accusative_plural: String
# Творительный: кем, чем.
var _instrumental_plural: String
# Предложный: о ком, о чем.
var _prepositional_plural: String


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __nominative_single (value: String) -> T00_NounOld:
	_nominative_single = value
	return self

func __genitive_single (value: String) -> T00_NounOld:
	_genitive_single = value
	return self

func __dative_single (value: String) -> T00_NounOld:
	_dative_single = value
	return self

func __accusative_single (value: String) -> T00_NounOld:
	_accusative_single = value
	return self

func __instrumental_single (value: String) -> T00_NounOld:
	_instrumental_single = value
	return self

func __prepositional_single (value: String) -> T00_NounOld:
	_prepositional_single = value
	return self

func __nominative_plural (value: String) -> T00_NounOld:
	_nominative_plural = value
	return self

func __genitive_plural (value: String) -> T00_NounOld:
	_genitive_plural = value
	return self

func __dative_plural (value: String) -> T00_NounOld:
	_dative_plural = value
	return self

func __accusative_plural (value: String) -> T00_NounOld:
	_accusative_plural = value
	return self

func __instrumental_plural (value: String) -> T00_NounOld:
	_instrumental_plural = value
	return self

func __prepositional_plural (value: String) -> T00_NounOld:
	_prepositional_plural = value
	return self
