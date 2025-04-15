class_name T00_AdjPhrase extends T00_SimplePhrase
## Фраза, состоящая из единственного прилагательного, принадлежащая неявному существительному указанного рода и одушевленности.


var _adjective: T00_Adjective
## Пол неявного существительного, к которому относится прилагательное _adjective. Константа класса T00_WordGender.
var _gender: int
## Одушевленность неявного существительного, к которому относится прилагательное _adjective. Константа класса T00_WordAnimacy.
var _animacy: int


func setup (adjective: T00_Adjective, gender: int, animacy: int) -> T00_AdjPhrase:
	
	_adjective = adjective
	_gender = gender
	_animacy = animacy
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_AdjPhrase.new ().setup (_adjective, _gender, _animacy)


func __adjective (value: T00_Adjective) -> T00_AdjPhrase:
	_adjective = value
	return self

func __gender (value: int) -> T00_AdjPhrase:
	_gender = value
	return self

func __animacy (value: int) -> T00_AdjPhrase:
	_animacy = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	return _adjective.get_form(_gender, noun_usage._number, _animacy, noun_usage._case)


## Возвращает true, если _adjective обеих фраз ссылаются на одно и то же прилагательное, а их род и одушевленность равны. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var adj_phrase: T00_AdjPhrase = phrase as T00_AdjPhrase
	if !adj_phrase:
		return false
	
	return _adjective == adj_phrase._adjective && _gender == adj_phrase._gender && _animacy == adj_phrase._animacy

