class_name T00_StoryPlayer extends Control


static var STATE_FADE_IN: int = 0
static var STATE_WAIT_INPUT: int = 1
static var STATE_FADE_OUT: int = 2

static var TOP_PANEL_HEIGHT: int = 50
static var TOP_PANEL_COLOR: Color = T00_Utils.hsl_to_rgb (0, 0, .04)
static var ACTION_PANEL_HEIGHT: int = 260
static var ACTION_PANEL_COLOR: Color = T00_Utils.hsl_to_rgb (0, 0, .04)
static var ACTION_LABEL_SIZE: Vector2 = Vector2 (280, 24)
static var ACTION_LABEL_SPACING: Vector2 = Vector2 (32, 4)
## Смещение по вертикали от ВЕРХНЕГО КРАЯ ПАНЕЛИ ДЕЙСТВИЙ (не от лейбла пути).
static var ACTION_LABEL_OFFSET_Y: int = 60
static var ACTION_LABEL_COLUMN_CAPACITY: int = 6
static var PATH_LABEL_OFFSET_Y: int = 10
static var PATH_LABEL_HEIGHT: int = 24
static var PATH_LABEL_BORDER_HORIZONTAL: int = 200
static var STORY_LABEL_BORDER_HORIZONTAL: int = 400
static var STORY_LABEL_BORDER_VERTICAL: int = 60

#static var LABEL_FONT_FACE: FontFile = preload ("res://tests/test_00/res/fonts/Montserrat-Regular.ttf")
#static var LABEL_FONT_FACE_THICK: FontFile = preload ("res://tests/test_00/res/fonts/Montserrat-Medium.ttf")
#static var LABEL_FONT_FACE_THIN: FontFile = preload ("res://tests/test_00/res/fonts/Montserrat-Light.ttf")

var _state: int = STATE_FADE_IN
var _fade_speed: float = 8.0
## Непрозрачность элементов на экране. Единица соответствует полностью видимому интерфейсу.
var _fade_ratio: float = .0
## Текущий бит истории. Получаем из Повествователя.
var _cur_beat: T00_Beat
## Действие, которое игрок выбрал в фазе STATE_WAIT_INPUT.
var _selected_action: T00_Action = null
## Узел дерева действий, в котором мы находимся и относительно которого следует отображать список доступных узлов и действий.
var _entered_node: T00_ActionNode = null

## Центральный лейбл с текстом истории.
var _story_label: Label
## Массив, хранящий набор лейблов, представляющих варианты ответа.
var _action_labels: Array[T00_ActionLabel] = []
## Лейбл, отображающий путь до текущего узла (_entered_node) в дереве действий.
var _path_label: T00_PathLabel
## Скролл-контейнер для книги.
var _book_container: ScrollContainer
## Лейбл, в котором прописан весь текст истории.
var _book_label: Label

var _game: T00_Game


func _init (game: T00_Game):
	
	_game = game


func _ready ():
	
	var viewport_size: Vector2 = get_viewport_rect ().size
	
	# Получаем первый бит истории от Повествователя.
	_cur_beat = _game._narrator.get_next_beat (null)
	
	# Центральный лейбл истории.
	_story_label = Label.new ()
	_story_label.add_theme_font_override ("font", T00_Globals.LABEL_FONT_FACE_USUAL)
	_story_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var story_label_size: Vector2 = Vector2 (
		viewport_size.x - STORY_LABEL_BORDER_HORIZONTAL * 2,
		viewport_size.y - TOP_PANEL_HEIGHT - ACTION_PANEL_HEIGHT - STORY_LABEL_BORDER_VERTICAL * 2
	)
	_story_label.size = story_label_size
	_story_label.position.x = (viewport_size.x - _story_label.size.x) * .5
	_story_label.position.y = TOP_PANEL_HEIGHT + STORY_LABEL_BORDER_VERTICAL
	_story_label.text = _cur_beat._story_text
	_story_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	#_story_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_story_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_story_label.modulate = Color (1, 1, 1, 0)
	#_story_label.draw.connect (on_story_label_draw)
	_story_label.mouse_filter = Control.MOUSE_FILTER_PASS
	add_child (_story_label)
	
	# Лейбл пути.
	_path_label = T00_PathLabel.new ()
	#_path_label.add_theme_font_override ("font", T00_Globals.LABEL_FONT_FACE_THIN)
	_path_label.text = get_path_label_empty_text ()
	_path_label.size = Vector2 (viewport_size.x - PATH_LABEL_BORDER_HORIZONTAL * 2, PATH_LABEL_HEIGHT)
	_path_label.position = Vector2 ((viewport_size.x - _path_label.size.x) * .5, viewport_size.y - ACTION_PANEL_HEIGHT + PATH_LABEL_OFFSET_Y)
	_path_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_path_label.modulate = Color (1, 1, 1, 0)
	add_child (_path_label)
	
	_book_container = ScrollContainer.new ()
	_book_container.size = Vector2 (800, 600)
	add_child (_book_container)
	
	# Лейбл книги.
	_book_label = Label.new ()
	_book_label.add_theme_font_override ("font", T00_Globals.LABEL_FONT_FACE_USUAL)
	_book_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_book_label.size = Vector2 (
		viewport_size.x - STORY_LABEL_BORDER_HORIZONTAL * 2,
		viewport_size.y - TOP_PANEL_HEIGHT - ACTION_PANEL_HEIGHT - STORY_LABEL_BORDER_VERTICAL * 2
	)
	_book_label.text = "This is a text for the book label."
	_book_container.add_child (_book_label)
	
	_fade_ratio = .0
	
	mouse_filter = Control.MOUSE_FILTER_PASS
	gui_input.connect (on_gui_input)
	
	_game._viewport.size_changed.connect (on_viewport_size_changed)
	on_viewport_size_changed ()


