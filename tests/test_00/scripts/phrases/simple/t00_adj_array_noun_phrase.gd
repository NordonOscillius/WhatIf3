class_name T00_AdjArrayNounPhrase extends T00_SimplePhrase
## Простая фраза, состоящая из неизвестного количества прилагательных, относящихся к единственному существительному.


var _adjectives: Array[T00_Adjective] = []
var _noun: T00_Noun


func setup (adjectives: Array[T00_Adjective], noun: T00_Noun) -> T00_AdjArrayNounPhrase:
	
	_adjectives = adjectives
	_noun = noun
	return self


## Этот метод создает дубликат массива _adjectives, но сами объекты внутри него не клонируются.
func clone_shallow () -> T00_SimplePhrase:
	
	var adj_copy: Array[T00_Adjective] = _adjectives.duplicate (false)
	return T00_AdjArrayNounPhrase.new ().setup (adj_copy, _noun)


func __adjectives (value: Array[T00_Adjective]) -> T00_AdjArrayNounPhrase:
	_adjectives = value
	return self

func __noun (value: T00_Noun) -> T00_AdjArrayNounPhrase:
	_noun = value
	return self


func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	if !noun_usage:
		printerr ("The 'usage' parameter should be a T00_NounUsage instance.")
		return ""
	
	var result: String = ""
	
	var num_adjectives: int = _adjectives.size ()
	var i: int = 0
	while i < num_adjectives:
		var adjective: T00_Adjective = _adjectives[i]
		result += adjective.get_form_for_noun (_noun, noun_usage._number, noun_usage._case)
		result += " "
		
		i += 1
	
	result += _noun.get_form_for (noun_usage)
	return result


## Возвращает true, если _noun обеих фраз ссылаются на одно и то же существительное, а все элементы _adjectives - на одни и те же прилагательные (порядок имеет значение). Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var adj_noun_phrase: T00_AdjArrayNounPhrase = phrase as T00_AdjArrayNounPhrase
	if !adj_noun_phrase:
		return false
	
	if _noun == adj_noun_phrase._noun:
		return false
	
	if _adjectives.size () != adj_noun_phrase._adjectives.size ():
		return false
	
	var num_adjectives: int = _adjectives.size ()
	var i: int = 0
	while i < num_adjectives:
		if _adjectives[i] != adj_noun_phrase._adjectives[i]:
			return false
		i += 1
	
	return true


func get_subject () -> T00_Noun:
	
	return _noun
