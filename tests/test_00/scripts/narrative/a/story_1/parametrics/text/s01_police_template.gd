class_name S01_PoliceTemplate extends S01_TextTemplate


static var STATE_EXPOSITION: int = 0
static var STATE_INTRODUCTION: int = 1

static var INTRODUCER_POSE_SITTING_STRAIGHT: int = 0
static var INTRODUCER_POSE_SITTING_BACK: int = 1

static var INTRODUCER_ACTION_WAITING_TO_COME_UP: int = 0
static var INTRODUCER_ACTION_WAITING_FOR_QUESTIONS: int = 1
static var INTRODUCER_ACTION_WAITING_FOR_SIGNING: int = 2

static var HERO_LOCATION_NEAR_DOOR: int = 0
static var HERO_LOCATION_NEAR_TABLE: int = 1

static var MENTION_NONE: StringName = &"none"
static var MENTION_POLICEMAN: StringName = &"policeman"
static var MENTION_CLUE_CONTAINER: StringName = &"clue_container"
static var MENTION_CLUE_UNINSPECTED: StringName = &"clue_uninspected"
static var MENTION_CLUE_INSPECTED: StringName = &"clue_inspected"
static var MENTION_HOUSE_KEY_INSPECTED: StringName = &"house_key_inspected"

var _state: int = STATE_EXPOSITION

## Массив предложений, которые необходимо показывать непрерывно, не давая игроку действовать.
var _flow_sentences: Array[String] = []
## Дерево действий, которое будет предложено игроку, когда последнее предложение из потока будет показано на экране.
var _flow_action_tree: T00_ActionNode
## Если меньше нуля, то при завершении потока _state не будет переключаться. Если больше или равно нулю, то при завершении потока _state переключится в это значение.
var _flow_next_state: int = -1

var _door_is_closed: bool = false
var _hero_location: int = HERO_LOCATION_NEAR_DOOR
var _introducer_pose: int = INTRODUCER_POSE_SITTING_STRAIGHT
var _introducer_action: int = INTRODUCER_ACTION_WAITING_TO_COME_UP
## Интродьюсер только что увидел, как герой задумался над зацепкой.
var _introducer_have_seen_flashback: bool = false
## Герой изучил зацепку и готов вот-вот получить флешбэк.
var _hero_inspected_clue: bool = false
var _hero_knows_about_testament: bool = false
var _last_object_mentioned: StringName


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		match _state:
			STATE_EXPOSITION:
				generate_flow_for_exposition ()
			STATE_INTRODUCTION:
				if action:
					var action_target: S01_Parametric = action.get_target ()
					var action_type: StringName = action._type
					if action_target == story._introducer:
						if action_type == T00_Action.GREET:
							generate_flow_for_greeting_introducer ()
						elif action_type == T00_Action.INSPECT:
							generate_flow_for_introducer_look ()
						elif action_type == T00_Action.COME_UP:
							generate_flow_for_coming_up ()
						elif action_type == T00_Action.ASK_ABOUT_CLUE_CONTAINER:
							generate_flow_for_asking_about_container ()
					elif action_target == story._clue_container:
						if action_type == T00_Action.INSPECT:
							generate_flow_for_clue_container_inspect ()
						if action_type == T00_Action.OPEN:
							generate_flow_for_clue_container_open ()
					elif action_target is S01_ClueContainerItem:
						generate_flow_for_inspecting_item (action_target as S01_ClueContainerItem)
					elif action_target == story.get_or_create_document ():
						if action_type == T00_Action.INSPECT:
							generate_flow_for_inspecting_document ()
						elif action_type == T00_Action.SIGN:
							generate_flow_for_signing_document ()
	
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
	
	var s1: String = " — Присаживайтесь, "
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
	s2 += story._introducer._first_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE) + " "
	s2 += story._introducer._last_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (introducer_gender))
	s2 += " — "
	s2 += get_introducer_first_description ()
	s2 += "."
	
	_last_object_mentioned = MENTION_POLICEMAN
	
	# Сделаем кого-нибудь интерактивным.
	story._introducer.create_and_add_action (T00_Action.GREET)
	story._introducer.create_and_add_action (T00_Action.INSPECT)
	story._introducer.create_and_add_action (T00_Action.COME_UP)
	
	_flow_sentences = [s1, s2]
	_flow_action_tree = story.create_action_tree ()
	_flow_next_state = STATE_INTRODUCTION


