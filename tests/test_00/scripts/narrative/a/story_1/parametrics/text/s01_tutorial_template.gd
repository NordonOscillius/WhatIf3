class_name S01_TutorialTemplate extends S01_TextTemplate


static var STATE_STEP_1: int = 1
static var STATE_STEP_2: int = 2
static var STATE_STEP_3: int = 3
#static var STATE_EXIT: int = 4


var _state: int = STATE_STEP_1

## Массив предложений, которые необходимо показывать непрерывно, не давая игроку действовать.
var _flow_sentences: Array[String] = []
## Дерево действий, которое будет предложено игроку, когда последнее предложение из потока будет показано на экране.
var _flow_action_tree: T00_ActionNode
## Если меньше нуля, то при завершении потока _state не будет переключаться. Если больше или равно нулю, то при завершении потока _state переключится в это значение.
var _flow_next_state: int = -1

var _is_over: bool = false
var _next_template: S01_TextTemplate

var _tutorial: S01_Parametric
var _sword: S01_Parametric
var _potion: S01_Parametric

var _char_is_by_table: bool = false
var _sword_is_taken: bool = false
var _potion_is_taken: bool = false


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var w: T00_A_Words = T00_A_Globals.words
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		var action_target: S01_Parametric = action.get_target () if action else null
		var action_type: StringName = action._type if action else &""
		match _state:
			STATE_STEP_1: generate_flow_for_step_1 ()
			STATE_STEP_2:
				if action_target == _tutorial:
					if action_type == T00_Action.TUT_CONTINUE:
						generate_flow_for_step_2 ()
					elif action_type == T00_Action.TUT_SKIP:
						generate_flow_for_exit ()
			STATE_STEP_3:
				if action_target == _sword:
					if action_type == T00_Action.INSPECT:
						generate_flow_for_inspecting_sword ()
					elif action_type == T00_Action.PICK_UP:
						generate_flow_for_picking_sword ()
				elif action_target == _potion:
					if action_type == T00_Action.INSPECT:
						generate_flow_for_inspecting_potion ()
					elif action_type == T00_Action.PICK_UP:
						generate_flow_for_picking_potion ()
			#STATE_EXIT:
				#generate_flow_for_exit ()
	
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
			_flow_next_state = -1
		
		return beat
	
	printerr ("Bad state.")
	beat._story_text = "Ошибка в генерации текста."
	beat._action_tree = null
	return beat


func is_over () -> bool:
	
	# Это костыль, очищающий книгу. Так делать не надо. Но я сделаю. Разок. Только для туториала.
	if _is_over:
		T00_Globals.game._narrator._book.clear ()
	
	return _is_over


func get_next_template () -> S01_TextTemplate:
	
	return _next_template


func generate_flow_for_step_1 ():
	
	var story: S01_Story = T00_A_Globals.story
	
	var s1: String = ""
	s1 += "Привет! Это короткое обучение познакомит тебя с управлением в игре."
	s1 += "\n\nЕсли хочешь продолжить обучение, щелкни левой кнопкой мыши по пункту \"обучение\", затем по пункту \"продолжить\"."
	s1 += "\n\nЕсли хочешь пропустить обучение, щелкни левой кнопкой мыши по пункту \"обучение\", затем по пункту \"пропустить\"."
	
	var s5: String = ""
	s5 += "В нижней части экрана отображаются предметы, доступные герою, и действия, которые он над ними может совершать. Например, сейчас тебе доступны два предмета: кинжал и урок."
	s5 += "\n\nЕсли хочешь пропустить"
	s5 += "\n\nКликни по предмету левой кнопкой мыши, чтобы попасть в его меню"
	
	_tutorial = S01_Parametric.new ()
	_tutorial._name = &"tutorial"
	_tutorial.create_and_add_action (T00_Action.TUT_CONTINUE)
	_tutorial.create_and_add_action (T00_Action.TUT_SKIP)
	_tutorial.set_action_panel_name (S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, T00_ConstPhrase.new ().setup ("обучение")))
	add_child (_tutorial)
	
	_flow_sentences = [s1]
	_flow_action_tree = create_action_tree ()
	_flow_next_state = STATE_STEP_2


