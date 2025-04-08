class_name T00_UsedWord extends RefCounted
## Абстрактный класс слова - лексемы в одной из ее конкретных форм (употреблений).


## Лексема (например, существительное или глагол), содержащая все формы слова.
var _lexeme: T00_Lexeme
var _usage: T00_WordUsage


#func _init (lexeme: T00_Lexeme, usage: T00_WordUsage):
	#
	#_lexeme = lexeme
	#_usage = usage


func get_form () -> String:
	
	return _lexeme.get_form_for (_usage)
