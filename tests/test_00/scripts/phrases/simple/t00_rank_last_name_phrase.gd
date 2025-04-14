class_name T00_RankLastNamePhrase extends T00_SimplePhrase
## Фраза, объединяющая название должности и фамилию, например, "капитан Лебедева".


## Существительное, передающее название должности.
var _rank_noun: T00_Noun
## Фамилия лица.
var _last_name: T00_LastName
## Пол лица, для которого используется эта фраза. Это значение будет переопределять gender-значения запросов, связанных с получением конкретной формы фамилии (но не должности). Так, при _gender_override == S01_Gender.FEMALE фраза "лейтенант Михайлов" будет превращаться во фразу "лейтенант Михайлова".
var _gender: int


func setup (rank_noun: T00_Noun, last_name: T00_LastName, gender: int) -> T00_RankLastNamePhrase:
	
	_rank_noun = rank_noun
	_last_name = last_name
	_gender = gender
	return self


func clone_shallow () -> T00_RankLastNamePhrase:
	
	return T00_RankLastNamePhrase.new ().setup (_rank_noun, _last_name, _gender)


func __rank_noun (value: T00_Noun) -> T00_RankLastNamePhrase:
	_rank_noun = value
	return self

func __last_name (value: T00_LastName) -> T00_RankLastNamePhrase:
	_last_name = value
	return self

func __gender (value: int) -> T00_RankLastNamePhrase:
	_gender = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	
	var rank_string: String = _rank_noun.get_form (noun_usage._case, noun_usage._number)
	var last_name_string: String = _last_name.get_form (noun_usage._case, noun_usage._number, _gender)
	
	return rank_string + " " + last_name_string


## Возвращает true, если _rank_noun и _last_name обеих фраз ссылаются на одинаковые существительные. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var typed_phrase: T00_RankLastNamePhrase = phrase as T00_RankLastNamePhrase
	if !typed_phrase:
		return false
	
	return _rank_noun == typed_phrase._rank_noun && _last_name == typed_phrase._last_name

