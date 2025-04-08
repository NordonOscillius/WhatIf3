class_name T00_PhrasePart extends RefCounted
## Базовый класс Части Фразы. Внутри может использовать динамическое слово T00_UsedWord или строку.


## Тип части фразы - константа класса T00_PhrasePartType.
var _type: int


func get_string () -> String:
	
	printerr ("Abstract method")
	return ""
