class_name T00_AdjNounPhrase extends T00_SimplePhrase
## Простая фраза в виде [[Зависимое прилагательное] [Существительное]].


var _adjective: T00_Adjective
var _noun: T00_Noun


func setup (adjective: T00_Adjective, noun: T00_Noun) -> T00_AdjNounPhrase:
	
	_adjective = adjective
	_noun = noun
	return self


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