func _process (delta: float):
	
	match _state:
		STATE_FADE_IN:
			_fade_ratio += delta * _fade_speed
			if _fade_ratio > 1.0 || is_equal_approx (_fade_ratio, 1.0):
				_fade_ratio = 1.0
				_state = STATE_WAIT_INPUT
			
			# Непрозрачность.
			_story_label.modulate = Color (1, 1, 1, _fade_ratio)
			set_action_labels_opacity (_fade_ratio)
		
		STATE_WAIT_INPUT:
			return
		
		STATE_FADE_OUT:
			_fade_ratio -= delta * _fade_speed
			if _fade_ratio < .0 || is_zero_approx (_fade_ratio):
				_fade_ratio = .0
				# Просим Повествователя дать нам следующий бит истории.
				_cur_beat = _game._narrator.get_next_beat (_selected_action)
				# Меняем центральный текст.
				_story_label.text = _cur_beat._story_text
				# Меняем узел, в котором находимся, на корень дерева. Если _action_tree == null, то и текущий узел будет отсутствовать.
				_entered_node = _cur_beat._action_tree
				# Обновляем панель действий.
				update_action_panel ()
				# Начинаем делать текст видимым.
				_state = STATE_FADE_IN
			
			# Непрозрачность.
			_story_label.modulate = Color (1, 1, 1, _fade_ratio)
			set_action_labels_opacity (_fade_ratio)


func update_action_panel ():
	
	# Удаляем старые лейблы.
	var i: int = _action_labels.size ()
	while i:
		i -= 1
		var removed_label: Label = _action_labels.pop_back ()
		remove_child (removed_label)
		removed_label.queue_free ()
	
	# Устанавливаем текст для лейбла пути.
	if _entered_node:
		_path_label.text = get_path_label_useful_text ()
	else:
		_path_label.text = get_path_label_empty_text ()
	
	# Если дерево отсутствует, выходим.
	var tree: T00_ActionNode = _cur_beat._action_tree
	if !tree:
		return
	
	#var node: T00_ActionNode = _entered_node
	#if !_entered_node:
		#return
	
	var num_node_children: int = _entered_node.num_children
	
	var viewport_size: Vector2 = get_viewport_rect ().size
	var actions_start_y: float = viewport_size.y - ACTION_PANEL_HEIGHT + ACTION_LABEL_OFFSET_Y
	
	# Сколько лейблов нужно добавить. Пока что так.
	var num_labels_to_add: int = num_node_children
	var num_columns: int = int (ceilf (float (num_labels_to_add) / float (ACTION_LABEL_COLUMN_CAPACITY)))
	# Ширина группы, состоящей из всех колонок.
	var group_width: float = ACTION_LABEL_SIZE.x * num_columns + ACTION_LABEL_SPACING.x * (num_columns - 1)
	var actions_start_x: float = (viewport_size.x - group_width) * .5
	# На совсем худой конец, чтобы было видно, что косяк.
	if actions_start_x < 0:
		actions_start_x = 0
	
	# Добавляем новые лейблы.
	var column_index: int = 0
	var num_labels_added: int = 0
	var cur_x: float = actions_start_x
	while column_index < num_columns:
		var cur_y: float = actions_start_y
		var label_inner_index: int = 0
		while label_inner_index < ACTION_LABEL_COLUMN_CAPACITY:
			var cur_node: T00_ActionNode = _entered_node.get_child_at (num_labels_added)
			var label: Label = T00_ActionLabel.new (cur_node)
			label.text = cur_node.get_panel_text ()
			label.position = Vector2 (cur_x, cur_y)
			label.size = ACTION_LABEL_SIZE
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			_action_labels.push_back (label)
			add_child (label)
			
			# Next iteration.
			label_inner_index += 1
			num_labels_added += 1
			cur_y += ACTION_LABEL_SIZE.y + ACTION_LABEL_SPACING.y
			if num_labels_added >= num_labels_to_add:
				break
		
		column_index += 1
		cur_x += ACTION_LABEL_SIZE.x + ACTION_LABEL_SPACING.x
	
	pass


