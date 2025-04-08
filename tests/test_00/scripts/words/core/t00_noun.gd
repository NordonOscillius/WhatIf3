class_name T00_Noun extends T00_Lexeme


var _single_forms: T00_NounCaseForms
var _plural_forms: T00_NounCaseForms
## Род существительного - константа класса T00_WordGender.
var _gender: int
## Одушевленность - константа класса T00_WordAnimacy.
var _animacy: int = T00_WordAnimacy.INANIMATE


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __single_forms (value: T00_NounCaseForms) -> T00_Noun:
	_single_forms = value
	return self

func __plural_forms (value: T00_NounCaseForms) -> T00_Noun:
	_plural_forms = value
	return self

func __gender (value: int) -> T00_Noun:
	_gender = value
	return self

func __animacy (value: int) -> T00_Noun:
	_animacy = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

#func get_form_for_case_and_number (case: int, number: int) -> String:
func get_form (case: int, number: int) -> String:
	
	match number:
		T00_WordNumber.SINGLE:
			return _single_forms.get_form_for_case (case)
		T00_WordNumber.PLURAL:
			return _plural_forms.get_form_for_case (case)
		_:
			printerr ("Unknown value for 'number' parameter (T00_WordNumber).")
			return ""


func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage != null)
	return get_form (noun_usage._case, noun_usage._number)


