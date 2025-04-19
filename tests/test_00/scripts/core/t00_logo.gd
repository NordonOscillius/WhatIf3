class_name T00_Logo extends Node2D


static var LABEL_BORDER_X: int = 0
static var LABEL_BORDER_Y: int = 0

var _main_menu_scene: PackedScene = preload ("res://tests/test_00/scenes/t00_main_menu.tscn")

var _canvas_layer: CanvasLayer
var _background: Sprite2D
var _label: Label
var _viewport: Viewport


# ==================================================
# ===================== COMMON =====================
# ==================================================

func _ready ():
	
	_viewport = get_viewport ()
	_viewport.size_changed.connect (on_viewport_size_changed)
	
	_canvas_layer = CanvasLayer.new ()
	add_child (_canvas_layer)
	
	_background = Sprite2D.new ()
	_background.draw.connect (on_background_draw)
	_canvas_layer.add_child (_background)
	
	_label = Label.new ()
	_label.text = "Сделано специально для What?If3 на Gamin.me"
	_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_label.add_theme_font_override ("font", T00_Globals.LABEL_FONT_FACE_THICK)
	_label.add_theme_font_size_override ("font_size", 36)
	_label.add_theme_color_override ("font_color", T00_Utils.hsl_to_rgb (0, 0, .7))
	_label.mouse_filter = Control.MOUSE_FILTER_PASS
	_label.gui_input.connect (on_gui_input)
	_canvas_layer.add_child (_label)
	
	on_viewport_size_changed ()


func _process (delta: float):
	
	pass


# ==================================================
# ==================== HANDLERS ====================
# ==================================================


func on_viewport_size_changed ():
	
	var view_rect: Rect2 = get_viewport_rect ()
	var view_width: float = view_rect.size.x
	var view_height: float = view_rect.size.y
	
	_label.size = Vector2 (view_width - LABEL_BORDER_X * 2, view_height - LABEL_BORDER_Y * 2)
	_label.position.x = (view_width - _label.size.x) * .5
	_label.position.y = (view_height - _label.size.y) * .5


func on_gui_input (event: InputEvent):
	
	var mb_event: InputEventMouseButton = event as InputEventMouseButton
	if mb_event && mb_event.button_index == MOUSE_BUTTON_LEFT && mb_event.pressed:
		
		get_tree ().change_scene_to_packed (_main_menu_scene)


func on_background_draw ():
	
	_background.draw_rect (Rect2 (Vector2 (), get_viewport_rect ().size), Color.BLACK)

