class_name T00_Lexeme extends RefCounted
## Абстрактный класс лексемы - совокупности всех форм одного слова.


## Возвращает конкретную форму лексемы, соответствующую ее использованию usage. Метод должен переопределяться в классах-наследниках.
func get_form_for (usage: T00_WordUsage) -> String:
	
	printerr ("Abstract method.")
	return ""
