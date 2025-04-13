class_name T00_AdjArrayNounPhrase extends T00_SimplePhrase
## Простая фраза, состоящая из неизвестного количества прилагательных, относящихся к единственному существительному.


var _adjectives: Array[T00_Adjective] = []
var _noun: T00_Noun


func setup (adjectives: Array[T00_Adjective], noun: T00_Noun) -> T00_AdjArrayNounPhrase:
	
	_adjectives = adjectives
	_noun = noun
	return self


func __adjectives (value: Array[T00_Adjective]) -> T00_AdjArrayNounPhrase:
	_adjectives = value
	return self

func __noun (value: T00_Noun) -> T00_AdjArrayNounPhrase:
	_noun = value
	return self


func get_form_for (usage: T00_NounUsage) -> String:
	
	var result: String = ""
	
	var noun_string: String = _noun.get_form_for (usage)
	
	var num_adjectives: int = _adjectives.size ()
	var i: int = 0
	while i < num_adjectives:
		var adjective: T00_Adjective = _adjectives[i]
		result += adjective.get_form_for_noun (_noun, usage._number, usage._case)
		result += " "
		
		i += 1
	
	result += noun_string
	return result
