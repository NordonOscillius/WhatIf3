class_name T00_PathLabel extends Label


static var NORMAL_COLOR: Color = T00_Utils.hsl_to_rgb (0, 0, .4)
static var HOVER_COLOR: Color = T00_Utils.hsl_to_rgb (.1, .99, .7)
#static var HOVER_COLOR: Color = T00_Utils.hsl_to_rgb (.55, .8, .7)

## Устанавливается в true, когда над лейблом нажимают ЛКМ.
var _mouse_is_down: bool


func _ready ():
	
	add_theme_color_override ("font_color", NORMAL_COLOR)
	
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_entered.connect (on_mouse_entered)
	mouse_exited.connect (on_mouse_exited)
	gui_input.connect (on_gui_input)


func _draw ():
	
	#draw_rect (Rect2 (Vector2 (), size), Color (T00_Utils.hsl_to_rgb (0, 0, .24), .2))
	pass


func on_mouse_entered ():
	
	add_theme_color_override ("font_color", HOVER_COLOR)


func on_mouse_exited ():
	
	add_theme_color_override ("font_color", NORMAL_COLOR)


func on_gui_input (event: InputEvent):
	
	var mb_event: InputEventMouseButton = event as InputEventMouseButton
	if mb_event && mb_event.button_index == MOUSE_BUTTON_LEFT:
		# Если ЛКМ нажата над областью лейбла.
		if mb_event.pressed:
			if Rect2 (Vector2 (), size).has_point (get_local_mouse_position ()):
				_mouse_is_down = true
		# Если ЛКМ отпущена (в любом месте).
		else:
			if Rect2 (Vector2 (), size).has_point (get_local_mouse_position ()) && _mouse_is_down:
				# Говорим плееру, что игрок просит перейти вверх на один уровень.
				T00_Globals.story_player.on_path_label_pressed ()
			
			_mouse_is_down = false
