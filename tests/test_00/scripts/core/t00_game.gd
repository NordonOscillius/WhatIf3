class_name T00_Game extends Node2D


var _viewport: Viewport
# На этот слой должны добавляться все остальные объекты.
var _canvas_layer: CanvasLayer
var _background: Sprite2D

var _story_player: T00_StoryPlayer
var _narrator: T00_Narrator


func _ready ():
	
	print ("GAME HAS STARTED")
	
	_viewport = get_viewport ()
	_viewport.size_changed.connect (on_viewport_size_changed)
	
	_canvas_layer = CanvasLayer.new ()
	add_child (_canvas_layer)
	
	_background = Sprite2D.new ()
	_background.draw.connect (on_background_draw)
	_canvas_layer.add_child (_background)
	
	_narrator = T00_A_Narrator.new ()
	#_narrator = T00_Narrator.new ()
	
	_story_player = T00_StoryPlayer.new (self)
	_canvas_layer.add_child (_story_player)


func _process (delta: float):
	pass


func on_viewport_size_changed ():
	pass


func on_background_draw ():
	
	_background.draw_rect (Rect2 (Vector2 (), get_viewport_rect ().size), Color.BLACK)
