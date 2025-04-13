class_name T00_NounPhrase extends T00_SimplePhrase
## Фраза, состоящая из единственного существительного.


var _noun: T00_Noun


func __noun (value: T00_Noun) -> T00_NounPhrase:
	_noun = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	return _noun.get_form_for (noun_usage)
