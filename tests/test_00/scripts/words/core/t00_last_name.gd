class_name T00_LastName extends T00_Lexeme


var _masculine_single_forms: T00_NounCaseForms
var _feminine_single_forms: T00_NounCaseForms
var _plural_forms: T00_NounCaseForms


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __masculine_single_forms (value: T00_NounCaseForms) -> T00_LastName:
	_masculine_single_forms = value
	return self

func __feminine_single_forms (value: T00_NounCaseForms) -> T00_LastName:
	_feminine_single_forms = value
	return self

func __plural_forms (value: T00_NounCaseForms) -> T00_LastName:
	_plural_forms = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

func get_form (case: int, number: int, gender: int) -> String:
	
	if number == T00_WordNumber.PLURAL:
		return _plural_forms.get_form_for_case (case)
	
	if number != T00_WordNumber.SINGLE:
		printerr ("Unknown word number value.")
		return ""
	
	match gender:
		T00_WordGender.MASCULINE: return _masculine_single_forms.get_form_for_case (case)
		T00_WordGender.FEMININE: return _feminine_single_forms.get_form_for_case (case)
	
	printerr ("Can't define Last Name's form.")
	return ""


func get_form_for (usage: T00_WordUsage) -> String:
	
	var last_name_usage: T00_LastNameUsage = usage as T00_LastNameUsage
	assert (last_name_usage)
	return get_form (last_name_usage._case, last_name_usage._number, last_name_usage._gender)

