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
	var x_is_male: bool = get_x_is_male ()
	var hero_is_male: bool = get_hero_is_male ()
	
	var x_nickname_phrase: T00_SimplePhrase = get_x_to_hero_relation_nick_or_name_phrase ()
	var x_nickname_nomimative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
	var x_nickname_genitive: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
	var x_nickname_dative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.DATIVE, T00_WordNumber.SINGLE))
	var x_nickname_accusative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	var x_nickname_instrumental: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE))
	var x_nickname_prepositional: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.PREPOSITIONAL, T00_WordNumber.SINGLE))
	
	var s_hill: String = ""
	s_hill += "Вооруженные свежесрезанными ветками-арбалетами, мы с "
	# Девидом.
	s_hill += x_nickname_instrumental
	s_hill += " бежали вверх по зеленому склону, освещенному послеполуденным солнцем. Впереди, на вершине холма, виднелись два больших камня, стоявших бок о бок: один темный, другой светлый."
	s_hill += "\n\n — Мы уже почти на месте, — тяжело дыша, "
	s_hill += "сказал " if x_is_male else "сказала "
	# Девид.
	s_hill += x_nickname_nomimative
	s_hill += ". — Надеюсь, мы не опоздали."
	s_hill += "\n — Я тоже надеюсь, — "
	s_hill += "ответил" if hero_is_male else "ответила"
	s_hill += " я, поднимая ветку-арбалет и заряжая ее воображаемой стрелой. — Какой он, этот твой Призрак?"
	
	var s_stones_1: String = ""
	# Девид.
	s_stones_1 += x_nickname_nomimative.capitalize ()
	s_stones_1 += " задумался" if x_is_male else " задумалась"
	s_stones_1 += " на мгновение."
	s_stones_1 += "\n\n — Незаметный. Бесшумный. Скоро вы с ним познакомитесь. — "
	s_stones_1 += "Он вытянул" if x_is_male else "Она вытянула"
	s_stones_1 += " руку вперед и "
	s_stones_1 += "показал" if x_is_male else "показала"
	s_stones_1 += " на вершину холма. — Видишь камни? Это не просто камни, а божества: Минотавр и Леди Ночь. Минотавр — тот, что справа, широкий и светлый. Повелитель воинов. А слева Леди Ночь, верховный маг."
	
	var s_stones_2: String = ""
	s_stones_2 += "Я "
	s_stones_2 += "осмотрел" if hero_is_male else "осмотрела"
	s_stones_2 += " природные статуи божеств. Верхняя часть Минотавра была шире, чем основание, и оттого камень напоминал мужской торс. Леди Ночь, стоявшая слева от него, была выше и уже; ее камень был окрашен в темно-серый цвет и смотрелся как что-то нездешнее, инородное."
	
	var s_top_1: String = ""
	s_top_1 += "Забравшись на вершину и поравнявшись с камнями, мы посмотрели по сторонам."
	s_top_1 += "\n\n — Странно, здесь его нет, — "
	s_top_1 += "проговорил " if x_is_male else "проговорила "
	# Девид.
	s_top_1 += x_nickname_nomimative
	s_top_1 += ". — Значит, он должен быть в Логове."
	s_top_1 += "\n — Что еще за Логово? — "
	s_top_1 += "спросил" if hero_is_male else "спросила"
	s_top_1 += " я с замиранием сердца."
	s_top_1 += "\n — Логово, где Призрак живет и скрывается, — "
	s_top_1 += "подмигнул" if x_is_male else "подмигнула"
	s_top_1 += " мне "
	s_top_1 += x_nickname_nomimative
	s_top_1 += ". — Вот его тропа. Она ведет прямиком в лес: сначала вдоль ручья, вниз по склону, а потом в ущелье. Там Призрак построил свой шалаш."
	
	var s_lady_danger_1: String = ""
	s_lady_danger_1 += "Камни-великаны возвышались над нами, разделяя ясное синее небо на три части. Солнце по-прежнему палило, и я "
	s_lady_danger_1 += "укрылся" if hero_is_male else "укрылась"
	s_lady_danger_1 += " от него в тени Леди Ночи. У ее подножия грудой были сложены более мелкие камни, такие же темные."
	s_lady_danger_1 += "\n\n — Осторожно, — почти шепотом "
	s_lady_danger_1 += "предупредил " if x_is_male else "предупредила "
	# Девид.
	s_lady_danger_1 += x_nickname_nomimative
	s_lady_danger_1 += ", — она опасна. К ней могут приближаться лишь посвященные маги. И еще те, кто собирается принести ей жертву."
	
	var s_lady_danger_2: String = ""
	s_lady_danger_2 += "Я медленно и с опаской "
	s_lady_danger_2 += "выбрался" if hero_is_male else "выбралась"
	s_lady_danger_2 += " из тени темного истукана."
	s_lady_danger_2 += "\n\n — А зачем надо приносить ей жертву?"
	s_lady_danger_2 += "\n — Разные причины бывают, — тихо "
	s_lady_danger_2 += "произнес " if x_is_male else "произнесла "
	# Девид.
	s_lady_danger_2 += x_nickname_nomimative
	s_lady_danger_2 += ", оглядываясь на тропу, ведущую в лес. — Пойдем, нам нужно отыскать Призрака."
	
	var s_trail_1: String = ""
	s_trail_1 += "Мы двинули по тропе, вошли в лес и вскоре оказались на левом берегу узкого ручья. Впереди показалась переправа, сложенная из гладких камней и ведущая вправо, в сторону горы."
	s_trail_1 += "\n\n — Нам туда, — "
	s_trail_1 += "пояснил " if x_is_male else "пояснила "
	# Девид.
	s_trail_1 += x_nickname_nomimative
	s_trail_1 += " и шагнул" if x_is_male else " и шагнула"
	s_trail_1 += " на мокрые камни. — Осторожно, не замочи ноги. Ступай за мной след в след."
	
	var s_trail_2: String = ""
	s_trail_2 += "Перебравшись на другую сторону ручья, мы оказались у отвесного каменного склона. Дальше тропа вела вдоль горы, опускаясь вниз к подножью. Через пару минут мы подошли к расщелине, уходящей вправо."
	s_trail_2 += "\n\n — Это здесь, — "
	s_trail_2 += "сказал " if x_is_male else "сказала "
	# Девид.
	s_trail_2 += x_nickname_nomimative
	s_trail_2 += ". — Опусти арбалет: Призрак не любит, когда на него направляют оружие."
	
	var s_cleft_1: String = ""
	s_cleft_1 += "Я послушно "
	s_cleft_1 += "опустил" if hero_is_male else "опустила"
	s_cleft_1 += " ветку и "
	s_cleft_1 += "пошел" if hero_is_male else "пошла"
	s_cleft_1 += " вслед за "
	# Девидом.
	s_cleft_1 += x_nickname_instrumental
	s_cleft_1 += ". Проход между скал становился всё шире и шире; то слева, то справа от нас стали появляться сначала кусты, затем деревья, а под ногами зашелестела трава. Вскоре мы вышли на зеленую поляну, лежавшую посреди нагромождения высоких скал. Это был тупик: здесь горы обступали нас с двух сторон, смыкаясь впереди плотным кольцом."
	
	var s_cleft_2: String = ""
	# Девид.
	s_cleft_2 += x_nickname_nomimative.capitalize ()
	s_cleft_2 += " подошел" if x_is_male else " подошла"
	s_cleft_2 += " к одному из кустов, "
	s_cleft_2 += "сел" if x_is_male else "села"
	s_cleft_2 += " на корточки и "
	s_cleft_2 += "посмотрел" if x_is_male else "посмотрела"
	s_cleft_2 += " на меня:"
	s_cleft_2 += "\n\n — Пригнись и следуй за мной. Сейчас мы полезем через кусты. Этот путь замаскирован."
	
	var s_missing_1: String = ""
	s_missing_1 += "Мы двинулись вперед, продираясь сквозь цепкую зелень. Оказалось, что в каменном кольце была незаметная брешь — узкий и низкий проход, скрытый от посторонних глаз живой изгородью кустарника. На другой стороне нас встретили еще более плотные заросли; "
	# Дэвид.
	s_missing_1 += x_nickname_nomimative
	s_missing_1 += " полз" if x_is_male else " ползла"
	s_missing_1 += " впереди, указывая мне путь. Выбравшись из очередного куста, "
	s_missing_1 += "он выпрямился, а потом встал как вкопанный." if x_is_male else "она выпрямилась, а потом встала как вкопанная."
	s_missing_1 += "\n\n — О, нет! — "
	s_missing_1 += "воскликнул он." if x_is_male else "воскликнула она."
	
	var s_missing_2: String = ""
	s_missing_2 += "Посреди лужайки лежала куча еловых веток — по всей видимости, всё, что осталось от шалаша Призрака. "
	# Девид.
	s_missing_2 += x_nickname_nomimative.capitalize ()
	s_missing_2 += " подбежал" if x_is_male else " подбежала"
	s_missing_2 += " к останкам жилища и "
	s_missing_2 += "стал" if x_is_male else "стала"
	s_missing_2 += " копаться в ветках."
	
	var s_missing_3: String = ""
	s_missing_3 += " — Она забрала его! — "
	s_missing_3 += "Он достал" if x_is_male else "Она достала"
	s_missing_3 += " что-то из-под веток и "
	s_missing_3 += "положил" if x_is_male else "положила"
	s_missing_3 += " к себе в карман, а потом "
	s_missing_3 += "посмотрел" if x_is_male else "посмотрела"
	s_missing_3 += " на меня. — Леди Ночь забрала Призрака и держит его в плену!"
	
	var s_missing_4: String = ""
	s_missing_4 += "Я ошалело "
	s_missing_4 += "уставился" if hero_is_male else "уставилась"
	s_missing_4 += " на него:" if x_is_male else " на нее:"
	s_missing_4 += "\n\n — Откуда ты узнал?" if x_is_male else " — Откуда ты узнала?"
	s_missing_4 += "\n — Призрак оставил мне знак. Секретный знак. На случай, если что-то пойдет не так. А теперь он в плену у Леди, в другом измерении."
	s_missing_4 += "\n — Что это за знак?"
	s_missing_4 += "\n — Я не могу тебе сказать, — "
	s_missing_4 += "замялся " if x_is_male else "замялась "
	# Девид.
	s_missing_4 += x_nickname_nomimative
	s_missing_4 += ". — На то он и секретный: его знаем только я и Призрак."
	
	_flow_sentences = [s_hill, s_stones_1, s_stones_2, s_top_1, s_lady_danger_1, s_lady_danger_2, s_trail_1, s_trail_2, s_cleft_1, s_cleft_2, s_missing_1, s_missing_2, s_missing_3, s_missing_4]
	_flow_action_tree = null
	#_flow_action_tree = story.create_action_tree ()


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



