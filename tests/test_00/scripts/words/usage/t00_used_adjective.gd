class_name T00_UsedAdjective extends T00_UsedWord
## Используемое прилагательное - сочетание лексемы прилагательного и конкретной формы его использования.


#func _init (lexeme: T00_Lexeme, usage: T00_WordUsage):
	#
	#assert ((lexeme is T00_Adjective) && (usage is T00_AdjUsage))
	#super (lexeme, usage)


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __adjective (value: T00_Adjective) -> T00_UsedAdjective:
	_lexeme = value
	return self

func __usage (value: T00_AdjUsage) -> T00_UsedAdjective:
	_usage = value
	return self
