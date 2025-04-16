class_name T00_SimplePhrase extends RefCounted
## Базовый класс Простой Фразы, содержащей единственную лексему или простое сочетание нескольких лексем и работающей по простым правилам.


## Создает неглубокую копию этой фразы. Абстрактный метод.
func clone_shallow () -> T00_SimplePhrase:
	
	printerr ("Abstract method.")
	assert (false)
	return null


func get_form_for (usage: T00_WordUsage) -> String:
	
	printerr ("Abstract method.")
	assert (false)
	return ""


## Попарно сравнивает лексемы этой фразы и фразы phrase и возвращает true, если они равны по ссылке.
func equals (phrase: T00_SimplePhrase, deny_null_param: bool = false) -> bool:
	
	printerr ("Abstract method.")
	assert (false)
	return false


## Возвращает существительное, которое можно использовать в качестве подлежащего или дополнения (Что лежало? - Камень). Не для каждой простой фразы можно использовать этот метод; например, T00_AdjPhrase на такой запрос вернет null (или бросит исключение, я еще не решил).
func get_subject () -> T00_Noun:
	
	printerr ("Abstract method.")
	assert (false)
	return null


func as_noun_phrase () -> T00_NounPhrase:
	return self as T00_NounPhrase

func as_adj_noun_phrase () -> T00_AdjNounPhrase:
	return self as T00_AdjNounPhrase

func as_adj_array_noun_phrase () -> T00_AdjArrayNounPhrase:
	return self as T00_AdjArrayNounPhrase

func as_rank_last_name_phrase () -> T00_RankLastNamePhrase:
	return self as T00_RankLastNamePhrase
