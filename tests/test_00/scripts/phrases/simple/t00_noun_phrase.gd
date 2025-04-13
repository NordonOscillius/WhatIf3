class_name T00_NounPhrase extends T00_SimplePhrase
## Фраза, состоящая из единственного существительного.


var _noun: T00_Noun


func __noun (value: T00_Noun) -> T00_NounPhrase:
	_noun = value
	return self


func get_form_for (usage: T00_NounUsage) -> String:
	
	return _noun.get_form_for (usage)
