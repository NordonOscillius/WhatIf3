class_name S01_TutorialTemplate extends S01_TextTemplate


static var STATE_INIT: int = 0


var _state: int = STATE_INIT

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
	var w: T00_A_Words = T00_A_Globals.words
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		match _state:
			STATE_INIT:
				generate_flow_for_step_1 ()
	
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


func generate_flow_for_step_1 ():
	
	var s1: String = ""
	s1 += "Привет! Это короткое обучение познакомит тебя с управлением в игре."
	s1 += "\n\nКликни левой кнопкой мыши по средней части экрана, чтобы продолжить."
	
	var s2: String = ""
	s2 += "В нижней части экрана отображаются предметы, доступные герою, и действия, которые он над ними может совершать. Например, сейчас тебе доступны два предмета: кинжал и урок."
	s2 += "\n\nЕсли хочешь пропустить"
	s2 += "\n\nКликни по предмету левой кнопкой мыши, чтобы попасть в его меню"
	
	_flow_sentences = [s1]
	_flow_action_tree = null


func create_action_tree () -> T00_ActionNode:
	
	var action_tree: T00_ActionNode
	
	var interactive_objects: Array[S01_Parametric] = []
	collect_interactive_children (interactive_objects)
	if interactive_objects.size ():
		action_tree = T00_ActionNode.new ()
		var num_interactives: int = interactive_objects.size ()
		var i: int = 0
		while i < num_interactives:
			var cur_interactive: S01_Parametric = interactive_objects[i]
			var panel_name_param: S01_PhraseParamValue = cur_interactive.get_action_panel_name ()
			var panel_name: String
			if panel_name_param:
				# А как мы узнаем, какой вообще тип WordUsage нам нужен?
				# Получается, абстракция в этом случае заруинила всю идею.
				# Хотя сейчас мне повезло: во всех конкретных реализация get_form_for() используются NounUsage.
				# Наверное, это из-за того, что мы действуем НАД ОБЪЕКТОМ.
				panel_name = panel_name_param._value.get_form_for (T00_NounUsage.create_initial ())
			else:
				panel_name = "какой-то объект"
			
			var object_node: T00_ObjectNode = T00_ObjectNode.new ().__name (panel_name).__target (cur_interactive)
			action_tree.add_child (object_node)
			
			var num_interactive_actions: int = cur_interactive.num_actions
			var j: int = 0
			while j < num_interactive_actions:
				var object_action: T00_Action = cur_interactive.get_action_at (j)
				var tree_action: T00_Action = T00_Action.new ().setup (object_action._type)
				object_node.add_child (tree_action)
				
				j += 1
			
			i += 1
	else:
		action_tree = null
	
	return action_tree
