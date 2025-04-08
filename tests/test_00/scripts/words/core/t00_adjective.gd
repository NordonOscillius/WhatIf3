class_name T00_Adjective extends T00_Lexeme


## Формы множественного числа для разных падежей.
var _plural_forms: T00_AdjCaseForms
## Формы мужского рода единственного числа для разных падежей.
var _masculine_single_forms: T00_AdjCaseForms
## Формы женского рода единственного числа для разных падежей.
var _feminine_single_forms: T00_AdjCaseForms
## Формы среднего рода единственного числа для разных падежей.
var _neuter_single_forms: T00_AdjCaseForms


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

## Формы множественного числа для разных падежей.
func __plural_forms (value: T00_AdjCaseForms) -> T00_Adjective:
	_plural_forms = value
	return self

## Формы мужского рода единственного числа для разных падежей.
func __masculine_single_forms (value: T00_AdjCaseForms) -> T00_Adjective:
	_masculine_single_forms = value
	return self

## Формы женского рода единственного числа для разных падежей.
func __feminine_single_forms (value: T00_AdjCaseForms) -> T00_Adjective:
	_feminine_single_forms = value
	return self

## Формы среднего рода единственного числа для разных падежей.
func __neuter_single_forms (value: T00_AdjCaseForms) -> T00_Adjective:
	_neuter_single_forms = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

func get_form (gender: int, number: int, animacy: int, case: int) -> String:
	
	if number == T00_WordNumber.PLURAL:
		return _plural_forms.get_form_for_case_and_animacy (case, animacy)
	
	match gender:
		T00_WordGender.MASCULINE:
			return _masculine_single_forms.get_form_for_case_and_animacy (case, animacy)
		T00_WordGender.FEMININE:
			return _feminine_single_forms.get_form_for_case_and_animacy (case, animacy)
		T00_WordGender.NEUTER:
			return _neuter_single_forms.get_form_for_case_and_animacy (case, animacy)
		_:
			printerr ("Wrong value for gender.")
			return ""


func get_form_for (usage: T00_WordUsage) -> String:
	
	var adj_usage: T00_AdjUsage = usage as T00_AdjUsage
	assert (adj_usage != null)
	return get_form (adj_usage._gender, adj_usage._number, adj_usage._animacy, adj_usage._case)


func get_form_for_noun (noun: T00_Noun, number: int, case: int) -> String:
	
	if number == T00_WordNumber.PLURAL:
		return _plural_forms.get_form_for_case_and_animacy (case, noun._animacy)
	
	match noun._gender:
		T00_WordGender.MASCULINE:
			return _masculine_single_forms.get_form_for_case_and_animacy (case, noun._animacy)
		T00_WordGender.FEMININE:
			return _feminine_single_forms.get_form_for_case_and_animacy (case, noun._animacy)
		T00_WordGender.NEUTER:
			return _neuter_single_forms.get_form_for_case_and_animacy (case, noun._animacy)
		_:
			printerr ("Wrong value for gender.")
			return ""

