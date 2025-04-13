class_name T00_A_Narrator extends T00_Narrator

var _step: int = 0
var _beat: T00_Beat

var _words: T00_A_Words
var _randomizer: RandomNumberGenerator

var _hero: T00_A_Hero

# Tests.
var _story: S01_Story


func _init ():
	
	_randomizer = RandomNumberGenerator.new ()
	#_randomizer.seed = 123
	T00_A_Globals.randomizer = _randomizer
	
	_words = T00_A_Words.new ()
	T00_A_Globals.words = _words
	
	_hero = T00_A_Hero.new (self)
	
	# Test.
	_story = S01_Story.new ()
	T00_A_Globals.story = _story
	_story.generate ()


func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var w: T00_A_Words = T00_A_Globals.words
	
	print ("Test Narrator: step ", _step)
	
	var beat: T00_Beat = T00_Beat.new ()
	
	match _step:
		0:
			beat._story_text = _story.get_outline_text ()
			beat._action_tree = null
		1:
			beat._story_text = "Я работаю " + _hero._occupation._male_name.get_form (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE) + "."
			beat._action_tree = null
		2:
			beat._story_text = "Выбери, что будешь делать дальше."
			beat._action_tree = T00_Utils.fluent (
				T00_ActionNode.new ()
				.add_child (
					T00_ObjectNode.new ()
					.__name ("бродяга")
					.add_child (T00_Action.new ())
				)
			)
	
	# Next iteration.
	_step += 1
	var max_step: int = 2
	if _step > max_step:
		_step = max_step
	
	_beat = beat
	_book.push_back (beat)
	
	return beat


func generate_story ():
	
	# Закадровая история (ЗИ) может быть сделана из шаблона.
	# Делаем набор заготовленных шаблонов, выбираем один.
	# Я ПОНЯЛ ВАЖНУЮ (НО ЛЕВУЮ) ШТУКУ. Каждый объект может иметь не одно свойство _name или _description; он может иметь целую кучу таких свойств-фраз, каждая из которых будет отвечать требованиям разных "книжных" параграфов. Например, в одном месте книги предмет называется вот так, а в другом - эдак.
	# Какие шаблоны ЗИ есть?
	# 1. Икс с другом решили пойти охотиться на крупного зверя. Так как они иногда браконьерствовали, Послание от друга и было Тайным. 
	# 2. Икс как-то связан с Коммуной - сообществом съехавших людей, вытворяющих всякую дичь.
	# 2.1. Икс работал под прикрытием, но его раскрыли. Он отправляет сообщение своему человеку, но кто-то из Коммуны это замечает. Человека убивают, Икса оставляют в живых, чтобы вытянуть инфу. Герой оказывается свидетелем убийства.
	# 2.2. Икс состоит в Коммуне и кидает ТП герою, чтобы заманить его в западню.
	# 3. Икс умирает и оставляет герою в наследство клад. Среди вещей Икса, перешедших в наследство - зацепка, которую Икс убеждал героя запомнить, когда тот был еще ребенком. С помощью нее герой отыскивает клад.
	
	var story_scheme: int = _randomizer.randi_range (0, 2)
	match story_scheme:
		0:
			generate_commune_bad_story ()
		1:
			generate_commune_bad_story ()
		2:
			generate_commune_bad_story ()
	
	pass


func generate_commune_bad_story ():
	
	# Икс - злодей, а Тайное Послание - приманка.
	# Этапы такие.
	# 1. Герой получает Тайное Послание от Икса.
	# 1.1. Это может произойти у него в квартире.
	# 1.1.1. Принесет тот, кому Икс передал ТП.
	# 1.1.2. Придет в почтовый ящик.
	# 1.2. Это может произойти на работе героя.
	# 1.2.1. Может принести курьер.
	# 1.2.2. Может передать коллега, которому передал курьер.
	# 1.2.3. Может передать коллега, которому передал сам Икс.
	# 1.3. Это может произойти у детектива, который расследовал дело об исчезновении Икса.
	
	pass


# Overriden.
#func get_next_beat (action: T00_Action = null) -> T00_Beat:
	#
	#var i: int
	#var w: T00_A_Words = T00_A_Globals.words
	#
	#print ("Test Narrator: step ", _step)
	#
	#var beat: T00_Beat = T00_Beat.new ()
	#
	#match _step:
		#0:
			#beat._story_text = "В кабинете царил полумрак, разгоняемый разве что единственной лампой, стоявшей на заваленном бумагами столе."
			#beat._action_tree = null
		#1:
			#beat._story_text = "Я работаю " + _hero._occupation._male_name.get_form (T00_WordCase.INSTRUMENTAL, T00_WordNumber.SINGLE) + "."
			#beat._action_tree = null
		#2:
			#beat._story_text = "Выбери, что будешь делать дальше."
			#beat._action_tree = T00_Utils.fluent (
				#T00_ActionNode.new ()
				#.add_child (
					#T00_ObjectNode.new ()
					#.__name (
						#T00_Phrase.new ()
						#.add_part (
							#T00_PhraseWord.new (
								#T00_UsedNoun.new ()
								#.__noun (w.brodyaga)
								#.__usage (
									#T00_NounUsage.new ()
									#.__case (T00_WordCase.NOMINATIVE)
									#.__number (T00_WordNumber.SINGLE)
								#)
							#)
						#)
					#)
					#.add_child (T00_Action.new ())
				#)
			#)
	#
	## Next iteration.
	#_step += 1
	#var max_step: int = 2
	#if _step > max_step:
		#_step = max_step
	#
	#_beat = beat
	#_book.push_back (beat)
	#
	#return beat
