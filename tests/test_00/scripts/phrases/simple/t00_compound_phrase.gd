class_name T00_CompoundPhrase extends T00_SimplePhrase
## Простая фраза, состоящая из нескольких более мелких фраз, например, "большой ключ-бабочка": [[Прилагательное] [Составное существительное]]. Так как первая часть фразы, [Прилагательное], самостоятельно определяет свои род и одушевленность (его нужно указывать вручную при создании фразы такого типа), вся составная фраза в целом также должна менять свою форму правильным образом.
## Я пока не собираюсь реализовывать автоматическое склонение зависимых слов и указывать на главную фразу (подлежащее).


var _phrases: Array[T00_SimplePhrase] = []
## Индекс фразы внутри массива _phrases, которая определяет субъект составной фразы - существительное, которое может использоваться в качестве подлежащего или дополнения в других местах игры. Если меньше единицы, то субъект считается неопределенным, и метод get_subject() будет возвращать null.
var _subject_index: int = -1


func setup (phrases: Array[T00_SimplePhrase], subject_index: int = -1) -> T00_CompoundPhrase:
	
	_phrases = phrases
	return self


func clone_shallow () -> T00_SimplePhrase:
	
	return T00_CompoundPhrase.new ().setup (_phrases.duplicate (false))


func __phrases (value: Array[T00_SimplePhrase]) -> T00_CompoundPhrase:
	_phrases = value
	return self

func __subject_index (value: int) -> T00_CompoundPhrase:
	_subject_index = value
	return self


## Параметр usage должен являться экземпляром T00_NounUsage.
func get_form_for (usage: T00_WordUsage) -> String:
	
	#var noun_usage: T00_NounUsage = usage as T00_NounUsage
	#assert (noun_usage)
	
	var result: String = ""
	var num_phrases: int = _phrases.size ()
	var i: int = 0
	while i < num_phrases:
		result += _phrases[i].get_form_for (usage)
		if i < num_phrases - 1:
			result += " "
		
		i += 1
	
	return result


## Возвращает true, если все вложенные этой фразы соответственно равны вложенным фразам фразы phrase. Если phrase == null, то при нестрогой проверке метод вернет false, а при строгой кинет исключение.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	if !phrase && deny_null_param:
		printerr ("Trying to compare T00_SimplePhrase instance with null.")
		assert (false)
	
	var compound_phrase: T00_CompoundPhrase = phrase as T00_CompoundPhrase
	if !compound_phrase:
		return false
	
	if _phrases.size () != compound_phrase._phrases.size ():
		return false
	
	var num_phrases: int = _phrases.size ()
	var i: int = 0
	while i < num_phrases:
		if !_phrases[i].equals (compound_phrase._phrases[i]):
			return false
		
		i += 1
	
	return true


func get_subject () -> T00_Noun:
	
	if _subject_index < 0:
		printerr ("Subject is not defined.")
		assert (false)
		return null
	
	return _phrases[_subject_index].get_subject ()
	

