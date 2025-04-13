class_name T00_PhrasePart extends RefCounted
## РЕАЛИЗАЦИЯ НЕ ЗАВЕРШЕНА. Использую простую фразу T00_SimplePhrase.
## Базовый класс для Части Фразы. Частью Фразы может являться лист дерева (он содержит только член предложения - слово с присвоенной ему ролью) или узел дерева (он не может обладать членом предложения, но содержит вложенные части фразы).


## Родитель этой части фразы (узла или листа).
var _parent: T00_PhrasePart

var parent: T00_PhrasePart:
	
	get: return _parent


func destroy ():
	
	printerr ("Not implemented.")
	assert (false)


func connect_to_parent (parent: T00_PhrasePart):
	
	if _parent:
		printerr ("This Phrase Part is added to some parent already.")
		return
	
	assert (parent != self)
	_parent = parent


func disconnect_from_parent ():
	
	_parent = null


func is_root () -> bool:
	
	return _parent == null


func get_root () -> T00_PhrasePart:
	
	var cur_part: T00_PhrasePart = self
	while true:
		if !_parent:
			return cur_part
		cur_part = cur_part._parent
	
	printerr ("Couldn't find the root of the Phrase Tree.")
	return null
