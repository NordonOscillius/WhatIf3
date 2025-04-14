class_name T00_Startup extends Node2D


var _logo_scene: PackedScene = preload ("res://tests/test_00/scenes/t00_logo.tscn")
#var _main_menu_scene: PackedScene = preload ("res://tests/test_00/scenes/t00_main_menu.tscn")
var _is_ready: bool = false

func _ready ():
	
	# Do some preparations.
	# ...
	
	pass


func _process (delta: float):
	
	# Позже нужно переместить эту строку в другое место.
	_is_ready = true
	
	# Одноразовый вызов, перекидывающий в главное меню.
	if _is_ready:
		get_tree ().change_scene_to_packed (_logo_scene)
		#get_tree ().change_scene_to_packed (_main_menu_scene)
