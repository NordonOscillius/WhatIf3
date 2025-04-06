class_name T00_Noun extends RefCounted


var _single_forms: T00_CaseForms
var _plural_forms: T00_CaseForms
# T00_WordGender.
var _gender: int


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __single_forms (value: T00_CaseForms) -> T00_Noun:
	_single_forms = value
	return self

func __plural_forms (value: T00_CaseForms) -> T00_Noun:
	_plural_forms = value
	return self

func __gender (value: int) -> T00_Noun:
	_gender = value
	return self
