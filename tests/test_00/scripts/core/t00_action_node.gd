class_name T00_ActionNode extends RefCounted
## Узел дерева действий. Может являться корнем дерева (если parent == null) либо объектом, который присутствует в локации (в том числе в составе другого объекта). Может также являться конкретным действием (листом дерева), но для этого узел должен являться экземпляром класса T00_Action.


## Родитель этого узла. Если null, то этот узел является корнем дерева.
var _parent: T00_ActionNode
## Массив вложенных узлов. Если этот массив пуст, то интерпретация зависит от того, экземпляром какого класса является этот узел; если это T00_Action, то узел рассматривается как конкретное действие (что логично); если узел НЕ ЯВЛЯЕТСЯ T00_Action, то он соответствует какому-то объекту локации, и в этом случае отсутствие потомков означает, что над этим объектом локации нельзя совершить никаких действий.
var _children: Array[T00_ActionNode] = []

# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

## Количество узлов-потомков, добавленных к текущему узлу.
var num_children: int:
	
	get: return _children.size ()

# ==================================================
# ===================== COMMON =====================
# ==================================================

## Добавляет узел в конец массива _children и возвращает self.
func add_child (child: T00_ActionNode) -> T00_ActionNode:
	
	if child._parent:
		printerr ("This child already has a parent, remove it first.")
		return self
	
	_children.push_back (child)
	child._parent = self
	return self


func add_child_at (child: T00_ActionNode, index: int) -> T00_ActionNode:
	
	if child._parent:
		printerr ("This child already has a parent, remove it first.")
		return self
	
	if _children.insert (index, child) != OK:
		printerr ("Couldn't add this child.")
		return self
	
	child._parent = self
	return self


## Удаляет узел с индексом index и возвращает self.
func remove_child_at (index: int) -> T00_ActionNode:
	
	if index >= _children.size ():
		printerr ("Trying to remove an element of _children at index ", index, "; number of children = ", _children.size ())
		return self
	
	_children[index]._parent = null
	_children.remove_at (index)
	return self


## Находит узел child в массиве _children и удаляет его. Возвращает self.
func remove_child (child: T00_ActionNode) -> T00_ActionNode:
	
	var index: int = _children.find (child)
	if index < 0:
		printerr ("Child not found")
		return self
	
	child._parent = null
	_children.remove_at (index)
	return self


func get_child_at (index: int) -> T00_ActionNode:
	
	return _children[index]


func get_child_index (child: T00_ActionNode) -> int:
	
	return _children.find (child)


func is_root () -> bool:
	
	return _parent == null


## Возвращает корневой узел дерева.
func get_root () -> T00_ActionNode:
	
	var cur_node: T00_ActionNode = self
	while true:
		if !_parent:
			return cur_node
		cur_node = cur_node._parent
		
	printerr ("Unable to get the root.")
	return null


## Возвращает путь от корневого узла дерева до текущего узла. В возвращенном массиве первым элементом является корневой узел дерева, последним - текущая нода.
func get_path_from_root () -> Array[T00_ActionNode]:
	
	var path: Array[T00_ActionNode] = []
	var cur_node: T00_ActionNode = self
	while cur_node:
		path.push_front (cur_node)
		cur_node = cur_node._parent
	
	return path


## Возвращает путь от текущего узла до корневого. В возвращенном массиве первым элементом является текущий узел, последним - корневой узел дерева.
func get_path_to_root () -> Array[T00_ActionNode]:
	
	var path: Array[T00_ActionNode] = []
	var cur_node: T00_ActionNode = self
	while cur_node:
		path.push_back (cur_node)
		cur_node = cur_node._parent
	
	return path


## (Abstract) Возвращает строку, с помощью которой этот узел будет отображаться на панели действий. Для узлов-объектов это название объекта; для узлов-действий это буквальное название действия или сконструированное в рантайме действие (в зависимости от названия объекта, над которым производится действие).
func get_panel_text () -> String:
	
	return ""