func set_action_labels_opacity (opacity: float):
	
	var mod_color: Color = Color (1, 1, 1, opacity)
	
	var i: int = _action_labels.size ()
	while i:
		i -= 1
		_action_labels[i].modulate = mod_color
	
	_path_label.modulate = mod_color


func get_path_label_empty_text () -> String:
	
	return "----------------"


func get_path_label_useful_text () -> String:
	
	if _entered_node.is_root ():
		return get_path_label_empty_text ()
	
	var result: String = ""
	var nodes: Array[T00_ActionNode] = _entered_node.get_path_to_root ()
	# Исключаем корневой узел.
	var i: int = nodes.size () - 1
	while i:
		i -= 1
		result += nodes[i].get_panel_text ()
		result += "/"
	
	# Отрезаем последний слеш.
	return result.substr (0, result.length () - 1)


func _draw ():
	
	var viewport_size: Vector2 = get_viewport_rect ().size
	
	# Background.
	draw_rect (Rect2 (Vector2.ZERO, viewport_size), Color.BLACK)
	# Top panel.
	draw_rect (Rect2 (0, 0, viewport_size.x, TOP_PANEL_HEIGHT), TOP_PANEL_COLOR)
	# Action panel.
	draw_rect (Rect2 (0, viewport_size.y - ACTION_PANEL_HEIGHT, viewport_size.x, ACTION_PANEL_HEIGHT), ACTION_PANEL_COLOR)
	
	# Устанавливаем размер self вручную, чтобы он регистрировал клики мышью.
	size = viewport_size


# ==================================================
# ==================== HANDLERS ====================
# ==================================================

func on_viewport_size_changed ():
	
	queue_redraw ()


func on_gui_input (event: InputEvent):
	
	if _state != STATE_WAIT_INPUT:
		return
	
	if !_cur_beat:
		return
	
	# Этот клик (в любое место экрана, кроме верхней панели) должен срабатывать только тогда, когда Повествователь не предложил нам никаких действий на выбор (дерево действий бита равно null).
	if !_cur_beat._action_tree:
		var mb_event: InputEventMouseButton = event as InputEventMouseButton
		if mb_event:
			if mb_event.pressed && mb_event.button_index == MOUSE_BUTTON_LEFT && mb_event.global_position.y > TOP_PANEL_HEIGHT:
				# Клик в любое место экрана срабатывает только при отсутствии выбора. Игрок не выбрал ничего.
				_selected_action = null
				_state = STATE_FADE_OUT


func on_story_label_draw ():
	
	_story_label.draw_rect (Rect2 (Vector2.ZERO, _story_label.size), Color (Color.AQUA, .2))


func on_action_label_pressed (label: T00_ActionLabel):
	
	var node: T00_ActionNode = label._node
	var action: T00_Action = node as T00_Action
	
	# Если кликнули по лейблу действия, запоминаем выбранное действие и запускаем затемнение экрана.
	if action:
		_selected_action = action
		_state = STATE_FADE_OUT
	# Если кликнули по предмету, обновляем лейблы на панели действий.
	else:
		_entered_node = node
		update_action_panel ()


func on_path_label_pressed ():
	
	if !_entered_node:
		return
	
	var parent_node: T00_ActionNode = _entered_node._parent
	if parent_node:
		_entered_node = parent_node
		update_action_panel ()
	# Если уже находимся в корневой ноде.
	else:
		pass


