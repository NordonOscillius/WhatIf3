class_name S01_TextTemplate extends S01_Parametric
## Базовый класс для текстовых шаблонов.


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	printerr ("Abstract method.")
	assert (false)
	return null


## Возвращает true, если контент текстового шаблона подошел к концу. В этом случае следует получить следующий текстовый шаблон с помощью get_next_template().
func is_over () -> bool:
	
	printerr ("Abstract method.")
	assert (false)
	return false


## Если этот шаблон еще не завершился, возвращает null; в противном случае возвращает ссылку на следующий шаблон, подлежащий к использованию, или null, если подходящего шаблона не нашлось.
func get_next_template () -> S01_TextTemplate:
	
	printerr ("Abstract method.")
	assert (false)
	return null
