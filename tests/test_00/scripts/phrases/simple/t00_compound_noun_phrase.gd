class_name T00_CompoundNounPhrase extends T00_SimplePhrase
## Простая фраза, соответствующая составному существительному в виде [[Существительное]-[Существительное]] (через дефис).


var _noun_left: T00_Noun
var _noun_right: T00_Noun
## Если true, то при определении формы зависимых фраз будет использоваться _noun_left; иначе _noun_right.
var _subject_is_left: bool = true


func setup (noun_left: T00_Noun, noun_right: T00_Noun, subject_is_left: bool = true) -> T00_CompoundNounPhrase:
	
	_noun_left = noun_left
	_noun_right = noun_right
	_subject_is_left = subject_is_left
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_CompoundNounPhrase.new ().setup (_noun_left, _noun_right)


func __noun_left (value: T00_Noun) -> T00_CompoundNounPhrase:
	_noun_left = value
	return self

func __noun_right (value: T00_Noun) -> T00_CompoundNounPhrase:
	_noun_right = value
	return self

func __subject_is_left (value: bool) -> T00_CompoundNounPhrase:
	_subject_is_left = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	
	return _noun_left.get_form_for (noun_usage) + "-" + _noun_right.get_form_for (noun_usage)


## Возвращает true, если _noun_left и _noun_right обеих фраз ссылаются на одни и то же существительные. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var typed_phrase: T00_CompoundNounPhrase = phrase as T00_CompoundNounPhrase
	if !typed_phrase:
		return false
	
	return _noun_left == typed_phrase._noun_left && _noun_right == typed_phrase._noun_right


func get_subject () -> T00_Noun:
	
	return _noun_left if _subject_is_left else _noun_right