func generate_flow_for_introducer_look ():
	
	var story: S01_Story = T00_A_Globals.story
	var introducer_is_male: bool = get_introducer_is_male ()
	
	var s1: String = ""
	if _introducer_action == INTRODUCER_ACTION_WAITING_TO_COME_UP:
		s1 += "Низкий и плотный, сейчас он казался " if introducer_is_male else "Низкая и плотная, сейчас она казалась "
		s1 += "еще меньше, чем обычно."
		if _introducer_pose == INTRODUCER_POSE_SITTING_STRAIGHT:
			s1 += " Приветливо улыбаясь, "
			s1 += "он показывал " if introducer_is_male else "она показывала "
			s1 += "рукой на стол."
		elif _introducer_pose == INTRODUCER_POSE_SITTING_BACK:
			s1 += " Довольно вжавшись в кресло, "
			s1 += "он всё ожидал, " if introducer_is_male else "она всё ожидала, "
			s1 += "что я займу место напротив."
		pass
	elif _introducer_action == INTRODUCER_ACTION_WAITING_FOR_QUESTIONS:
		#s1 += "Офицер смотрел на меня внимательно, как будто ожидая встречных вопросов."
		s1 += "Офицер "
		s1 += "смотрел " if introducer_is_male else "смотрела "
		s1 += "на меня выжидающе, как будто желая узнать, что я буду делать дальше."
	elif _introducer_action == INTRODUCER_ACTION_WAITING_FOR_SIGNING:
		s1 += "Офицер "
		s1 += "ждала, когда я подпишу бумаги."
	
	_last_object_mentioned = MENTION_POLICEMAN
	
	story._introducer.remove_action (T00_Action.INSPECT)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_greeting_introducer ():
	
	var story: S01_Story = T00_A_Globals.story
	var introducer: S01_Introducer = story._introducer
	var introducer_is_male: bool = get_introducer_is_male ()
	var hero_is_male: bool = get_hero_is_male ()
	
	var s1: String = " — Здравствуйте, "
	s1 += "мистер " if introducer_is_male else "миссис "
	s1 += story._introducer._last_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (introducer.get_gender ()))
	s1 += "! — Я "
	s1 += "шагнул " if hero_is_male else "шагнула "
	s1 += "вглубь кабинета и "
	s1 += "прикрыл " if hero_is_male else "прикрыла "
	s1 += "за собой дверь.\n\nОфицер "
	s1 += "сделал " if introducer_is_male else "сделала "
	s1 += "приветственный жест и "
	s1 += "откинулся " if introducer_is_male else "откинулась "
	s1 += "на спинку кресла."
	
	_last_object_mentioned = MENTION_POLICEMAN
	
	_door_is_closed = true
	_introducer_pose = INTRODUCER_POSE_SITTING_BACK
	introducer.remove_action (T00_Action.GREET)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_coming_up ():
	
	var story: S01_Story = T00_A_Globals.story
	var hero_is_male: bool = get_hero_is_male ()
	var introducer_is_male: bool = get_introducer_is_male ()
	var x_is_male: bool = get_x_is_male ()
	var w: T00_A_Words = T00_A_Globals.words
	
	var s1: String = ""
	if !_door_is_closed:
		_door_is_closed = true
		s1 += "Закрыв за собой дверь и пройдя буквально пару шагов, я "
	else:
		s1 += "Пройдя буквально пару шагов и оказавшись рядом с рабочим столом " + w.leytenant.get_form (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE) + ", я "
	s1 += "уселся " if hero_is_male else "уселась "
	s1 += "на твердый неудобный стул."
	
	var s2: String = ""
	s2 += " — Я не задержу вас надолго, — "
	s2 += "успокоил " if introducer_is_male else "успокоила "
	s2 += "меня лейтенант.\n\n"
	s2 += "Он нагнулся " if introducer_is_male else "Она нагнулась "
	s2 += "к ящику стола и "
	s2 += "достал оттуда " if introducer_is_male else "достала оттуда "
	s2 += story._clue_container.get_description_long ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	s2 += "."
	
	var s3: String = ""
	s3 += " — Как я вам и "
	s3 += "говорил, " if introducer_is_male else "говорила, "
	s3 += "мы закрываем дело об исчезновении "
	s3 += "вашего " if x_is_male else "вашей "
	s3 += get_x_to_hero_relation_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
	s3 += ". С этого дня "
	s3 += "он " if x_is_male else "она "
	s3 += "считается без вести "
	s3 += "пропавшим" if x_is_male else "пропавшей"
	s3 += ". Срок давности прошел, все работы проведены, никаких зацепок в "
	s3 += "его " if x_is_male else "ее "
	s3 += "доме найдено не было; так что больше мы ничего не можем для вас сделать. А это, — "
	s3 += "он протянул мне " if introducer_is_male else "она протянула мне "
	s3 += story._clue_container.get_description_short ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	s3 += ", — велено передать вам."
	
	var s4: String = "Я "
	s4 += "взял " if hero_is_male else "взяла "
	s4 += story._clue_container.get_description_short ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	s4 += " в руки."
	
	_last_object_mentioned = MENTION_CLUE_CONTAINER
	
	_hero_location = HERO_LOCATION_NEAR_TABLE
	_introducer_action = INTRODUCER_ACTION_WAITING_FOR_QUESTIONS
	_introducer_pose = INTRODUCER_POSE_SITTING_STRAIGHT
	story._introducer.remove_action (T00_Action.COME_UP)
	story._introducer.remove_action (T00_Action.GREET)
	# Подменяем название действия.
	T00_Action.replace_name_for_type (T00_Action.ASK_ABOUT_CLUE_CONTAINER, "спросить, что в " + story._clue_container.get_description_short ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.PREPOSITIONAL, T00_WordNumber.SINGLE)))
	#T00_Action.replace_name_for_type (T00_Action.ASK_ABOUT_CLUE_CONTAINER, "спросить про " + story._clue_container.get_description_short ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE)))
	story._introducer.create_and_add_action (T00_Action.ASK_ABOUT_CLUE_CONTAINER)
	story._clue_container.create_and_add_action (T00_Action.INSPECT)
	
	_flow_sentences = [s1, s2, s3, s4]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_clue_container_inspect ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	var clue_container_phrase: T00_SimplePhrase = story._clue_container.get_description_short ()
	var hero_is_male: bool = get_hero_is_male ()
	var hero_word_gender: int = T00_WordGender.MASCULINE if hero_is_male else T00_WordGender.FEMININE
	
	var s1: String = ""
	var clue_container_type: S01_StringParamValue = story._clue_container.get_container_type ()
	match clue_container_type.value:
		
		S01_ClueContainerType.TRANSPARENT_BAG.value:
			#s1 += "Это был самый обычный полиэтиленовый пакет." if _last_object_mentioned == MENTION_CLUE_CONTAINER else "Я посмотрел на пакет у себя в руках: самый обычный, из прозрачного полиэтилена."
			if _last_object_mentioned == MENTION_CLUE_CONTAINER:
				s1 += "Это был самый обычный полиэтиленовый пакет."
			else:
				s1 += "Я "
				s1 += w.posmotret.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, hero_word_gender, T00_WordNumber.SINGLE)
				s1 += " на пакет у себя в руках: самый обычный, из прозрачного полиэтилена."
			var items: Array[S01_ClueContainerItem] = story._clue_container.get_items ()
			var num_items: int = items.size ()
			if num_items == 1:
				s1 += " На его дне "
				# Лежал или лежала.
				var item_phrase: T00_SimplePhrase = S01_ItemType.get_description_uninspected (items[0].get_item_type ())
				var item_phrase_subject: T00_Noun = item_phrase.get_subject ()
				s1 += w.lezhat.get_form_for_noun (item_phrase_subject, T00_WordTense.PAST, T00_WordNumber.SINGLE)
				s1 += " "
				# Маленький черный предмет.
				s1 += item_phrase.get_form_for (T00_NounUsage.create_initial ())
				s1 += ". "
				# Текст про знакомость предмета-зацепки.
				s1 += get_clue_familiarity_text (item_phrase, true, hero_is_male)
				s1 += ". "
			# Ну мы ведь знаем, что предметов будет точно не больше двух, да? :/
			else:
				s1 += " На его дне лежали "
				var clue_item: S01_ClueContainerItem = items[0]
				var second_item: S01_ClueContainerItem = items[1]
				if !clue_item._is_clue:
					var temp_item: S01_ClueContainerItem = clue_item
					clue_item = second_item
					second_item = temp_item
				var clue_item_phrase: T00_SimplePhrase = S01_ItemType.get_description_uninspected (clue_item.get_item_type ())
				var clue_item_subject: T00_Noun = clue_item_phrase.get_subject ()
				# Ключ от дома.
				s1 += S01_ItemType.get_description_uninspected (second_item.get_item_type ()).get_form_for (T00_NounUsage.create_initial ())
				s1 += " и "
				# Предмет-зацепка.
				s1 += clue_item_phrase.get_form_for (T00_NounUsage.create_initial ())
				s1 += ". "
				var clue_item_phrase_short: T00_SimplePhrase = S01_ItemType.get_description_uninspected_short (clue_item.get_item_type ())
				s1 += get_clue_familiarity_text (clue_item_phrase_short, false, hero_is_male)
				s1 += ". "
			_last_object_mentioned = MENTION_CLUE_UNINSPECTED
		
		S01_ClueContainerType.PAPER_BAG.value:
			if _last_object_mentioned == MENTION_CLUE_CONTAINER:
				s1 += "Он был сделан из желтой бумаги"
			else:
				s1 += "Я "
				s1 += w.posmotret.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, hero_word_gender, T00_WordNumber.SINGLE)
				s1 += " на пакет у себя в руках: обычный желтый бумажный пакет"
			var heaviness: S01_StringParamValue = story._clue_container.get_heaviness ()
			if S01_Heaviness.LIGHT.equals (heaviness):
				if _last_object_mentioned == MENTION_CLUE_CONTAINER:
					s1 += " и, как мне показалось, почти ничего не весил — как будто внутри ничего и не было."
				else:
					s1 += ", который, как мне показалось, почти ничего не весил — как будто внутри ничего и не было."
			elif S01_Heaviness.HEAVY.equals (heaviness):
				if _last_object_mentioned == MENTION_CLUE_CONTAINER:
					s1 += "; покачав его в руке, я "
					s1 += "почувствовал" if hero_is_male else "почувствовала"
					s1 += " тяжесть предмета, заключенного внутри."
					pass
				else:
					s1 += ", только с чем-то тяжелым внутри."
			else:
				if _last_object_mentioned == MENTION_CLUE_CONTAINER:
					s1 += ", шершавой на ощупь. Ничего необычного."
				else:
					s1 += ", шершавый на ощупь. Ничего необычного."
			_last_object_mentioned = MENTION_CLUE_CONTAINER
		
		S01_ClueContainerType.CYLINER_BUNDLE.value:
			if _last_object_mentioned != MENTION_CLUE_CONTAINER:
				s1 += "Я "
				s1 += w.posmotret.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, hero_word_gender, T00_WordNumber.SINGLE)
				s1 += " на сверток у себя в руках. "
			s1 += "Он был округлым, почти цилиндрической формы — как тубус, обернутый бумагой"
			var heaviness: S01_StringParamValue = story._clue_container.get_heaviness ()
			if S01_Heaviness.LIGHT.equals (heaviness):
				s1 += " — и совсем легким для своего размера."
			elif S01_Heaviness.HEAVY.equals (heaviness):
				s1 += " — и тяжелым, как будто внутри был кусок металла или камень."
			else:
				s1 += "."
			_last_object_mentioned = MENTION_CLUE_CONTAINER
		
		S01_ClueContainerType.BOX.value:
			if _last_object_mentioned != MENTION_CLUE_CONTAINER:
				s1 += "Я "
				s1 += w.posmotret.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, hero_word_gender, T00_WordNumber.SINGLE)
				s1 += " на коробку у себя в руках. "
			s1 += "Она была небольшой, сантиметров пятнадцать в длину"
			#s1 += "Она была небольшой, сантиметров пятнадцать в длину" if _last_object_mentioned == MENTION_CLUE_CONTAINER else "Я посмотрел на коробочку у себя в руках. Она была небольшой, сантиметров пятнадцать в длину"
			var heaviness: S01_StringParamValue = story._clue_container.get_heaviness ()
			if S01_Heaviness.LIGHT.equals (heaviness):
				s1 += ", и совсем легкой, как будто бы пустой."
			elif S01_Heaviness.HEAVY.equals (heaviness):
				s1 += ", и довольно тяжелой — по крайней мере, тяжелее, чем мне поначалу показалось."
			else:
				s1 += ", и добротной, из твердого толстого картона."
			_last_object_mentioned = MENTION_CLUE_CONTAINER
	
	story._clue_container.remove_action (T00_Action.INSPECT)
	if clue_container_type.equals (S01_ClueContainerType.TRANSPARENT_BAG):
		# Добавить возможность рассмотреть предметы по отдельности.
		story._clue_container.create_and_add_action_to_all_items (T00_Action.INSPECT)
		# ...
		pass
	else:
		story._clue_container.create_and_add_action (T00_Action.OPEN)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_clue_container_open ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	var hero_is_male: bool = get_hero_is_male ()
	
	var s1: String
	match story._clue_container.get_container_type ().value:
		
		S01_ClueContainerType.TRANSPARENT_BAG.value:
			# На прозрачный пакет герой не смотрит еще раз; вместо этого он может достать содержимое - конкретные предметы.
			printerr ("Недопустимый вариант.")
			return
		S01_ClueContainerType.PAPER_BAG.value:
			s1 += "Я "
			s1 += "отогнул " if hero_is_male else "отогнула "
			s1 += "край пакета и "
			s1 += "осмотрел " if hero_is_male else "осмотрела "
			s1 += "содержимое. Внутри "
		S01_ClueContainerType.CYLINER_BUNDLE.value:
			s1 += "Я "
			s1 += "развязал " if hero_is_male else "развязала "
			s1 += "бечевку, скреплявшую сверток, и "
			s1 += "стал " if hero_is_male else "стала "
			s1 += "разворачивать бумажную обертку. Внутри "
			#s1 += "Я покрутил сверток в руках, отыскал краешек бумаги, служившей его оберткой, и стал ее разворачивать."
		S01_ClueContainerType.BOX.value:
			s1 += "Я "
			s1 += "положил " if hero_is_male else "положила "
			s1 += "коробку на колени и "
			s1 += "снял " if hero_is_male else "сняла "
			s1 += "крышку. Внутри "
			#s1 += "Я положил коробку на колени и поднял крышку. Внутри оказался..."
	s1 += get_clue_container_contents_text (w.okazatsya)
	s1 += "."
	
	_last_object_mentioned = MENTION_CLUE_UNINSPECTED
	
	story._clue_container.remove_action (T00_Action.OPEN)
	story._clue_container.create_and_add_action_to_all_items (T00_Action.INSPECT)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_inspecting_item (item: S01_ClueContainerItem):
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	var hero_is_male: bool = get_hero_is_male ()
	var x_is_male: bool = get_x_is_male ()
	
	var s1: String = ""
	
	if item._is_clue:
		s1 += "Я "
		s1 += "поднес " if hero_is_male else "поднесла "
		s1 += S01_ItemType.get_description_uninspected_short (item.get_item_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE)) + " "
		s1 += "поближе к глазам."
	
	match item.get_item_type ().value:
		
		S01_ItemType.TOKEN_MARK.value:
			s1 += " Это был плоский "
			# Шестиугольный.
			s1 += S01_GeometricShape.get_adjectve_for_shape (item.get_geometric_shape ()).get_form (T00_WordGender.MASCULINE, T00_WordNumber.SINGLE, T00_WordAnimacy.INANIMATE, T00_WordCase.NOMINATIVE)
			#s1 += S01_GeometricShape.get_adjectve_for_shape (item.get_geometric_shape ()).get_form_for (T00_NounUsage.create_initial ())
			s1 += " жетон "
			# Черного.
			s1 += S01_Color.get_phrase_for_color (item.get_color ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
			s1 += " цвета, сделанный, похоже, из дерева. На одной из его сторон был выжжен символ: "
			# Открытый глаз.
			s1 += S01_SecretSignType.get_description_medium (item.get_secret_sign_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
			s1 += "."
		#S01_ItemType.SMALL_KEY.value:
		
		S01_ItemType.SHAPED_STONE.value:
			s1 += " Он был потертый, с небольшими сколами по углам, а по форме напоминал призму с "
			# Треугольным.
			s1 += S01_GeometricShape.get_adjectve_for_shape (item.get_geometric_shape ()).get_form (T00_WordGender.MASCULINE, T00_WordNumber.SINGLE, T00_WordAnimacy.INANIMATE, T00_WordCase.INSTRUMENTAL)
			s1 += " основанием. Материал камня имел "
			# Синий.
			var color_phrase: T00_SimplePhrase = S01_Color.get_phrase_for_color (item.get_color (), T00_WordGender.MASCULINE, T00_WordAnimacy.INANIMATE)
			s1 += color_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
			s1 += " цвет; на одной из его сторон я заметил рельефный символ: "
			# Открытый глаз.
			s1 += S01_SecretSignType.get_description_medium (item.get_secret_sign_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
			s1 += "."
		
		S01_ItemType.SHEET_OF_PAPER.value:
			s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Бумага была "
			# Белой.
			s1 += S01_Color.get_phrase_for_color (item.get_color (), T00_WordGender.FEMININE).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE))
			s1 += "; с одной стороны листа был напечатан текст на незнакомом языке, а на другой стороне текст заканчивался, завершая главу. Сразу после него, на свободном пространстве страницы, располагался символ в виде "
			#s1 += "; с одной стороны листа был напечатан текст на незнакомом языке, а на другой стороне текст заканчивался, завершая главу. Сразу после него, на свободном пространстве страницы, был изображен символ в виде "
			# Игральной кости.
			s1 += S01_SecretSignType.get_description_medium (item.get_secret_sign_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
			s1 += " — разделитель глав."
			
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Лист бумаги был "
			## Белым.
			#s1 += S01_Color.get_phrase_for_color (item.get_color ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE))
			#s1 += "; с одной его стороны был напечатан текст на незнакомом языке, а на другой стороне текст заканчивался, завершая главу. Сразу после него, на свободном пространстве страницы, был изображен символ в виде "
			## Игральной кости.
			#s1 += S01_SecretSignType.get_description_medium (item.get_secret_sign_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
			#s1 += " — разделитель глав."
			
			# "Бумага была светло-серой; с одной стороны листа..."
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Лист бумаги был белым; с одной его стороны был напечатан текст на незнакомом языке, а на другой стороне текст заканчивался, завершая главу. Сразу после текста, на свободном пространстве страницы, был изображен символ в виде игральной кости — разделитель глав. Нет, не разделитель."
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Бумага была белой; с одной стороны был напечатан текст на незнакомом языке, а на другой странице текст заканчивался, завершая главу. Сразу после текста, посреди страницы, был изображен символ в виде игральной кости — разделитель глав. Нет, не разделитель."
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Бумага была белой; с одной стороны был напечатан текст на незнакомом языке, а на другой странице текст заканчивался, завершая главу. Сразу после текста, посреди страницы, был изображен символ в виде игральной кости. Разделитель глав?"
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Бумага была белой; с одной стороны был напечатан текст на незнакомом языке, а на другой странице текст заканчивался, завершая главу. Сразу после текста на свободном пространстве страницы"
			#s1 += " Это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; на одной из страниц текст завершался: должно быть, глава подходила к концу."
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину, а сразу после текста, посреди пустого пространства после него, следовал символ в виде игрального кубика. Должно быть, декоративный разделитель глав?"
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину. На пустом пространстве, следовавшем после текста, черными чернилами был нанесен символ в виде игрального кубика."
			##s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину. На пустом пространстве страницы, следовавшем после текста, я увидел символ в виде игрального кубика."
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Бумага была белая; с одной стороны ее покрывал печатный текст на не знакомом мне языке, на другой стороне текст заканчивался"
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. Но одной стороне белого листа был напечатан текст на незнакомом языке"
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину, а сразу после текста, на оставшемся пустом пространстве"
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину — на этом месте глава книги подходила к концу."
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину — должно быть, на этом месте глава книги заканчивалась."
			#s1 += " Похоже, это была страница из какой-то книги, аккуратно вырезанная ножницами или ножом. На обеих сторонах белого листа был напечатан текст на незнакомом языке; вторая страница была заполнена текстом лишь наполовину. Сразу после оканчивавшегося текста"
			#s1 += " Похоже, это была страница, вырванная из какой-то книги. На обеих сторонах листа был напечатан текст на незнакомом языке."
		
		S01_ItemType.STONE_BOX.value:
			s1 += ""
		
		S01_ItemType.HOUSE_KEY.value:
			# Если герой знает про завещание, то он знает и про то, что это ключ от дома пропавшего. Если же он не знает, что это ключ от дома пропавшего, то он должен вспомнить, что у того в доме как раз такой замок.
			var x_to_hero_phrase: T00_SimplePhrase = get_x_to_hero_relation_phrase ()
			if _hero_knows_about_testament:
				# TODO.
				if _introducer_have_seen_flashback:
					#s1 += " — Нет, нет, всё в порядке, — торопливо взглянув на полицейского, ответила я, и снова посмотрела на пакет с вещами."
					#s1 += " — Нет, нет, всё в порядке, — торопливо ответила я и, бегло посмотрев на полицейского, вернулась к коробке с вещами."
					#s1 += " — Нет, нет, всё в порядке, — торопливо ответила я и, бросив беглый взгляд на полицейского, вернулась к коробке с вещами. Ключ от дома брата был... (длинный, тяжелый)"
					s1 += " — Нет, нет, всё в порядке, — торопливо ответила я и, бросив беглый взгляд на полицейского, вернулась к коробке с вещами. Вот ключ от дома брата:... (длинный, тяжелый)"
					pass
				else:
					s1 += "Я "
					s1 += "посмотрел" if hero_is_male else "посмотрела"
					s1 += " на ключ от дома "
					# Брата.
					s1 += x_to_hero_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
					s1 += ": длинный, тяжелый, полностью из металла "
					# Темно-серого.
					s1 += S01_Color.get_phrase_for_color (item.get_color ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
					s1 += " цвета. Да, это он и есть — и даже бородки такой же формы. Помнится, когда я "
					s1 += "приезжал к " if hero_is_male else "приезжала к "
					# Брату.
					s1 += x_to_hero_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.DATIVE, T00_WordNumber.SINGLE))
					s1 += " в гости, "
					s1 += "тот оставлял" if x_is_male else "та оставляла"
					s1 += " мне свой ключ, и поначалу мне никак не удавалось запомнить, какой стороной его вставлять. А потом я просто "
					s1 += "запомнил" if hero_is_male else "запомнила"
					s1 += " рисунок бородок."
				
				#s1 += "Я посмотрел на ключ от дома брата: длинный, тяжелый, полностью из металла темно-серого цвета. Да, это он и есть — и даже бородки такой же формы. Помнится, когда я приезжал к брату в гости, тот оставлял мне свой ключ, и поначалу мне никак не удавалось запомнить, какой стороной его вставлять. А потом я просто запомнил рисунок."
				#s1 += "Я посмотрел на ключ от дома брата: длинный, тяжелый, полностью из металла темно-серого цвета. Да, это он и есть — и даже бородки такой же формы. Помнится, когда я гостил у брата, тот оставлял мне свой ключ, и поначалу мне никак не удавалось запомнить, какой стороной его надо вставлять. Позже я во всем разобрался, запомнив рисунок на конце ключа."
				#s1 += "Я посмотрел на ключ от дома брата: длинный, тяжелый, полностью из металла темно-серого цвета. Да, это он и есть. И даже бородки на конце той же самой формы. Помнится, когда я гостил у брата, тот оставлял мне свой ключ, а мне поначалу никак не удавалось запомнить, какой стороной он вставляется; позже я запомнил рисунок."
				#s1 += "Я посмотрел на ключ от дома брата: длинный, тяжелый, полностью из металла темно-серого цвета. Да, это он и есть. И даже бородки на конце ключа той же самой формы. Помнится, я поначалу никак не мог запомнить, какой стороной его вставлять, а потом научился распознавать рисунок."
				#s1 += "Я посмотрел на ключ от дома брата. Он был длинный, тяжелый, полностью сделан из металла белого цвета, и даже бородки той же формы. Да, это он и есть."
				#s1 += "Я взял ключ от дома брата в руки: большой и длинный, из белого металла, а судя по форме, он от сувальдного замка. Да, это он и есть. В доме брата стоял как раз такой замок."
				pass
			else:
				# TODO.
				if _introducer_have_seen_flashback:
					s1 += " — Нет, нет, всё в порядке, — торопливо ответила я. Бросив беглый взгляд на полицейского, я вернулась к коробке с вещами и осмотрела ключ:... (большой и длинный)"
				else:
					s1 += "Я "
					s1 += "повертел" if hero_is_male else "повертела"
					s1 += " ключ в руках: большой и длинный, сделан из металла "
					# Белого.
					s1 += S01_Color.get_phrase_for_color (item.get_color ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
					s1 += " цвета, и, судя по форме, он от сувальдного замка. Похож на тот, что "
					# Брат.
					s1 += x_to_hero_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
					s1 += " "
					s1 += "оставлял" if x_is_male else "оставляла"
					s1 += " мне, уезжая с утра на работу, когда я "
					s1 += "гостил" if hero_is_male else "гостила"
					s1 += " у него." if x_is_male else " у нее."
					
					#s1 += "Я повертел ключ в руках: большой и длинный, сделан из металла белого цвета, как будто бы от сувальдного замка. Похож на тот, что брат оставлял мне, уезжая с утра на работу, когда я гостил у него."
					#s1 += "Я повертел ключ в руках: большой и длинный, сделан из металла белого цвета, как будто бы от сувальдного замка. В доме брата был как раз такой."
					#s1 += "Я повертел ключ в руках: большой и длинный, как от сувальдного замка, выполнен из белого металла."
					pass
	
	# Если предмет - зацепка, то добавляем пару предложений про флешбэк и реакцию полицейского.
	if item._is_clue:
		var s2: String = ""
		if item.get_item_type ().equals (S01_ItemType.SHEET_OF_PAPER):
			s2 += "\"Нет, не разделитель...\"\n\n"
		
		s2 += "Внезапно промелькнувшая мысль унесла меня далеко в детство, и перед моим внутренним взором предстало лицо "
		# Брата.
		s2 += get_x_to_hero_relation_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
		s2 += ". Меня осенило."
		
		var s3: String = ""
		s3 += " — "
		s3 += story._hero._first_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE)
		s3 += ", что-то не так? — Вопрос офицера вернул меня к реальности."
		
		_last_object_mentioned = MENTION_CLUE_INSPECTED
		_introducer_have_seen_flashback = true
		
		# Назначаем предмету новое название на панели действий: теперь герой знает, что это за предмет. (Но для ключа не назначаем. Это нелогично, просто костыль.)
		item.set_action_panel_name (item.create_action_panel_name_inspected ())
		_flow_sentences = [s1, s2, s3]
	
	# Если предмет не является зацепкой, то останавливаемся на единственном абзаце.
	else:
		# Ключу название не назначаем. По-хорошему, надо бы назначать, но у меня уже неразбериха в ситуациях.
		# Менять название будем тогда, когда герой узнает про завещание и про то, что это ключ от дома Икса.
		#item.set_action_panel_name (item.create_action_panel_name_inspected ())
		
		_last_object_mentioned = MENTION_HOUSE_KEY_INSPECTED
		_flow_sentences = [s1]
	
	item.remove_action (T00_Action.INSPECT)
	if item._is_clue:
		_hero_inspected_clue = true
	
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_asking_about_container ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	var hero_is_male: bool = get_hero_is_male ()
	var introducer_is_male: bool = get_introducer_is_male ()
	var hero_word_gender: int = T00_WordGender.MASCULINE if hero_is_male else T00_WordGender.FEMININE
	var introducer_word_gender: int = T00_WordGender.MASCULINE if introducer_is_male else T00_WordGender.FEMININE
	var x_is_male: bool = get_x_is_male ()
	
	var s1: String = ""
	s1 += " — Что это? — Я вопросительно "
	s1 += w.posmotret.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, hero_word_gender, T00_WordNumber.SINGLE)
	s1 += " на офицера.\n — Ваше наследство. "
	if story._clue_container.get_items ().size () == 1:
		s1 += "Единственная вещь, указанная в завещании "
		s1 += "вашего " if x_is_male else "вашей "
		s1 += get_x_to_hero_relation_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
		s1 += "."
	else:
		s1 += "Вещи, указанные в завещании "
		s1 += "вашего " if x_is_male else "вашей "
		s1 += get_x_to_hero_relation_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
		s1 += ", включая ключ от "
		s1 += "его " if x_is_male else "ее "
		s1 += "дома."
	
	s1 += "\n\nЛейтенант "
	s1 += "прервался " if introducer_is_male else "прервалась "
	s1 += "на пару секунд и "
	s1 += "опустил " if introducer_is_male else "опустила "
	s1 += "взгляд к столу, словно о чем-то вспоминая, а затем "
	s1 += "продолжил:" if introducer_is_male else "продолжила:"
	
	var s2: String = ""
	s2 += "\n\n — "
	s2 += "Мистер " if x_is_male else "Миссис "
	s2 += story._x._last_name.get_form_for (T00_LastNameUsage.create_initial ())
	s2 += " пожелал" if x_is_male else " пожелала"
	s2 += ", чтобы именно "
	s2 += "его " if x_is_male else "ее "
	s2 += get_hero_to_x_relation_phrase ().get_form_for (T00_NounUsage.create_initial ()) + ", "
	s2 += story._hero._first_name.get_form_for (T00_NounUsage.create_initial ()) + " "
	s2 += story._hero._last_name.get_form_for (T00_LastNameUsage.create_initial ())
	s2 += ", кем вы и являетесь, "
	s2 += "стал " if hero_is_male else "стала "
	s2 += "его наследником." if x_is_male else "ее наследницей."
	s2 += "\n"
	
	s2 += " — У "
	s2 += get_x_to_hero_relation_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
	s2 += " было завещание? — "
	s2 += "удивился я.\n" if hero_is_male else "удивилась я.\n"
	s2 += " — Получается, что так, — "
	s2 += "развел" if introducer_is_male else "развела"
	s2 += " руками "
	s2 += story._introducer._first_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE)
	#s2 += story._introducer._last_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE, introducer_word_gender)
	s2 += ". — Мы и сами узнали об этом от нотариуса "
	s2 += "пропавшего" if x_is_male else "пропавшей"
	s2 += ". Он с вами не связывался?\n"
	s2 += " — Пока нет.\n"
	s2 += " — Значит, в скором времени должен."
	
	var s3: String = ""
	s3 += "Лейтенант "
	s3 += "почесал затылок, " if introducer_is_male else "поправила съехавшую на лоб прядь волос, "
	s3 += "достал " if introducer_is_male else "достала "
	s3 += "откуда-то листок бумаги и "
	s3 += "передал " if introducer_is_male else "передала "
	s3 += "мне.\n\n"
	s3 += " — Подпишитесь о получении "
	s3 += "предмета" if story._clue_container.get_items ().size () == 1 else "предметов"
	s3 += ". Вот здесь."
	
	# Меняем название ключа на панели действий, если ключ существует.
	var key: S01_ClueContainerItem = get_house_key_if_possible ()
	if key:
		key.set_action_panel_name (key.create_action_panel_name_inspected ())
	
	story._introducer.remove_action (T00_Action.ASK_ABOUT_CLUE_CONTAINER)
	
	# Добавляем документ в игру, добавляем к нему действия "изучить" и "подписать".
	var document: S01_Document = story.get_or_create_document ()
	document.create_and_add_action (T00_Action.INSPECT)
	document.create_and_add_action (T00_Action.SIGN)
	
	_hero_knows_about_testament = true
	_introducer_action = INTRODUCER_ACTION_WAITING_FOR_SIGNING
	_last_object_mentioned = MENTION_NONE
	
	_flow_sentences = [s1, s2, s3]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_inspecting_document ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	
	var s1: String = ""
	var clue_item: S01_ClueContainerItem = story._clue_container._clue_item
	var items: Array[S01_ClueContainerItem] = story._clue_container.get_items ()
	var num_items: int = items.size ()
	if num_items > 1:
		s1 += "Заголовок документа гласил, что это акт приема-передачи имущества. Ниже был приведен список предметов, которые мне следовало получить; в нем были перечислены ключ от дома "
		# Вероники / мамы.
		s1 += get_x_to_hero_relation_nick_or_name_phrase ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
		s1 += " и "
		# Плоский предмет.
		s1 += S01_ItemType.get_description_for_document (clue_item.get_item_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
		#s1 += "черного"
		var clue_item_color: S01_StringParamValue = clue_item.get_color ()
		if clue_item_color:
			s1 += " "
			s1 += S01_Color.get_phrase_for_color (clue_item_color).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
			s1 += " цвета"
		#s1 += " с символом "
		## Спирали.
		#s1 += S01_SecretSignType.get_description_short (clue_item.get_secret_sign_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
		s1 += "."
	else:
		s1 += "Заголовок документа гласил, что это акт приема-передачи имущества. Ниже был приведен список предметов, которые мне следовало получить; он состоял из единственного пункта — "
		s1 += "плоского черного предмета с символом спирали"
		s1 += "."
		#s1 += "Заголовок документа гласил, что это акт приема-передачи имущества. Ниже был приведен список предметов, которые мне следовало получить; он состоял из единственного пункта — плоского черного предмета с символом спирали."
	
	#s1 += "Заголовок документа гласил, что это акт приема-передачи имущества. Ниже был приведен список предметов, которые мне следовало получить; он состоял из двух пунктов: ключа от дома Вероники и плоского черного предмета с символом спирали."
	#s1 += "Заголовок документа гласил, что это акт приема-передачи имущества. В списке передаваемых предметов значился только один пункт — плоский предмет черного цвета"
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_signing_document ():
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	
	var s1: String = ""
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func get_introducer_first_description () -> String:
	
	var result: String = ""
	var is_male: bool = get_introducer_is_male ()
	var age: int = T00_A_Globals.story._introducer.get_age ().value
	if age < 25:
		result += "молодой рыжеволосый парень с большими очками в толстой оправе и с короткой стрижкой" if is_male else "молодая девушка с длинными темными волосами и ярким макияжем"
	elif age < 35:
		result += "молодой человек с размашистой татуировкой, проходящей от плеча до самого запястья" if is_male else "молодая женщина с короткой стрижкой и маленькой родинкой над правым уголком рта"
	else:
		result += "мужчина средних лет с усами и залысиной, проступающей на макушке" if is_male else "темноволосая женщина средних лет с нездоровым румянцем на лице"
	
	return result


func get_clue_familiarity_text (clue_phrase: T00_SimplePhrase, use_he_she_it: bool, hero_is_male: bool) -> String:
	
	var result: String = ""
	var w: T00_A_Words = T00_A_Globals.words
	var clue_phrase_subject: T00_Noun = clue_phrase.get_subject ()
	
	# Он / [Предмет-зацепка].
	if use_he_she_it:
		result += get_he_she_it_for_noun (clue_phrase_subject).capitalize ()
	else:
		result += clue_phrase.get_form_for (T00_NounUsage.create_initial ()).capitalize ()
	
	result += " то ли "
	# Показался.
	result += w.pokazatsya.get_form_for_noun (clue_phrase_subject, T00_WordTense.PAST, T00_WordNumber.SINGLE)
	result += " мне "
	result += w.znakomyi.get_form_for_noun (clue_phrase_subject, T00_WordNumber.SINGLE, T00_WordCase.INSTRUMENTAL)
	result += ", то ли "
	result += w.napomnit.get_form_for_noun (clue_phrase_subject, T00_WordTense.PAST, T00_WordNumber.SINGLE)
	result += " о чем-то — я так и не "
	# Мог.
	result += w.moch.get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, T00_WordGender.MASCULINE if hero_is_male else T00_WordGender.FEMININE, T00_WordNumber.SINGLE)
	result += " понять, о чем именно"
	
	return result


