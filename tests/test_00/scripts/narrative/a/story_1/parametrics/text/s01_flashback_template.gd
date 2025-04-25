class_name S01_FlashbackTemplate extends S01_TextTemplate


static var STATE_EXPOSITION: int = 0
static var STATE_EXIT: int = 1


var _main_menu_scene: PackedScene = preload ("res://tests/test_00/scenes/t00_main_menu.tscn")

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
			_flow_next_state = -1
		
		return beat
	
	#printerr ("Bad state.")
	beat._story_text = "Ошибка в генерации текста."
	beat._action_tree = null
	var error: int = T00_Globals.game.get_tree ().change_scene_to_packed (_main_menu_scene)
	if error != OK:
		print ("ERROR: ", error)
	return beat


func is_over () -> bool:
	
	return _is_over


func get_next_template () -> S01_TextTemplate:
	
	return _next_template


func generate_flow_for_exposition ():
	
	var story: S01_Story = T00_A_Globals.story
	var x_is_male: bool = get_x_is_male ()
	var hero_is_male: bool = get_hero_is_male ()
	var introducer_is_male: bool = get_introducer_is_male ()
	
	var x_nickname_phrase: T00_SimplePhrase = get_x_to_hero_relation_nick_or_name_phrase ()
	var x_nickname_nomimative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
	var x_nickname_genitive: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
	var x_nickname_dative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.DATIVE, T00_WordNumber.SINGLE))
	var x_nickname_accusative: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	var x_nickname_instrumental: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE))
	var x_nickname_prepositional: String = x_nickname_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.PREPOSITIONAL, T00_WordNumber.SINGLE))
	
	var x_relation_phrase: T00_SimplePhrase = get_x_to_hero_relation_phrase ()
	var x_relation_nomimative: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE))
	var x_relation_genitive: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE))
	var x_relation_dative: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.DATIVE, T00_WordNumber.SINGLE))
	var x_relation_accusative: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	var x_relation_instrumental: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE))
	var x_relation_prepositional: String = x_relation_phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.PREPOSITIONAL, T00_WordNumber.SINGLE))
	
	var hero_name_nominative: String = story._hero._first_name.get_form (T00_WordCase.NOMINATIVE, T00_WordNumber.SINGLE)
	
	var s_hill: String = ""
	s_hill += "Вооруженные свежесрезанными ветками-арбалетами, мы с "
	# Девидом.
	s_hill += x_nickname_instrumental
	s_hill += " бежали вверх по зеленому склону, освещенному послеполуденным солнцем. Впереди, на вершине холма, виднелись два больших камня, стоявших бок о бок: один темный, другой светлый."
	s_hill += "\n\n — Мы уже почти на месте, — тяжело дыша, "
	s_hill += "сказал " if x_is_male else "сказала "
	# Девид.
	s_hill += x_relation_nomimative
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
	s_missing_4 += "\n\n — Откуда ты узнал?" if x_is_male else "\n\n — Откуда ты узнала?"
	s_missing_4 += "\n — Призрак оставил мне знак. Секретный знак. На случай, если что-то пойдет не так. А теперь он в плену у Леди, в другом измерении."
	s_missing_4 += "\n — Что это за знак?"
	s_missing_4 += "\n — Я не могу тебе сказать, — "
	s_missing_4 += "замялся " if x_is_male else "замялась "
	# Девид.
	s_missing_4 += x_nickname_nomimative
	s_missing_4 += ". — На то он и секретный: его знаем только я и Призрак."
	
	var s_sacrifice_1: String = ""
	s_sacrifice_1 += "Я растерянно "
	s_sacrifice_1 += "смотрел" if hero_is_male else "смотрела"
	s_sacrifice_1 += " на остатки шалаша."
	s_sacrifice_1 += "\n\n — Что же нам теперь делать? Мы можем его спасти? — "
	s_sacrifice_1 += "спросил я." if hero_is_male else "спросила я."
	s_sacrifice_1 += "\n\n"
	s_sacrifice_1 += x_nickname_nomimative.capitalize ()
	#s_sacrifice_1 += "Девид"
	s_sacrifice_1 += " встал" if x_is_male else " встала"
	s_sacrifice_1 += ", помолчал немного и тихо ответил:" if x_is_male else ", помолчала немного и тихо ответила:"
	s_sacrifice_1 += "\n\n — Мы принесем жертву Леди Ночи, чтобы задобрить ее, и тогда она отпустит Призрака."
	
	var s_sacrifice_2: String = ""
	s_sacrifice_2 += "На освещенной солнцем лужайке стало совсем тихо; даже ветер перестал шуметь в листьях деревьев."
	s_sacrifice_2 += "\n\n — Какую жертву? — "
	s_sacrifice_2 += "спросил" if hero_is_male else "спросила"
	s_sacrifice_2 += " я. Иногда "
	# Друг.
	s_sacrifice_2 += x_relation_nomimative
	s_sacrifice_2 += " пугал" if x_is_male else " пугала"
	s_sacrifice_2 += " меня, заходя со своими фантазиями слишком далеко."
	
	var s_sacrifice_3: String = ""
	s_sacrifice_3 += "Глаза "
	# Девида.
	s_sacrifice_3 += x_nickname_genitive
	s_sacrifice_3 += " опустились к земле: казалось, "
	s_sacrifice_3 += "он что-то искал" if x_is_male else "она что-то искала"
	s_sacrifice_3 += ". Отойдя от шалаша шагов на десять, "
	s_sacrifice_3 += "он нагнулся, поднял что-то с земли и подошел" if x_is_male else "она нагнулась, подняла что-то с земли и подошла"
	s_sacrifice_3 += " ко мне, держа в руках маленькую еловую ветку."
	s_sacrifice_3 += "\n\n — Сейчас мы пойдем в лес и наберем веточек точно такого же размера. Не больше и не меньше. Потом вернемся обратно на холм и отдадим ей всё, что нашли. Леди любит еловые ветки."
	
	var s_sacrifice_4: String = ""
	s_sacrifice_4 += "Полчаса спустя мы с "
	# Девидом.
	s_sacrifice_4 += x_nickname_instrumental
	s_sacrifice_4 += " стояли на вершине холма, рядом с камнем Леди Ночи. В руках у нас было по охапке колючих веточек."
	s_sacrifice_4 += "\n\n — Ты когда-нибудь "
	s_sacrifice_4 += "делал" if hero_is_male else "делала"
	s_sacrifice_4 += " подношение богам? — "
	s_sacrifice_4 += "спросил" if x_is_male else "спросила"
	s_sacrifice_4 += " у меня "
	# Девид.
	s_sacrifice_4 += x_nickname_nomimative
	s_sacrifice_4 += "."
	s_sacrifice_4 += "\n — Нет."
	s_sacrifice_4 += "\n — Тогда смотри."
	
	var s_sacrifice_5: String = ""
	s_sacrifice_5 += "Он подошел к истукану, опустился" if x_is_male else "Она подошла к истукану, опустилась"
	s_sacrifice_5 += " на корточки рядом с грудой черных камней, лежавших у подножия Леди Ночи, и "
	s_sacrifice_5 += "стал" if x_is_male else "стала"
	s_sacrifice_5 += " один за другим перекладывать их в сторону."
	s_sacrifice_5 += "\n\n — Под камнями спрятан ее алтарь, — "
	s_sacrifice_5 += "пояснил он" if x_is_male else "пояснила она"
	s_sacrifice_5 += ". — Подойди, помоги мне до него добраться."
	s_sacrifice_5 += "\n — А мне разве можно? — боязливо "
	s_sacrifice_5 += "спросил я." if hero_is_male else "спросила я."
	s_sacrifice_5 += "\n — Ну конечно. Ты же собираешься принести ей жертву."
	
	var s_sacrifice_6: String = ""
	s_sacrifice_6 += "Я подошел к " if hero_is_male else "Я подошла к "
	# Девиду.
	s_sacrifice_6 += x_nickname_dative
	s_sacrifice_6 += ", и вместе мы стали разгребать груду. Камни были крупные и тяжелые, размером с три-четыре моих кулака. Вскоре я "
	s_sacrifice_6 += "увидел" if hero_is_male else "увидела"
	s_sacrifice_6 += " алтарь — полое пространство округлой формы в основании большого камня. Оно было похоже на тайник: полметра в ширину, полметра в глубину и сантиметров тридцать в высоту."
	
	var s_sacrifice_7: String = ""
	s_sacrifice_7 += " — Неси сюда ветки, — "
	s_sacrifice_7 += "сказал " if x_is_male else "сказала "
	# Девид.
	s_sacrifice_7 += x_nickname_nomimative
	s_sacrifice_7 += ".\n\n"
	s_sacrifice_7 += "Я принес" if hero_is_male else "Я принесла"
	s_sacrifice_7 += " подношение, и мы переложили его на алтарь богини. Дальше оставалось только завалить алтарь камнями, чтобы сохранить его в тайне. Когда дело было сделано, мы отошли подальше от статуи и уставились на нее."
	
	var s_waiting: String = ""
	s_waiting += " — Что дальше? — "
	s_waiting += "спросил я." if hero_is_male else "спросила я."
	s_waiting += "\n — Теперь остается только ждать ответа Леди Ночи, — "
	s_waiting += "сказал " if x_is_male else "сказала "
	# Девид.
	s_waiting += x_relation_nomimative
	s_waiting += ". — Скоро она примет решение: отпускать Призрака или не отпускать."
	s_waiting += "\n — А если она его не отпустит?"
	s_waiting += "\n — Тогда будем решать вопрос по-другому. Но ты лучше об этом пока не думай."
	
	var s_symbol_1: String = ""
	s_symbol_1 += "Я молча "
	s_symbol_1 += "смотрел" if hero_is_male else "смотрела"
	s_symbol_1 += " на мрачную Леди Ночь, теперь казавшуюся почти черной."
	s_symbol_1 += "\n\n — "
	# Девид.
	s_symbol_1 += x_nickname_nomimative.capitalize ()
	s_symbol_1 += ", почему у вас с Призраком есть тайный знак, а у меня нет?"
	s_symbol_1 += "\n\n"
	# Девид.
	s_symbol_1 += x_nickname_nomimative.capitalize ()
	s_symbol_1 += " задумался." if x_is_male else " задумалась."
	s_symbol_1 += "\n\n — Так получилось. Мы с Призраком часто занимаемся опасными делами. Поэтому и придумали тайный символ на всякий случай."
	s_symbol_1 += "\n — Я тоже хочу заниматься опасными делами!"
	
	var s_symbol_2: String = ""
	# Девид.
	s_symbol_2 += x_nickname_nomimative.capitalize ()
	s_symbol_2 += " взглянул" if x_is_male else " взглянула"
	s_symbol_2 += " на меня, а потом "
	s_symbol_2 += "предложил:" if x_is_male else "предложила:"
	s_symbol_2 += "\n\n — Хочешь, мы с тобой придумаем наш собственный секретный знак? Его будем знать только ты и я."
	s_symbol_2 += "\n — Конечно! — "
	s_symbol_2 += "обрадовался" if hero_is_male else "обрадовалась"
	s_symbol_2 += " я. — А какой это будет знак?"
	s_symbol_2 += "\n — Решай "
	s_symbol_2 += "сам, — " if hero_is_male else "сама, — "
	s_symbol_2 += "пожал" if x_is_male else "пожала"
	s_symbol_2 += " плечами "
	# Девид.
	s_symbol_2 += x_nickname_nomimative
	s_symbol_2 += ". — Любой символ, который тебе в голову придет. Просто нарисуй его мне, чтобы я "
	s_symbol_2 += "запомнил." if x_is_male else "запомнила."
	
	var s_symbol_3: String = ""
	s_symbol_3 += "Он отошел" if x_is_male else "Она отошла"
	s_symbol_3 += " куда-то в сторону Минотавра и "
	s_symbol_3 += "показал" if x_is_male else "показала"
	s_symbol_3 += " на землю под ногами:"
	s_symbol_3 += "\n\n — Вот, здесь трава почти не растет, почва должна быть рыхлой. Возьми палочку и рисуй."
	s_symbol_3 += "\n\n"
	s_symbol_3 += "Я побежал" if hero_is_male else "Я побежала"
	s_symbol_3 += " в сторону деревьев, "
	s_symbol_3 += "отыскал валявшуюся в хвое палочку и подошел к " if hero_is_male else "отыскала валявшуюся в хвое палочку и подошла к "
	# Девиду.
	s_symbol_3 += x_nickname_dative
	s_symbol_3 += ". Травы здесь действительно росло немного, но почва была скорее каменистой, чем рыхлой; и всё же на ней вполне можно было рисовать. Я "
	s_symbol_3 += "наклонился и стал чертить. А потом встал и посмотрел на " if hero_is_male else "наклонилась и стала чертить. А потом встала и посмотрела на "
	# Девида.
	s_symbol_3 += x_nickname_accusative
	s_symbol_3 += "."
	
	var s_symbol_4: String = ""
	
	var sign_type: S01_StringParamValue = story._clue_container._clue_item.get_secret_sign_type ()
	match sign_type.value:
		S01_SecretSignType.EYE.value:
			s_symbol_4 += " — Глаз, — проговорил он. — Открытый глаз." if x_is_male else " — Глаз, — проговорила она. — Открытый глаз."
			s_symbol_4 += "\n — Да, — подтвердил я." if hero_is_male else "\n — Да, — подтвердила я."
			s_symbol_4 += " — Четыре реснички сверху и три снизу. Так мы будем знать, что это именно тот знак, а не какой-то еще."
		
		S01_SecretSignType.DICE.value:
			s_symbol_4 += " — Кубик, — проговорил он. — Игральный кубик." if x_is_male else " — Кубик, — проговорила она. — Игральный кубик."
			s_symbol_4 += "\n — Да, — подтвердил я." if hero_is_male else "\n — Да, — подтвердила я."
			s_symbol_4 += " — С тремя гранями. На верхней грани двойка, на левой — тройка, а на правой — пятерка. Так мы будем знать, что это именно тот знак, а не какой-то еще."
		
		S01_SecretSignType.SPIRAL.value:
			s_symbol_4 += " — Спираль, — проговорил он. — Перечеркнутая спираль." if x_is_male else " — Спираль, — проговорила она. — Перечеркнутая спираль."
			s_symbol_4 += "\n — Да, — подтвердил я." if hero_is_male else "\n — Да, — подтвердила я."
			s_symbol_4 += " А прямая черта идет из ее центра до третьего витка, не дальше. Так мы будем знать, что это именно тот знак, а не какой-то еще."
	
	var s_symbol_5: String = ""
	s_symbol_5 += " — Хорошо. Очень хорошо."
	
	if sign_type.equals (S01_SecretSignType.DICE):
		s_symbol_5 += " И этот кубик — \"невозможный\". Видишь? Двойка стоит рядом с пятеркой. Такого в жизни не бывает."
	
	s_symbol_5 += " — "
	# Девид.
	s_symbol_5 += x_nickname_nomimative.capitalize ()
	s_symbol_5 += " улыбнулся" if x_is_male else " улыбнулась"
	s_symbol_5 += ". — Тогда теперь это будет наш с тобой секретный символ. Если я захочу тайно связаться с тобой, то пришлю его тебе в любом виде: нарисую на бумаге или на дереве, или нацарапаю на железе. Так, чтобы никто не догадался. Отправлю почтой или передам через другого человека. И ты делай так же, если захочешь связаться со мной."
	
	var s_symbol_6: String = ""
	s_symbol_6 += "Подумав, он добавил:" if x_is_male else "Подумав, она добавила:"
	s_symbol_6 += "\n\n— Но пользоваться символом можно только в случае крайней необходимости."
	
	var s_symbol_7: String = ""
	s_symbol_7 += "Я охотно кивнул." if hero_is_male else "Я охотно кивнула."
	s_symbol_7 += "\n\n — А что делать, когда я получу послание?"
	s_symbol_7 += "\n — Нам нужно тайное место, где мы могли бы встретиться. Такое, о котором никто не знает. — "
	s_symbol_7 += "Он повернулся" if x_is_male else "Она повернулась"
	s_symbol_7 += " в Минотавру, затем к Леди Ночи. — Кто-нибудь из твоих друзей слышал про эти камни?"
	s_symbol_7 += "\n — Нет."
	s_symbol_7 += "\n — Тогда наше место встречи будет прямо здесь, на этом холме. — "
	s_symbol_7 += "Он указал" if x_is_male else "Она указала"
	s_symbol_7 += " на тень, падавшую от высокого черного камня. — За камнем Леди Ночи."
	
	var s_ghost_1: String = ""
	s_ghost_1 += "Сделав шаг в сторону секретного символа, нарисованного на земле, "
	s_ghost_1 += "он затер" if x_is_male else "она затерла"
	s_ghost_1 += " его ногой. Но тут же "
	s_ghost_1 += "повернулся ко мне и спросил:" if x_is_male else "повернулась ко мне и спросила:"
	s_ghost_1 += "\n\n — Ты слышал?" if hero_is_male else "\n\n — Ты слышала?"
	s_ghost_1 += "\n\n Я отрицательно покачал головой и прислушался." if hero_is_male else "\n\n Я отрицательно покачала головой и прислушалась."
	s_ghost_1 += "\n\n — Леди Ночь! — "
	s_ghost_1 += "прошептал " if x_is_male else "прошептала "
	# Девид.
	s_ghost_1 += x_nickname_nomimative
	s_ghost_1 += ", присев на корточки и посмотрев на статую. — Она отпустила Призрака!"
	
	var s_ghost_2: String = ""
	s_ghost_2 += "Я присел" if hero_is_male else "Я присела"
	s_ghost_2 += " вместе с "
	s_ghost_2 += "ним" if x_is_male else "ней"
	s_ghost_2 += ", ничего не понимая, и "
	s_ghost_2 += "спросил:" if hero_is_male else "спросила:"
	s_ghost_2 += "\n\n — И теперь мы пойдем за ним? Где он?"
	s_ghost_2 += "\n — Леди оставила его где-то в лесу, совсем недалеко от нас. Он вот-вот должен появиться."
	
	var s_ghost_3: String = ""
	s_ghost_3 += "Поднявшийся ветер зашумел листвой и травой. Так и сидя на корточках, мы с "
	# Девидом.
	s_ghost_3 += x_nickname_instrumental
	s_ghost_3 += " в ожидании смотрели в сторону леса; но никто не появлялся. Внезапно "
	# Девид.
	s_ghost_3 += x_nickname_nomimative
	s_ghost_3 += " вскочил и бросился к деревьям." if x_is_male else " вскочила и бросилась к деревьям."
	s_ghost_3 += "\n\n — Призрак! — "
	s_ghost_3 += "выкрикрул он." if x_is_male else "выкрикрула она."
	s_ghost_3 += "\n\n"
	s_ghost_3 += "Я побежал" if hero_is_male else "Я побежала"
	s_ghost_3 += " вслед за "
	s_ghost_3 += "ним" if x_is_male else "ней"
	s_ghost_3 += ", на противоположную сторону лужайки."
	
	var s_ghost_4: String = ""
	# Девид.
	s_ghost_4 += x_nickname_nomimative.capitalize ()
	s_ghost_4 += " стоял" if x_is_male else " стояла"
	s_ghost_4 += " у кромки деревьев и, как мне показалось, "
	s_ghost_4 += "смотрел" if x_is_male else "смотрела"
	s_ghost_4 += " куда-то в глубину леса."
	s_ghost_4 += "\n\n — Призрак, ты вернулся! С тобой всё в порядке?"
	
	var s_ghost_5: String = ""
	s_ghost_5 += "Я вгляделся" if hero_is_male else "Я вгляделась"
	s_ghost_5 += " в лесную чащу, но ничего не "
	s_ghost_5 += "увидел." if hero_is_male else "увидела."
	s_ghost_5 += "\n\n — Где он? — "
	s_ghost_5 += "спросил я у " if hero_is_male else "спросила я у "
	# Девида.
	s_ghost_5 += x_nickname_genitive
	s_ghost_5 += "."
	s_ghost_5 += "\n\nТот обернулся и как-то странно посмотрел на меня." if x_is_male else "\n\nТа обернулась и как-то странно посмотрела на меня."
	s_ghost_5 += "\n\n — Вот, — ответил он" if x_is_male else "\n\n — Вот, — ответила она"
	s_ghost_5 += ", показывая себе за спину и снова поворачиваясь лицом к лесу. — Призрак, это "
	# Грегори.
	s_ghost_5 += hero_name_nominative
	s_ghost_5 += ". "
	s_ghost_5 += hero_name_nominative
	s_ghost_5 += ", знакомься: это Призрак."
	
	var s_ghost_6: String = ""
	s_ghost_6 += "Я забыл" if hero_is_male else "Я забыла"
	s_ghost_6 += " про нашу игру; в моих мыслях не было и намека на то, чтобы подыгрывать "
	# Девиду.
	s_ghost_6 += x_nickname_dative
	s_ghost_6 += "."
	s_ghost_6 += "\n\n — Он что, воображаемый? — "
	s_ghost_6 += "спросил я у " if hero_is_male else "спросила я у "
	s_ghost_6 += "него." if x_is_male else "нее."
	
	var s_ghost_7: String = ""
	# Девид.
	s_ghost_7 += x_nickname_nomimative.capitalize ()
	s_ghost_7 += " снова "
	s_ghost_7 += "обернулся" if x_is_male else "обернулась"
	s_ghost_7 += " ко мне. Выражение "
	s_ghost_7 += "его" if x_is_male else "ее"
	s_ghost_7 += " лица казалось растерянным. "
	s_ghost_7 += "Он посмотрел" if x_is_male else "Она посмотрела"
	s_ghost_7 += " сначала на меня, затем на Призрака и, осекшись, "
	s_ghost_7 += "рассмеялся:" if x_is_male else "рассмеялась:"
	s_ghost_7 += "\n\n — Воображаемый! Да, воображаемый, — повернув лицо в сторону леса, продолжая смеяться, "
	s_ghost_7 += "он как будто бы кивнул" if x_is_male else "она как будто бы кивнула"
	s_ghost_7 += " невидимому собеседнику."
	
	var s_street_1: String = ""
	s_street_1 += "Жирная капля только что начавшегося дождя стукнула меня прямо в макушку. Я так и "
	s_street_1 += "стоял" if hero_is_male else "стояла"
	s_street_1 += " у входа в полицейский участок "
	match story._clue_container.get_container_type ().value:
		S01_ClueContainerType.TRANSPARENT_BAG.value:
			s_street_1 += "с пакетом"
		S01_ClueContainerType.PAPER_BAG.value:
			s_street_1 += "с пакетом"
		S01_ClueContainerType.CYLINER_BUNDLE.value:
			s_street_1 += "со свертком"
		S01_ClueContainerType.BOX.value:
			s_street_1 += "с коробкой"
	
	s_street_1 += " в руках, разглядывая "
	
	match story._clue_container._clue_item.get_item_type ().value:
		S01_ItemType.TOKEN_MARK.value:
			s_street_1 += "жетон"
		S01_ItemType.SHAPED_STONE.value:
			s_street_1 += "фигурный камень"
		S01_ItemType.SHEET_OF_PAPER.value:
			s_street_1 += "страницу"
		S01_ItemType.STONE_BOX.value:
			s_street_1 += "шкатулку"
	
	s_street_1 += " с символом "
	
	match story._clue_container._clue_item.get_secret_sign_type ().value:
		S01_SecretSignType.EYE.value:
			s_street_1 += "глаза. Четыре ресницы сверху, три снизу."
		S01_SecretSignType.SPIRAL.value:
			s_street_1 += "спирали. Прямая черта от центра, проходящая ровно до третьего витка."
		S01_SecretSignType.DICE.value:
			s_street_1 += "кубика. Двойка сверху, тройка слева, пятерка справа."
	
	s_street_1 += " За всё это время мы с "
	# Девидом.
	s_street_1 += x_nickname_instrumental
	s_street_1 += " ни разу не пользовались секретным знаком; да и "
	s_street_1 += "мог" if hero_is_male else "могла"
	s_street_1 += " ли я подумать, что случай крайней необходимости может наступить?"
	
	var s_street_2: String = ""
	s_street_2 += "Я поднял" if hero_is_male else "Я подняла"
	s_street_2 += " взгляд к окну кабинета, из которого "
	s_street_2 += "вышел" if hero_is_male else "вышла"
	s_street_2 += " пару минут назад. Лейтенант "
	s_street_2 += "стоял" if introducer_is_male else "стояла"
	s_street_2 += " неподвижно, сложив руки за спиной, и "
	s_street_2 += "смотрел" if introducer_is_male else "смотрела"
	s_street_2 += " на меня. Заметив мой взгляд, "
	s_street_2 += "он подошел к окну и опустил жалюзи." if introducer_is_male else "она подошла к окну и опустила жалюзи."
	s_street_2 += "\n\nЯ "
	s_street_2 += story._clue_container.get_place_into_verb ().get_form (T00_WordTense.PAST, T00_WordPerson.FIRST, T00_WordGender.MASCULINE if hero_is_male else T00_WordGender.FEMININE, T00_WordNumber.SINGLE)
	s_street_2 += " "
	#s_street_2 += "\n\nЯ положил " if hero_is_male else "\n\nЯ положила "
	# жетон.
	s_street_2 += S01_ItemType.get_description_short (story._clue_container._clue_item.get_item_type ()).get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	s_street_2 += " в "
	# коробку.
	s_street_2 += story._clue_container.get_description_short ().get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE))
	s_street_2 += " и отправился домой." if hero_is_male else " и отправилась домой."
	
	var s_delimiter: String = "\no - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o - o\n"
	
	var s_ending_1: String = ""
	s_ending_1 += "На этом месте история обрывается. Героя могло ждать куда больше приключений, если бы не амбиции автора."
	s_ending_1 += "\n\nКликни по экрану, чтобы перейти в главное меню."
	
	_flow_sentences = [s_hill, s_stones_1, s_stones_2, s_top_1, s_lady_danger_1, s_lady_danger_2, s_trail_1, s_trail_2, s_cleft_1, s_cleft_2, s_missing_1, s_missing_2 + "\n\n" + s_missing_3, s_missing_4, s_sacrifice_1, s_sacrifice_2, s_sacrifice_3, s_sacrifice_4, s_sacrifice_5, s_sacrifice_6, s_sacrifice_7, s_waiting, s_symbol_1, s_symbol_2, s_symbol_3, s_symbol_4, s_symbol_5, s_symbol_6, s_symbol_7, s_ghost_1, s_ghost_2, s_ghost_3, s_ghost_4, s_ghost_5, s_ghost_6, s_ghost_7, s_street_1, s_street_2, s_delimiter, s_ending_1]
	_flow_action_tree = null
	_flow_next_state = STATE_EXIT
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


func get_x_to_hero_relation_phrase () -> T00_SimplePhrase:
	
	var relation: S01_StringParamValue = T00_A_Globals.story.get_x_to_hero_relation ()
	if relation.param_class == S01_ParamClass.FAMILY_RELATION:
		return S01_FamilyRelation.get_phrase_official (relation)
	elif relation.param_class == S01_ParamClass.FRIENDSHIP_RELATION:
		return S01_FriendshipRelation.get_phrase (relation, T00_A_Globals.story._x.get_gender ())
	
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


func get_introducer_is_male () -> bool:
	
	var introducer_gender: S01_ParamValue = T00_A_Globals.story._introducer.get_gender ()
	var is_male: bool = S01_Gender.MALE.equals (introducer_gender)
	if !is_male && !S01_Gender.FEMALE.equals (introducer_gender):
		printerr ("Unknown introducer gender.")
	return is_male



