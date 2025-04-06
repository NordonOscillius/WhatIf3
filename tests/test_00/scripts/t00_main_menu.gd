class_name T00_MainMenu extends Node2D


var _game_scene: PackedScene = preload ("res://tests/test_00/scenes/t00_game.tscn")

static var BUTTON_WIDTH: float = 200.0
static var BUTTON_HEIGHT: float = 60.0
static var BUTTON_SPACING: float = 8.0

var _canvas_layer: CanvasLayer
var _background: Sprite2D
var _start_button: Button
var _quit_button: Button

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
	
	_start_button = create_and_add_button ("Новая игра", on_start_button_pressed)
	_quit_button = create_and_add_button ("Выйти", on_quit_button_pressed)
	
	#_start_button = Button.new ()
	#_start_button.text = "Новая игра"
	#_start_button.focus_mode = Control.FOCUS_NONE
	#_start_button.size = Vector2 (BUTTON_WIDTH, BUTTON_HEIGHT)
	#_canvas_layer.add_child (_start_button)
	
	on_viewport_size_changed ()


func create_and_add_button (text: String, pressed_handler: Callable) -> Button:
	
	var button: Button = Button.new ()
	button.text = text
	button.focus_mode = Control.FOCUS_NONE
	button.size = Vector2 (BUTTON_WIDTH, BUTTON_HEIGHT)
	button.pressed.connect (pressed_handler)
	
	_canvas_layer.add_child (button)
	return button


func _process (delta: float):
	pass


# ==================================================
# ==================== HANDLERS ====================
# ==================================================

func on_viewport_size_changed ():
	
	var view_rect: Rect2 = get_viewport_rect ()
	var view_width: float = view_rect.size.x
	var view_height: float = view_rect.size.y
	
	var buttons: Array[Button] = [_start_button, _quit_button]
	var num_buttons: int = buttons.size ()
	
	var button_x: float = (view_width - BUTTON_WIDTH) * .5
	var button_group_height: float = num_buttons * BUTTON_HEIGHT + (num_buttons - 1) * BUTTON_SPACING
	var button_group_top_y: float = (view_height - button_group_height) * .5
	
	var i: int = 0
	var cur_y: float = button_group_top_y
	while i < num_buttons:
		
		var cur_button: Button = buttons[i]
		cur_button.position.x = button_x
		cur_button.position.y = cur_y
		
		cur_y += BUTTON_HEIGHT + BUTTON_SPACING
		i += 1


func on_start_button_pressed ():
	
	get_tree().change_scene_to_packed (_game_scene)


func on_quit_button_pressed ():
	
	get_tree ().quit ()


func on_background_draw ():
	
	_background.draw_rect (Rect2 (Vector2 (), get_viewport_rect ().size), Color.BLACK)
