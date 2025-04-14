class_name S01_PoliceTemplate extends S01_TextTemplate


static var STATE_EXPOSITION: int = 0
static var STATE_GETTING_TO_TABLE: int = 1

var _state: int = STATE_EXPOSITION

## Массив предложений, которые необходимо показывать непрерывно, не давая игроку действовать.
var _flow_sentences: Array[String] = []
## Дерево действий, которое будет предложено игроку, когда последнее предложение из потока будет показано на экране.
var _flow_action_tree: T00_ActionNode
## Если меньше нуля, то при завершении потока _state не будет переключаться. Если больше или равно нулю, то при завершении потока _state переключится в это значение.
var _flow_next_state: int = -1


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		match _state:
			STATE_EXPOSITION:
				generate_flow_for_exposition ()
		pass
	
	# Если в очереди еще остались непоказанные предложения, показываем очередное.
	# Теперь эта проверка является излишней.
	if (_flow_sentences.size ()):
		beat._story_text = _flow_sentences.pop_front ()
		if _flow_sentences.size ():
			beat._action_tree = null
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


func generate_flow_for_exposition ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	
	var hero_gender: S01_ParamValue = story._hero.get_gender ()
	var hero_is_male: bool = S01_Gender.MALE.equals (hero_gender)
	# Additional check.
	if !hero_is_male && !S01_Gender.FEMALE.equals (hero_gender):
		printerr ("Unknown hero gender.")
	
	var introducer_gender: S01_ParamValue = story._introducer.get_gender ()
	var introducer_is_male: bool = S01_Gender.MALE.equals (introducer_gender)
	if !introducer_is_male && !S01_Gender.FEMALE.equals (introducer_gender):
		printerr ("Unknown introducer gender.")
	
	var s1: String = " - Присаживайтесь, "
	if hero_is_male:
		s1 += "мистер "
	else:
		s1 += "мисс "
	s1 += story._hero._last_name.get_form_for (T00_LastNameUsage.create_initial ())
	s1 += "."
	
	var s2: String = "Я "
	s2 += "стоял " if hero_is_male else "стояла "
	s2 += "в дверях, на пороге тесного облупленного кабинета; напротив меня за столом, заваленным папками и бумагами, "
	s2 += "сидел " if introducer_is_male else "сидела "
	s2 += "лейтенант "
	s2 += story._introducer._last_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (introducer_gender))
	s2 += "."
	
	# Сделаем кого-нибудь интерактивным.
	story._introducer.create_and_add_action (T00_Action.GREET)
	
	## Соберем все интерактивные объекты.
	#var interactive_objects: Array[S01_Parametric] = []
	#story.collect_interactive_children (interactive_objects)
	#if interactive_objects.size ():
		#_flow_action_tree = T00_ActionNode.new ()
		#var num_interactives: int = interactive_objects.size ()
		#var i: int = 0
		#while i < num_interactives:
			#var cur_interactive: S01_Parametric = interactive_objects[i]
			#var panel_name_param: S01_PhraseParamValue = cur_interactive.get_action_panel_name ()
			#var panel_name: String
			#if panel_name_param:
				#panel_name = panel_name_param._value.get_form_for (T00_NounUsage.create_initial ())
			#else:
				#panel_name = "какой-то объект"
			#
			#var object_node: T00_ObjectNode = T00_ObjectNode.new ().__name (panel_name)
			#_flow_action_tree.add_child (object_node)
			#
			#var num_actions: int = cur_interactive.num_actions
			#var j: int = 0
			#while j < num_actions:
				#var object_action: T00_Action = cur_interactive.get_action_at (j)
				#var tree_action: T00_Action = T00_Action.new ().setup (object_action._type)
				#object_node.add_child (tree_action)
				#
				#j += 1
			#
			#i += 1
	#else:
		#_flow_action_tree = null
	
	_flow_sentences = [s1, s2]
	_flow_action_tree = story.create_action_tree ()
	_flow_next_state = STATE_GETTING_TO_TABLE
