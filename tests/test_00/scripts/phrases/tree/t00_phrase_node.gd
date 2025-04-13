class_name T00_PhraseNode extends T00_PhrasePart
## Узел дерева фразы. Содержит другие узлы или листья в своем составе.


## Узлы или листья Дерева Фразы, вложенные в этот узел.
var _children: Array[T00_PhrasePart] = []


func destroy ():
	
	var i: int = _children.size ()
	while i:
		i -= 1
		remove_child_at (i)


func add_child (child: T00_PhrasePart) -> T00_PhraseNode:
	
	if child._parent:
		printerr ("Child is already added to some parent.")
		return
	
	child.connect_to_parent (self)
	_children.push_back (child)
	
	return self


func remove_child_at (index: int):
	
	var child: T00_PhrasePart = _children[index]
	child.disconnect_from_parent ()
	_children.remove_at (index)


func remove_child (child: T00_PhrasePart):
	
	var index: int = _children.find (child)
	if index < 0:
		printerr ("Child not found.")
		return
	
	child.disconnect_from_parent ()
	_children.remove_at (index)
