class_name T00_ConstAdjPhrase extends T00_SimplePhrase
## Простая фраза в виде [[Константная строка] [Прилагательное]]. Прилагательное относится к неявному существительному указанного рода и одушевленности.


var _constant: String
var _adjective: T00_Adjective
## Пол неявного существительного, к которому относится прилагательное _adjective. Константа класса T00_WordGender.
var _gender: int
## Одушевленность неявного существительного, к которому относится прилагательное _adjective. Константа класса T00_WordAnimacy.
var _animacy: int


func setup (constant: String, adjective: T00_Adjective, gender: int, animacy: int) -> T00_ConstAdjPhrase:
	
	_constant = constant
	_adjective = adjective
	_gender = gender
	_animacy = animacy
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_ConstAdjPhrase.new ().setup (_constant, _adjective, _gender, _animacy)


func __constant (value: String) -> T00_ConstAdjPhrase:
	_constant = value
	return self

func __adjective (value: T00_Adjective) -> T00_ConstAdjPhrase:
	_adjective = value
	return self

func __gender (value: int) -> T00_ConstAdjPhrase:
	_gender = value
	return self

func __animacy (value: int) -> T00_ConstAdjPhrase:
	_animacy = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	var noun_usage: T00_NounUsage = usage as T00_NounUsage
	assert (noun_usage)
	return _constant + _adjective.get_form (_gender, noun_usage._number, _animacy, noun_usage._case)


## Возвращает true, если _adjective обеих фраз ссылаются на одно и то же прилагательное, а их род, одушевленность и константная строка _constant равны. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var typed_phrase: T00_ConstAdjPhrase = phrase as T00_ConstAdjPhrase
	if !typed_phrase:
		return false
	
	return _constant == typed_phrase._constant && _adjective == typed_phrase._adjective && _gender == typed_phrase._gender && _animacy == typed_phrase._animacy


func get_subject () -> T00_Noun:
	
	printerr ("It's impossible to define this phrase's subject (it's implicit).")
	assert (false)
	return null
