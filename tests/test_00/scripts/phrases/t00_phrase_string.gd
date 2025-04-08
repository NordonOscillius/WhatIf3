class_name T00_PhraseString extends T00_PhrasePart
## Часть фразы, использующая простую статическую строку.


var _string: String


func _init (string: String):
	
	_type = T00_PhrasePartType.STRING
	_string = string


func get_text () -> String:
	
	return _string