## Возвращает текст, перечисляющий предметы, лежащие в контейнере. Например: "большой ключ и маленький черный предмет". Предмет-зацепка указывается последней. Опционально добавляет в начало строки форму глагола, соответствующую существительному или существительным: "лежали большой ключ и маленький черный предмет". Опционально добавляет в конец строки слова про то, что предмет показался знакомым.
func get_clue_container_contents_text (verb: T00_Verb, word_case: int = T00_WordCase.NOMINATIVE, include_familiarity_text: bool = true) -> String:
	
	var result: String = ""
	
	var story: S01_Story = T00_A_Globals.story
	var w: T00_A_Words = T00_A_Globals.words
	var clue_container: S01_ClueContainer = story._clue_container
	
	var items: Array[S01_ClueContainerItem] = clue_container.get_items ()
	var num_items: int = items.size ()
	var clue_item: S01_ClueContainerItem = clue_container._clue_item
	var clue_item_phrase: T00_SimplePhrase = S01_ItemType.get_description_uninspected (clue_item.get_item_type ())
	if num_items == 1:
		if verb:
			result += verb.get_form_for_noun (clue_item_phrase.get_subject (), T00_WordTense.PAST, T00_WordNumber.SINGLE)
			result += " "
		result += clue_item_phrase.get_form_for (T00_NounUsage.new ().setup (word_case, T00_WordNumber.SINGLE))
		# Текст про знакомость предмета.
		if include_familiarity_text:
			result += ". "
			result += get_clue_familiarity_text (clue_item_phrase, true, get_hero_is_male ())
			#result += "."
	else:
		var second_item: S01_ClueContainerItem = items[0]
		if second_item._is_clue:
			second_item = items[1]
		if verb:
			result += verb.get_form (T00_WordTense.PAST, T00_WordPerson.THIRD, T00_WordGender.UNKNOWN, T00_WordNumber.PLURAL)
			result += " "
		result += S01_ItemType.get_description_uninspected (second_item.get_item_type ()).get_form_for (T00_NounUsage.new ().setup (word_case, T00_WordNumber.SINGLE))
		result += " и "
		result += clue_item_phrase.get_form_for (T00_NounUsage.new ().setup (word_case, T00_WordNumber.SINGLE))
		# Текст про знакомость предмета.
		if include_familiarity_text:
			result += ". "
			var clue_item_short_phrase: T00_SimplePhrase = S01_ItemType.get_description_uninspected_short (clue_item.get_item_type ())
			result += get_clue_familiarity_text (clue_item_short_phrase, false, get_hero_is_male ())
			#result += "."
	
	return result


