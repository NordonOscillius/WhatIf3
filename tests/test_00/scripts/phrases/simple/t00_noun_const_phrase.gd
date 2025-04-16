class_name T00_NounConstPhrase extends T00_SimplePhrase
## Простая фраза в виде [[Существительное] [Константная строка]].


var _noun: T00_Noun
var _constant: String


func setup (noun: T00_Noun, constant: String) -> T00_NounConstPhrase:
	
	_noun = noun
	_constant = constant
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_NounConstPhrase.new ().setup (_noun, _constant)


func __noun (value: T00_Noun) -> T00_NounConstPhrase:
	_noun = value
	return self

func __constant (value: String) -> T00_NounConstPhrase:
	_constant = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	
	return _noun.get_form_for (noun_usage) + _constant


## Возвращает true, если _noun обеих фраз ссылаются на одно и то же существительное, а _constant равны между собой. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var typed_phrase: T00_NounConstPhrase = phrase as T00_NounConstPhrase
	if !typed_phrase:
		return false
	
	return _noun == typed_phrase._noun && _constant == typed_phrase._constant


func get_subject () -> T00_Noun:
	
	return _noun

