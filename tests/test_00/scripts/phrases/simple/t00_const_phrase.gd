class_name T00_ConstPhrase extends T00_SimplePhrase
## Простая Фраза в виде [Константная строка].


var _constant: String


func setup (constant: String) -> T00_ConstPhrase:
	
	_constant = constant
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_ConstPhrase.new ().setup (_constant)


func __constant (value: String) -> T00_ConstPhrase:
	_constant = value
	return self


func get_form_for (usage: T00_WordUsage) -> String:
	
	return _constant


## Возвращает true, если _constant обеих фраз равны между собой. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var typed_phrase: T00_ConstPhrase = phrase as T00_ConstPhrase
	if !typed_phrase:
		return false
	
	return _constant == typed_phrase._constant


func get_subject () -> T00_Noun:
	
	printerr ("It's impossible to define this phrase's subject.")
	assert (false)
	return null

