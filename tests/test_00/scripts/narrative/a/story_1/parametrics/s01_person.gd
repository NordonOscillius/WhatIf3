class_name S01_Person extends S01_Parametric
## Подкласс Параметрика, хранящий данные о человеке.

# Типы параметров, которые могут хранится в экземпляре Личности.

# Название параметра для роли Человека в истории.
static var PNAME__STORY_ROLE: StringName = &"story_role"
# Название параметра для рода деятельности Человека.
static var PNAME__OCCUPATION: StringName = &"occupation"
# Название параметра для места проживания Человека.
static var PNAME__LIVING_PLACE: StringName = &"living_place"
# Название параметра для пола Человека.
static var PNAME__GENDER: StringName = &"gender"
# Название параметра для возраста Человека (IntParamValue).
static var PNAME__AGE: StringName = &"age"

var _first_name: T00_Noun
var _last_name: T00_LastName


func _init ():
	
	_name = &"person"


func pick_random_first_name_by_gender (exclude: Array[T00_Noun] = []):
	
	var choices: Array[T00_Noun]
	var gender: S01_StringParamValue = get_gender ()
	if S01_Gender.MALE.equals (gender):
		choices = T00_A_Globals.words.get_all_male_names ()
	elif S01_Gender.FEMALE.equals (gender):
		choices = T00_A_Globals.words.get_all_female_names ()
	else:
		printerr ("Unknown gender.")
	
	# Удаляем из массива всех вариантов все элементы из exclude.
	var num_exclusions: int = exclude.size ()
	var i: int = 0
	while i < num_exclusions:
		var cur_exclusion: T00_Noun = exclude[i]
		var match_index: int = choices.find (cur_exclusion)
		if match_index >= 0:
			choices.remove_at (match_index)
		
		i += 1
	
	var index: int = T00_A_Globals.randomizer.randi_range (0, choices.size () - 1)
	_first_name = choices[index]


func pick_random_last_name (exclude: Array[T00_LastName] = []):
	
	var choices: Array[T00_LastName] = T00_A_Globals.words.get_all_last_names ()
	
	# Удаляем из массива всех вариантов все элементы из exclude.
	var num_exclusions: int = exclude.size ()
	var i: int = 0
	while i < num_exclusions:
		var cur_exclusion: T00_LastName = exclude[i]
		var match_index: int = choices.find (cur_exclusion)
		if match_index >= 0:
			choices.remove_at (match_index)
		
		i += 1
	
	var index: int = T00_A_Globals.randomizer.randi_range (0, choices.size () - 1)
	_last_name = choices[index]


# Выбирает фамилию Икса по фамилии героя: если они родственники, то выбирает такую же, а если друзья - то другую.
#func pick_last_name_for_x () -> T00_LastName:
	#
	#var story: S01_Story = T00_A_Globals.story
	#var x_to_hero_relation: S01_StringParamValue = story.get_x_to_hero_relation ()
	#if x_to_hero_relation.param_class == S01_ParamClass.FAMILY_RELATION:
		#return story._hero._last_name
	#elif x_to_hero_relation.param_class == S01_ParamClass.FRIENDSHIP_RELATION:
		#return pick_random_last_name ([story._hero._last_name])
	#
	#printerr ("Unknown relation class.")
	#return null


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_story_role () -> S01_StringParamValue:
	return get_param (PNAME__STORY_ROLE)

func get_occupation () -> S01_StringParamValue:
	return get_param (PNAME__OCCUPATION)

func get_living_place () -> S01_StringParamValue:
	return get_param (PNAME__LIVING_PLACE)

func get_gender () -> S01_StringParamValue:
	return get_param (PNAME__GENDER)

func get_age () -> S01_IntParamValue:
	return get_param (PNAME__AGE)
