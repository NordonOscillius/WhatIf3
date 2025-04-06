class_name T00_WordGender extends RefCounted

static var UNKNOWN: int = 0
static var MASCULINE: int = 1
static var FEMININE: int = 2
static var NEUTER: int = 3

#var _type: int
#
#
#func _init (type = MASCULINE):
	#
	#_type = type
#
#
#func is_masculine () -> bool:
	#return _type == MASCULINE
#
#func is_feminine () -> bool:
	#return _type == FEMININE
#
#func is_neuter () -> bool:
	#return _type == NEUTER
