class_name S01_PoliceTemplate extends S01_TextTemplate


static var STATE_EXPOSITION: int = 0
static var STATE_INTRODUCTION: int = 1

static var INTRODUCER_POSE_SITTING_STRAIGHT: int = 0
static var INTRODUCER_POSE_SITTING_BACK: int = 1

var _state: int = STATE_EXPOSITION

## Массив предложений, которые необходимо показывать непрерывно, не давая игроку действовать.
var _flow_sentences: Array[String] = []
## Дерево действий, которое будет предложено игроку, когда последнее предложение из потока будет показано на экране.
var _flow_action_tree: T00_ActionNode
## Если меньше нуля, то при завершении потока _state не будет переключаться. Если больше или равно нулю, то при завершении потока _state переключится в это значение.
var _flow_next_state: int = -1

var _door_is_closed: bool = false
var _hero_is_near_introducer: bool = false
var _introducer_pose: int = INTRODUCER_POSE_SITTING_STRAIGHT


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var story: S01_Story = T00_A_Globals.story
	
	var beat: T00_Beat = T00_Beat.new ()
	
	if !_flow_sentences.size ():
		match _state:
			STATE_EXPOSITION:
				generate_flow_for_exposition ()
			STATE_INTRODUCTION:
				if action:
					# Если поздоровались с Интродьюсером.
					if action._type == T00_Action.GREET && action.get_target () == story._introducer:
						generate_flow_for_greeting_introducer ()
					elif action._type == T00_Action.INSPECT && action.get_target () == story._introducer:
						generate_flow_for_introducer_look ()
					elif action._type == T00_Action.INSPECT && action.get_target () == story._introducer:
						pass
				
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
	s2 += " - "
	s2 += get_introducer_first_description ()
	s2 += "."
	
	# Сделаем кого-нибудь интерактивным.
	story._introducer.create_and_add_action (T00_Action.GREET)
	story._introducer.create_and_add_action (T00_Action.INSPECT)
	story._introducer.create_and_add_action (T00_Action.COME_UP)
	
	_flow_sentences = [s1, s2]
	_flow_action_tree = story.create_action_tree ()
	_flow_next_state = STATE_INTRODUCTION


func generate_flow_for_introducer_look ():
	
	var story: S01_Story = T00_A_Globals.story
	
	var s1: String
	if get_introducer_is_male ():
		s1 = "Низкий и плотный, сейчас он казался еще меньше, чем обычно."
		if _introducer_pose == INTRODUCER_POSE_SITTING_STRAIGHT:
			s1 += " Приветливо улыбаясь, он показывал рукой на стол."
		elif _introducer_pose == INTRODUCER_POSE_SITTING_BACK:
			s1 += " Довольно вжавшись в кресло, он всё ожидал, что я займу место напротив."
	else:
		s1 = "Низкая и плотная, сейчас она казалась еще меньше, чем обычно."
		if _introducer_pose == INTRODUCER_POSE_SITTING_STRAIGHT:
			s1 += " Приветливо улыбаясь, она показывала рукой на стол."
		elif _introducer_pose == INTRODUCER_POSE_SITTING_BACK:
			s1 += " Довольно вжавшись в кресло, она всё ожидала, что я займу место напротив."
	
	story._introducer.remove_action (T00_Action.INSPECT)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


func generate_flow_for_greeting_introducer ():
	
	var story: S01_Story = T00_A_Globals.story
	var introducer: S01_Introducer = story._introducer
	var introducer_is_male: bool = get_introducer_is_male ()
	var hero_is_male: bool = get_hero_is_male ()
	
	var s1: String = " - Здравствуйте, "
	s1 += "мистер " if introducer_is_male else "миссис "
	s1 += story._introducer._last_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (introducer.get_gender ()))
	s1 += "! - Я "
	s1 += "шагнул " if hero_is_male else "шагнула "
	s1 += "вглубь кабинета и "
	s1 += "прикрыл " if hero_is_male else "прикрыла "
	s1 += "за собой дверь.\n\nОфицер "
	s1 += "сделал " if introducer_is_male else "сделала "
	s1 += "приветственный жест и "
	s1 += "откинулся " if introducer_is_male else "откинулась "
	s1 += "на спинку кресла."
	
	_door_is_closed = true
	_introducer_pose = INTRODUCER_POSE_SITTING_BACK
	introducer.remove_action (T00_Action.GREET)
	
	_flow_sentences = [s1]
	_flow_action_tree = story.create_action_tree ()


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


func get_introducer_first_description () -> String:
	
	var result: String = ""
	var is_male: bool = get_introducer_is_male ()
	var age: int = T00_A_Globals.story._introducer.get_age ().value
	if age < 25:
		result += "молодой рыжеволосый парень с большими очками в толстой оправе и короткой стрижкой" if is_male else "молодая девушка с длинными темными волосами и ярким макияжем"
	elif age < 35:
		result += "молодой человек с размашистой татуировкой, проходящей от плеча до самого запястья" if is_male else "молодая женщина с короткой стрижкой и маленькой родинкой над правым уголком рта"
	else:
		result += "мужчина средних лет с усами и залысиной, проступающей на макушке" if is_male else "темноволосая женщина средних лет с нездоровым румянцем на лице"
	
	return result