# ==================================================
# ====================== UTILS =====================
# ==================================================

func get_he_she_it_for_noun (noun: T00_Noun) -> String:
	
	match noun._gender:
		T00_WordGender.MASCULINE: return "он"
		T00_WordGender.FEMININE: return "она"
		T00_WordGender.NEUTER: return "оно"
	
	printerr ("Unknown gender type.")
	return ""


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_introducer_is_male () -> bool:
	
	var introducer_gender: S01_ParamValue = T00_A_Globals.story._introducer.get_gender ()
	var is_male: bool = S01_Gender.MALE.equals (introducer_gender)
	if !is_male && !S01_Gender.FEMALE.equals (introducer_gender):
		printerr ("Unknown introducer gender.")
	return is_male


func get_hero_is_male () -> bool:
	
	var hero_gender: S01_ParamValue = T00_A_Globals.story._hero.get_gender ()
	var is_male: bool = S01_Gender.MALE.equals (hero_gender)
	if !is_male && !S01_Gender.FEMALE.equals (hero_gender):
		printerr ("Unknown hero gender.")
	return is_male


func get_x_is_male () -> bool:
	
	var x_gender: S01_ParamValue = T00_A_Globals.story._x.get_gender ()
	var is_male: bool = S01_Gender.MALE.equals (x_gender)
	if !is_male && !S01_Gender.FEMALE.equals (x_gender):
		printerr ("Unknown X gender.")
	return is_male


