class_name T00_PhraseWord extends T00_PhrasePart
## Часть фразы, использующая динамическое слово (сочетание конкретного подкласса лексемы и ее использования).


var _word: T00_UsedWord


func _init (word: T00_UsedWord):
	
	_type = T00_PhrasePartType.WORD
	_word = word


func get_text () -> String:
	
	return _word.get_form ()
