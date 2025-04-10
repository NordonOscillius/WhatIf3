class_name S01_StoryNode extends RefCounted


var _parent: S01_StoryNode
var _children: Array[S01_StoryNode] = []
var _string_name: StringName = &"abstract_story_node"


func _init ():
	
	pass


func is_root () -> bool:
	
	return _parent == null


func get_root () -> S01_StoryNode:
	
	var cur_node: S01_StoryNode = self
	while true:
		if !cur_node._parent:
			return cur_node
		cur_node = cur_node._parent
	
	printerr ("Something went wrong.")
	return null
