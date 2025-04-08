class_name T00_UsedNoun extends T00_UsedWord
## Используемое существительное - сочетание лексемы существительного и конкретной формы его использования.


#func _init (lexeme: T00_Lexeme, usage: T00_WordUsage):
	#
	#assert ((lexeme is T00_Noun) && (usage is T00_NounUsage))
	#super (lexeme, usage)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __noun (value: T00_Noun) -> T00_UsedNoun:
	_lexeme = value
	return self

func __usage (value: T00_NounUsage) -> T00_UsedNoun:
	_usage = value
	return self
