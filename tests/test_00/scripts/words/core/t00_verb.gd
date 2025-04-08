class_name T00_Verb extends T00_Lexeme

# Инфинитив.
var _infinitive: String

# Past tense.
var _past_plural: String
var _past_masculine: String
var _past_feminine: String
var _past_neuter: String

# Present tense.
var _present_first_single: String
var _present_first_plural: String
var _present_second_single: String
var _present_second_plural: String
var _present_third_single: String
var _present_third_plural: String

# Future tense.
var _future_first_single: String
var _future_first_plural: String
var _future_second_single: String
var _future_second_plural: String
var _future_third_single: String
var _future_third_plural: String


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __infinitive (value: String) -> T00_Verb:
	_infinitive = value
	return self

func __past_plural (value: String) -> T00_Verb:
	_past_plural = value
	return self

func __past_masculine (value: String) -> T00_Verb:
	_past_masculine = value
	return self

func __past_feminine (value: String) -> T00_Verb:
	_past_feminine = value
	return self

func __past_neuter (value: String) -> T00_Verb:
	_past_neuter = value
	return self

func __present_first_single (value: String) -> T00_Verb:
	_present_first_single = value
	return self

func __present_first_plural (value: String) -> T00_Verb:
	_present_first_plural = value
	return self

func __present_second_single (value: String) -> T00_Verb:
	_present_second_single = value
	return self

func __present_second_plural (value: String) -> T00_Verb:
	_present_second_plural = value
	return self

func __present_third_single (value: String) -> T00_Verb:
	_present_third_single = value
	return self

func __present_third_plural (value: String) -> T00_Verb:
	_present_third_plural = value
	return self

func __future_first_single (value: String) -> T00_Verb:
	_future_first_single = value
	return self

func __future_first_plural (value: String) -> T00_Verb:
	_future_first_plural = value
	return self

func __future_second_single (value: String) -> T00_Verb:
	_future_second_single = value
	return self

func __future_second_plural (value: String) -> T00_Verb:
	_future_second_plural = value
	return self

func __future_third_single (value: String) -> T00_Verb:
	_future_third_single = value
	return self

func __future_third_plural (value: String) -> T00_Verb:
	_future_third_plural = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

## Возвращает форму глагола по его времени, лицу, роду и числу. Если в качестве всех параметров указаны значения UNKNOWN, то метод вернет инфинитив.
func get_form (tense: int, person: int, gender: int, number: int) -> String:
	
	# Особый случай: нужно вернуть инфинитив.
	if tense == T00_WordTense.UNKNOWN && person == T00_WordPerson.UNKNOWN && gender == T00_WordGender.UNKNOWN && number == T00_WordNumber.UNKNOWN:
		return _infinitive
	
	match tense:
		T00_WordTense.PAST:
			match number:
				T00_WordNumber.PLURAL: return _past_plural
				T00_WordNumber.SINGLE:
					match gender:
						T00_WordGender.MASCULINE: return _past_masculine
						T00_WordGender.FEMININE: return _past_feminine
						T00_WordGender.NEUTER: return _past_neuter
						_:
							printerr ("Unknown 'gender' parameter.")
							return ""
				_:
					printerr ("Unknown 'number' parameter.")
					return ""
		T00_WordTense.PRESENT:
			match person:
				T00_WordPerson.FIRST:
					match number:
						T00_WordNumber.SINGLE: return _present_first_single
						T00_WordNumber.PLURAL: return _present_first_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				T00_WordPerson.SECOND:
					match number:
						T00_WordNumber.SINGLE: return _present_second_single
						T00_WordNumber.PLURAL: return _present_second_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				T00_WordPerson.THIRD:
					match number:
						T00_WordNumber.SINGLE: return _present_third_single
						T00_WordNumber.PLURAL: return _present_third_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				_:
					printerr ("Unknown 'person' parameter.")
		T00_WordTense.FUTURE:
			match person:
				T00_WordPerson.FIRST:
					match number:
						T00_WordNumber.SINGLE: return _future_first_single
						T00_WordNumber.PLURAL: return _future_first_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				T00_WordPerson.SECOND:
					match number:
						T00_WordNumber.SINGLE: return _future_second_single
						T00_WordNumber.PLURAL: return _future_second_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				T00_WordPerson.THIRD:
					match number:
						T00_WordNumber.SINGLE: return _future_third_single
						T00_WordNumber.PLURAL: return _future_third_plural
						_:
							printerr ("Unknown 'number' parameter.")
							return ""
				_:
					printerr ("Unknown 'person' parameter.")
		_:
			printerr ("Unknown 'tense' parameter.")
			return ""
	
	printerr ("Не знаю, как мы дошли до такой ошибки. Этого не может быть. Никак.")
	return ""


func get_form_for (usage: T00_WordUsage) -> String:
	
	var verb_usage: T00_VerbUsage = usage as T00_VerbUsage
	assert (verb_usage != null)
	return get_form (verb_usage._tense, verb_usage._person, verb_usage._gender, verb_usage._number)


## Возвращает форму глагола, которую можно употребить с существительным noun в числе number и времени tense. По умолчанию используется третье лицо ("Птица поет", "Корабль плыл"), но при необходимости можно указать первое или второе лицо, чтобы в дальнейшем заменить существительное местоимением, которое его заменяет: "Я (Иван) пою", "Он (Иван) поет".
func get_form_for_noun (noun: T00_Noun, tense: int, number: int, person: int = T00_WordPerson.THIRD) -> String:
	
	return get_form (tense, person, noun._gender, number)

