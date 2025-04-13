class_name T00_SimplePhrase extends RefCounted
## Базовый класс Простой Фразы, содержащей единственную лексему или простое сочетание нескольких лексем и работающей по простым правилам.


func get_form_for (usage: T00_WordUsage) -> String:
	
	printerr ("Abstract method.")
	assert (false)
	return ""
