class_name T00_StoryPlayer extends Control


static var STATE_FADE_IN: int = 0
static var STATE_WAIT_INPUT: int = 1
static var STATE_FADE_OUT: int = 2

static var TOP_PANEL_HEIGHT: int = 50
static var TOP_PANEL_COLOR: Color = T00_Utils.hsl_to_rgb (0, 0, .04)
static var ACTION_PANEL_HEIGHT: int = 240
static var ACTION_PANEL_COLOR: Color = T00_Utils.hsl_to_rgb (0, 0, .04)
static var ACTION_LABEL_SIZE: Vector2 = Vector2 (320, 24)
static var ACTION_LABEL_SPACING: int = 4
static var STORY_LABEL_BORDER_HORIZONTAL: int = 200
static var STORY_LABEL_BORDER_VERTICAL: int = 60

var _state: int = STATE_FADE_IN
var _fade_speed: float = 4.0
## Непрозрачность элементов на экране. Единица соответствует полностью видимому интерфейсу.
var _fade_ratio: float = .0
## Текущий бит истории. Получаем из Повествователя.
var _cur_beat: T00_Beat
## Действие, которое игрок выбрал в фазе STATE_WAIT_INPUT.
var _selected_action: T00_Action = null

var _story_label: Label
## Массив, хранящий набор лейблов, представляющих варианты ответа.
var _action_labels: Array[T00_ActionLabel] = []

var _game: T00_Game


func _init (game: T00_Game):
	
	_game = game


func _ready ():
	
	var viewport_size: Vector2 = get_viewport_rect ().size
	
	# Получаем первый бит истории от Повествователя.
	_cur_beat = _game._narrator.get_next_beat (null)
	
	_story_label = Label.new ()
	_story_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var story_label_size: Vector2 = Vector2 (
		viewport_size.x - STORY_LABEL_BORDER_HORIZONTAL * 2,
		viewport_size.y - TOP_PANEL_HEIGHT - ACTION_PANEL_HEIGHT - STORY_LABEL_BORDER_VERTICAL * 2
	)
	_story_label.size = story_label_size
	_story_label.position.x = (viewport_size.x - _story_label.size.x) * .5
	_story_label.position.y = TOP_PANEL_HEIGHT + STORY_LABEL_BORDER_VERTICAL
	_story_label.text = _cur_beat._story_text
	_story_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_story_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_story_label.modulate = Color (1, 1, 1, 0)
	#_story_label.draw.connect (on_story_label_draw)
	_story_label.mouse_filter = Control.MOUSE_FILTER_PASS
	add_child (_story_label)
	
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
			
			_story_label.modulate = Color (1, 1, 1, _fade_ratio)
		
		STATE_WAIT_INPUT:
			return
		
		STATE_FADE_OUT:
			_fade_ratio -= delta * _fade_speed
			if _fade_ratio < .0 || is_zero_approx (_fade_ratio):
				_fade_ratio = .0
				# Просим Повествователя дать нам следующий бит истории и меняем текст, отображаемый на экране.
				_cur_beat = _game._narrator.get_next_beat (_selected_action)
				_story_label.text = _cur_beat._story_text
				# Обновляем панель действий.
				update_action_panel ()
				# Начинаем делать текст видимым.
				_state = STATE_FADE_IN
			
			_story_label.modulate = Color (1, 1, 1, _fade_ratio)


func update_action_panel ():
	
	var i: int
	
	# Удаляем старые лейблы.
	i = _action_labels.size ()
	while i:
		i -= 1
		var removed_label: Label = _action_labels.pop_back ()
		remove_child (removed_label)
		removed_label.queue_free ()
	
	# Если дерево отсутствует, выходим.
	var tree: T00_ActionNode = _cur_beat._action_tree
	if !tree:
		return
	
	var num_root_children: int = tree.num_children
	
	var viewport_size: Vector2 = get_viewport_rect ().size
	const top_border: float = 10
	var actions_start_y: float = viewport_size.y - ACTION_PANEL_HEIGHT + top_border
	
	# Добавляем новые лейблы.
	i = 0
	var cur_y: float = actions_start_y
	while i < num_root_children:
		var label: Label = T00_ActionLabel.new ()
		label.text = tree.get_child_at (i).get_panel_text ()
		label.position = Vector2 (200, cur_y)
		label.size = ACTION_LABEL_SIZE
		_action_labels.push_back (label)
		add_child (label)
		
		i += 1
		cur_y += ACTION_LABEL_SIZE.y + ACTION_LABEL_SPACING
	pass


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
