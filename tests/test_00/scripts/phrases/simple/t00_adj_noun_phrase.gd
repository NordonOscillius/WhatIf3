class_name T00_AdjNounPhrase extends T00_SimplePhrase
## Простая фраза в виде [[Зависимое прилагательное] [Существительное]].


var _adjective: T00_Adjective
var _noun: T00_Noun


func setup (adjective: T00_Adjective, noun: T00_Noun) -> T00_AdjNounPhrase:
	
	_adjective = adjective
	_noun = noun
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_AdjNounPhrase.new ().setup (_adjective, _noun)


func __adjective (value: T00_Adjective) -> T00_AdjNounPhrase:
	_adjective = value
	return self

func __noun (value: T00_Noun) -> T00_AdjNounPhrase:
	_noun = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	
	var noun_string: String = _noun.get_form_for (noun_usage)
	var adj_string: String = _adjective.get_form_for_noun (_noun, noun_usage._number, noun_usage._case)
	return adj_string + " " + noun_string


## Возвращает true, если _noun обеих фраз ссылаются на одно и то же существительное, а _adjective - на одно и то же прилагательное. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var adj_noun_phrase: T00_AdjNounPhrase = phrase as T00_AdjNounPhrase
	if !adj_noun_phrase:
		return false
	
	return _noun == adj_noun_phrase._noun && _adjective == adj_noun_phrase._adjective


