class_name T00_NounPhrase extends T00_SimplePhrase
## Фраза, состоящая из единственного существительного.


var _noun: T00_Noun


func setup (noun: T00_Noun) -> T00_NounPhrase:
	
	_noun = noun
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_NounPhrase.new ().setup (_noun)


func __noun (value: T00_Noun) -> T00_NounPhrase:
	_noun = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	return _noun.get_form_for (noun_usage)


## Возвращает true, если _noun обеих фраз ссылаются на одно и то же существительное. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var noun_phrase: T00_NounPhrase = phrase as T00_NounPhrase
	if !noun_phrase:
		return false
	
	return noun_phrase._noun == _noun
