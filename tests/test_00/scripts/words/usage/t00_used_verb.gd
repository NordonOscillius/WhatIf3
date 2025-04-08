class_name T00_UsedVerb extends T00_UsedWord
## Используемый глагол - сочетание лексемы глагола и конкретной формы его использования.


#func _init (lexeme: T00_Lexeme, usage: T00_WordUsage):
	#
	#assert ((lexeme is T00_Verb) && (usage is T00_VerbUsage))
	#super (lexeme, usage)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __verb (value: T00_Verb) -> T00_UsedVerb:
	_lexeme = value
	return self

func __usage (value: T00_VerbUsage) -> T00_UsedVerb:
	_usage = value
	return self
