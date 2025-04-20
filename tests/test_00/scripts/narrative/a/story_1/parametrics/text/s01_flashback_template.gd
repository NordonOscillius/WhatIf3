class_name S01_FlashbackTemplate extends S01_TextTemplate


static var STATE_EXPOSITION: int = 0


var _state: int = STATE_EXPOSITION

## Массив предложений, которые необходимо показывать непрерывно, не давая игроку действовать.
var _flow_sentences: Array[String] = []
## Дерево действий, которое будет предложено игроку, когда последнее предложение из потока будет показано на экране.
var _flow_action_tree: T00_ActionNode
## Если меньше нуля, то при завершении потока _state не будет переключаться. Если больше или равно нулю, то при завершении потока _state переключится в это значение.
var _flow_next_state: int = -1

var _is_over: bool = false
var _next_template: S01_TextTemplate


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		match _state:
			STATE_EXPOSITION:
				generate_flow_for_exposition ()
	
	# Если в очереди еще остались непоказанные предложения, показываем очередное.
	# Теперь эта проверка является излишней.
	if (_flow_sentences.size ()):
		beat._story_text = _flow_sentences.pop_front ()
		if _flow_sentences.size ():
			beat._action_tree = null
		else:
			# Если установили _next_template, значит, готовы переключиться на новый шаблон текста. Ставим _is_over в true, чтобы Повествователь смог переключить шаблон на новый.
			if _next_template:
				_is_over = true
			# Иначе работаем в обычном режиме: на последнем предложении потока показываем дерево действий.
			else:
				beat._action_tree = _flow_action_tree
		
		# Если необходимо, переключаем _state в следующее значение.
		if _flow_next_state >= 0:
			_state = _flow_next_state
		
		return beat
	
	printerr ("Bad state.")
	beat._story_text = "Ошибка в генерации текста."
	beat._action_tree = null
	return beat


func is_over () -> bool:
	
	return _is_over


func get_next_template () -> S01_TextTemplate:
	
	return _next_template


func generate_flow_for_exposition ():
	
	var story: S01_Story = T00_A_Globals.story
	
	var s1: String = ""
	s1 += "Flashback Template."
	
	_flow_sentences = [s1]
	_flow_action_tree = null
	#_flow_action_tree = story.create_action_tree ()
