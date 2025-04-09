class_name T00_WordUsage extends RefCounted
## Абстрактный класс использования слова. Детали реализации зависят от части речи, использование которой необходимо описать (т.е. от того, существительное это, глагол и т.д.)


func clone () -> T00_WordUsage:
	
	return T00_WordUsage.new ()


func as_noun_usage () -> T00_NounUsage:
	
	return self as T00_NounUsage


func as_adj_usage () -> T00_AdjUsage:
	
	return self as T00_AdjUsage


func as_verb_usage () -> T00_VerbUsage:
	
	return self as T00_VerbUsage
