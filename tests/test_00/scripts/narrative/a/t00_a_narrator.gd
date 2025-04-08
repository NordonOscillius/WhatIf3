class_name T00_A_Narrator extends T00_Narrator

var _step: int = 0
var _beat: T00_Beat

var _words: T00_A_Words
var _randomizer: RandomNumberGenerator

var _hero: T00_A_Hero


func _init ():
	
	_randomizer = RandomNumberGenerator.new ()
	_randomizer.seed = 1
	
	_words = T00_A_Words.new ()
	T00_A_Globals.words = _words
	
	_hero = T00_A_Hero.new (self)


# Overriden.
func get_next_beat (action: T00_Action = null) -> T00_Beat:
	
	var i: int
	var w: T00_A_Words = T00_A_Globals.words
	
	print ("Test Narrator: step ", _step)
	
	var beat: T00_Beat = T00_Beat.new ()
	
	match _step:
		0:
			beat._story_text = "В кабинете царил полумрак, разгоняемый разве что единственной лампой, стоявшей на заваленном бумагами столе."
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
					.__name (
						T00_Phrase.new ()
						.add_part (
							T00_PhraseWord.new (
								T00_UsedNoun.new ()
								.__noun (w.brodyaga)
								.__usage (
									T00_NounUsage.new ()
									.__case (T00_WordCase.NOMINATIVE)
									.__number (T00_WordNumber.SINGLE)
								)
							)
						)
					)
					.add_child (T00_Action.new ())
				)
			)
			
			#beat._action_tree = T00_ActionNode.new ()
			#i = 0
			#while i < 9:
				#beat._action_tree.add_child (
					#T00_ObjectNode.new ()
					#.add_child (T00_Action.new ())
				#)
				#i += 1
	
	# Next iteration.
	_step += 1
	var max_step: int = 2
	if _step > max_step:
		_step = max_step
	
	_beat = beat
	_book.push_back (beat)
	
	return beat