func generate_flow_for_step_2 ():
	
	var s1: String = ""
	s1 += "Нижняя область экрана называется панелью действий."
	s1 += "\n\nЕсли ты не видишь на ней ничего, кроме надписи \"----------------\" (прямо как сейчас), то это означает, что тебе пока не доступно никаких действий. В этом случае ты можешь только следить за развитием сюжета, перелистывая страницы."
	s1 += "\n\nКликни левой кнопкой мыши по средней части экрана, чтобы перейти к следующей странице."
	
	var s2: String = ""
	s2 += "Как видишь, на этой странице тебе тоже не предоставляется никакого выбора."
	s2 += "\n\nПросто кликни по экрану, чтобы продолжить."
	
	var s3: String = ""
	s3 += "Все страницы, которые уже были показаны на экране, записываются в Книгу — историю того, что произошло в игре."
	s3 += "\n\nЗажми Tab, чтобы открыть Книгу. Отпусти Tab, чтобы закрыть ее."
	
	var s4: String = ""
	s4 += "Иногда на панели действий будут появляться названия предметов. Кликнув по предмету, ты попадешь в его меню со списком действий, которые ты можешь над ним совершить; при этом название предмета отобразится в верхней части панели. Чтобы выйти из меню предмета, щелкни по его названию на панели. Чтобы выбрать действие, щелкни по действию."
	s4 += "\n\nА теперь представь, что ты воин, который собирается в опасное путешествие. Перед тобой грубый деревянный стол, на котором лежат меч и зелье здоровья. Подбери оба предмета, чтобы завершить обучение."
	
	_tutorial.clear_actions_hierarchy ()
	remove_child (_tutorial)
	
	_sword = S01_Parametric.new ()
	_sword._name = &"sword"
	_sword.set_action_panel_name (S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, T00_ConstPhrase.new ().setup ("меч")))
	_sword.create_and_add_action (T00_Action.INSPECT)
	_sword.create_and_add_action (T00_Action.PICK_UP)
	add_child (_sword)
	
	_potion = S01_Parametric.new ()
	_potion._name = &"potion"
	_potion.set_action_panel_name (S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, T00_ConstPhrase.new ().setup ("зелье здоровья")))
	_potion.create_and_add_action (T00_Action.INSPECT)
	_potion.create_and_add_action (T00_Action.PICK_UP)
	add_child (_potion)
	
	_flow_sentences = [s1, s2, s3, s4]
	_flow_action_tree = create_action_tree ()
	_flow_next_state = STATE_STEP_3


func generate_flow_for_inspecting_sword ():
	
	var s1: String = ""
	if _sword_is_taken:
		s1 += "Ты опускаешь взгляд к ножнам, удерживающим клинок. Массивный эфес меча украшен большим рубином квадратной формы — даром гильдии мастеров Зайтаку за услугу, некогда оказанную им."
		#s1 += "Ты смотришь на ножны, из которых торчит рукоять меча."
	else:
		if _char_is_by_table:
			s1 += "Ты смотришь на меч, лежащий перед тобой. В свете чадящей свечи его лезвие сверкает оранжевыми отблесками."
		else:
			s1 += "Ты подходишь к столу, глядя на меч; в свете чадящей свечи его лезвие сверкает оранжевыми отблесками. Массивная рукоять украшена большим квадратным рубином."
	
	_char_is_by_table = true
	
	_sword.remove_action (T00_Action.INSPECT)
	
	_flow_sentences = [s1]
	_flow_action_tree = create_action_tree ()