func get_x_to_hero_relation_phrase () -> T00_SimplePhrase:
	
	var relation: S01_StringParamValue = T00_A_Globals.story.get_x_to_hero_relation ()
	if relation.param_class == S01_ParamClass.FAMILY_RELATION:
		return S01_FamilyRelation.get_phrase_official (relation)
	elif relation.param_class == S01_ParamClass.FRIENDSHIP_RELATION:
		return S01_FriendshipRelation.get_phrase (relation, T00_A_Globals.story._x.get_gender ())
	
	printerr ("Unknown X to hero relation.")
	return null


## Называет мать матерью, отца папой, деда дедушкой, а брата, сестру, друга или подругу по имени.
func get_x_to_hero_relation_nick_or_name_phrase () -> T00_SimplePhrase:
	
	var relation: S01_StringParamValue = T00_A_Globals.story.get_x_to_hero_relation ()
	if relation.param_class == S01_ParamClass.FAMILY_RELATION:
		if S01_FamilyRelation.get_name_availability_for_appeal (relation):
			return T00_NounPhrase.new ().setup (T00_A_Globals.story._x._first_name)
		else:
			return S01_FamilyRelation.get_phrase_nick (relation)
	elif relation.param_class == S01_ParamClass.FRIENDSHIP_RELATION:
		return T00_NounPhrase.new ().setup (T00_A_Globals.story._x._first_name)
	
	printerr ("Unknown X to hero relation.")
	return null


func get_hero_to_x_relation_phrase () -> T00_SimplePhrase:
	
	var relation: S01_StringParamValue = T00_A_Globals.story.get_hero_to_x_relation ()
	if relation.param_class == S01_ParamClass.FAMILY_RELATION:
		return S01_FamilyRelation.get_phrase_official (relation)
	elif relation.param_class == S01_ParamClass.FRIENDSHIP_RELATION:
		return S01_FriendshipRelation.get_phrase (relation, T00_A_Globals.story._hero.get_gender ())
	
	printerr ("Unknown hero to X relation.")
	return null


## Ищет ключ от дома Икса внутри контейнера и возвращает его. Если ключ не найден, возвращает null.
func get_house_key_if_possible () -> S01_ClueContainerItem:
	
	var items: Array[S01_ClueContainerItem] = T00_A_Globals.story._clue_container.get_items ()
	if items.size () < 2:
		return null
	
	var key_item: S01_ClueContainerItem = items[0]
	if key_item._is_clue:
		key_item = items[1]
	return key_item