func generate_flow_for_picking_sword ():
	
	var s1: String = ""
	if _char_is_by_table:
		s1 += "Ты "
	else:
		s1 += "Ты подходишь к столу, "
	s1 += "берешься за рукоять меча и поднимаешь его, удерживая обеими руками. Он тяжелый, но месяцы тренировок сделали тебя сильнее. Еще секунда — и меч оказывается в ножнах на твоем поясе."
	
	_sword_is_taken = true
	_char_is_by_table = true
	
	_sword.remove_action (T00_Action.PICK_UP)
	
	# Если игрок взял и меч, и зелье, завершаем туториал.
	if _sword_is_taken && _potion_is_taken:
		clear_actions_hierarchy ()
		_flow_sentences = [s1, get_success_text (), get_generativity_text (), get_exit_text ()]
		_flow_action_tree = null
		_next_template = S01_PoliceTemplate.new ()
	else:
		_flow_sentences = [s1]
		_flow_action_tree = create_action_tree ()


func generate_flow_for_inspecting_potion ():
	
	var s1: String = ""
	if _potion_is_taken:
		s1 += "Ты открываешь поясную сумку и смотришь на бутылочку с зельем. Ее горлышко закупорено деревянной пробкой. Внутри бутылки находится жидкость красного цвета."
		#s1 += "Ты смотришь бутылку с зельем, покоящуюся на дне поясной сумки."
		#s1 += "Ты смотришь бутылку с зельем, торчащую из поясной сумки."
		#s1 += "Ты смотришь на горлышко бутылки с зельем, которая торчит из поясной сумки."
	else:
		if _char_is_by_table:
			s1 += "Бутылочка с зельем, стоящая на столе, имеет форму треугольной пирамидки. Сверху она закупорена деревянной пробкой. Внутри бутылки находится жидкость красного цвета."
		else:
			s1 += "Ты подходишь к столу, глядя на бутылочку, закупоренную деревянной пробкой и содержащую внутри зелье красного цвета. Бутылка имеет форму треугольной пирамидки."
	
	_char_is_by_table = true
	
	_potion.remove_action (T00_Action.INSPECT)
	
	_flow_sentences = [s1]
	_flow_action_tree = create_action_tree ()


func generate_flow_for_picking_potion ():
	
	var s1: String = ""
	if _char_is_by_table:
		s1 += "Ты "
	else:
		s1 += "Ты подходишь к столу, "
	s1 += "берешь бутылочку с зельем и кладешь ее в маленькую поясную сумку. Возможно, для сражения с ведьмой этого будет недостаточно, но ты всё равно собирался зайти в магазин к Дрейку по пути."
	
	_potion_is_taken = true
	_char_is_by_table = true
	
	_potion.remove_action (T00_Action.PICK_UP)
	
	# Если игрок взял и меч, и зелье, завершаем туториал.
	if _sword_is_taken && _potion_is_taken:
		clear_actions_hierarchy ()
		_flow_sentences = [s1, get_success_text (), get_generativity_text (), get_exit_text ()]
		_flow_action_tree = null
		_next_template = S01_PoliceTemplate.new ()
	else:
		_flow_sentences = [s1]
		_flow_action_tree = create_action_tree ()


func generate_flow_for_exit ():
	
	var s1: String = ""
	s1 += get_exit_text ()
	
	_tutorial.clear_actions_hierarchy ()
	_next_template = S01_PoliceTemplate.new ()
	
	_flow_sentences = [s1]
	_flow_action_tree = null


func get_exit_text () -> String:
	
	return "\no - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o\n"


func get_success_text () -> String:
	
	var result: String = ""
	result += "Вот и всё, теперь можно приступать к игре. Забудь про воина и выходи из его роли; как ни прискорбно, эта история не про него."
	result += "\n\nБолее того, она не завершена (и не думаю, что когда-нибудь будет)."
	#var result: String = "Вот и всё, теперь ты знаешь всё, что нужно. Выходи из роли воина: эта история не про него."
	return result


func get_generativity_text () -> String:
	
	var result: String = ""
	result += "И последнее. Игра содержит элемент случайности: при каждом запуске ты получаешь новые результаты. Впрочем, основной костяк истории всегда остается неизменным."
	#result += "Эта история не завершена и, очевидно, уже не будет завершена."
	#result += "И последнее. Эта игра содержит элемент случайности: запустив ее по новой, ты получишь новые результаты. Впрочем, основной костяк истории всегда остается неизменным."
	return result


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
