class_name S01_Story extends S01_Parametric


# Название параметра: тип Интродьюсера.
static var PNAME__INTRODUCER_TYPE: StringName = &"introducer_type"
# Название параметра: тип места Интродакшена.
static var PNAME__INTRODUCTION_PLACE_TYPE: StringName = &"introduction_place_type"
# Название параметра: кем Икс приходится герою. Категория: Family Relation или Friendship Relation.
static var PNAME__X_TO_HERO_RELATION: StringName = &"x_to_hero_relation"
# Название параметра: кем герой приходится Иксу. Категория: Family Relation или Friendship Relation.
static var PNAME__HERO_TO_X_RELATION: StringName = &"hero_to_x_relation"


var _hero: S01_Hero
var _x: S01_X
var _introducer: S01_Introducer
var _clue_container: S01_ClueContainer

var _locations: Array[S01_Location] = []


func _init ():
	
	_name = &"story"


func generate ():
	
	var w: T00_A_Words = T00_A_Globals.words
	
	_hero = S01_Hero.new ()
	_hero.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.HERO)
	_hero.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
	_hero.pick_random_first_name_by_gender ()
	_hero.pick_random_last_name ()
	add_child (_hero)
	
	_x = S01_X.new ()
	_x.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.X)
	add_child (_x)
	
	# Кем Икс приходится герою (родственник или друг), кем герой приходится Иксу, пол Икса и полное имя Икса.
	var x_to_hero_relation: S01_ParamValue = select_x_to_hero_relation ()
	set_param (PNAME__X_TO_HERO_RELATION, x_to_hero_relation)
	if x_to_hero_relation.param_class == S01_ParamClass.FAMILY_RELATION:
		_x.set_param (S01_Person.PNAME__GENDER, S01_Gender.get_for_family_relation (x_to_hero_relation))
		set_param (PNAME__HERO_TO_X_RELATION, S01_FamilyRelation.invert (x_to_hero_relation, _hero.get_gender ()))
		_x._last_name = _hero._last_name
	else:
		_x.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
		set_param (PNAME__HERO_TO_X_RELATION, x_to_hero_relation)
		_x.pick_random_last_name ([_hero._last_name])
	_x.pick_random_first_name_by_gender ([_hero._first_name])
	
	_introducer = S01_Introducer.new ()
	_introducer.set_param (S01_Person.PNAME__STORY_ROLE, S01_CharStoryRole.INTRODUCER)
	_introducer.set_param (S01_Person.PNAME__GENDER, S01_Gender.select_random ())
	_introducer.pick_random_first_name_by_gender ([_hero._first_name, _x._first_name])
	_introducer.pick_random_last_name ([_hero._last_name, _x._last_name])
	# Как показывать Интродьюсера на панели действий.
	_introducer.set_param (S01_Parametric.PNAME__ACTION_PANEL_NAME, S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, T00_RankLastNamePhrase.new ().setup (w.leytenant, _introducer._last_name, S01_Gender.get_word_gender_by_param (_introducer.get_gender ()))))
	add_child (_introducer)
	
	set_param (PNAME__INTRODUCER_TYPE, S01_IntroducerType.pick_random_for_story ())
	set_param (PNAME__INTRODUCTION_PLACE_TYPE, S01_IntroductionPlaceType.select_for_story ())
	
	# Ages.
	_introducer.set_param (S01_Person.PNAME__AGE, S01_Age.select_for_introducer ())
	var x_and_hero_ages: Array[S01_IntParamValue] = S01_Age.select_for_x_and_hero ()
	_x.set_param (S01_Person.PNAME__AGE, x_and_hero_ages[0])
	_hero.set_param (S01_Person.PNAME__AGE, x_and_hero_ages[1])
	
	var intro_location: S01_Location = S01_Location.new ()
	intro_location.set_param (S01_Location.PNAME__STORY_ROLE, S01_LocationStoryRole.INTRODUCTION_PLACE)
	intro_location.set_param (S01_Location.PNAME__LOCATION_TYPE, S01_LocationType.select_for_intro_location ())
	_locations.push_back (intro_location)
	add_child (intro_location)
	
	_hero.set_param (S01_Person.PNAME__LIVING_PLACE, S01_LivingPlace.select_for_hero (_hero))
	
	# Генерируется с предметами внутри, включая зацепку.
	_clue_container = S01_ClueContainer.new ()
	_clue_container.generate ()
	add_child (_clue_container)
	
	pass


func select_x_to_hero_relation () -> S01_ParamValue:
	
	var choices: Array[S01_ParamValue] = S01_FamilyRelation.get_choices_for_x_to_hero_relation ()
	choices.push_back (S01_FriendshipRelation.FRIEND)
	return S01_ParamValue.pick_random_param_value (choices)


## Возвращает род деятельности героя; если до вызова метода род деятельности героя не был установлен, устанавливает его.
func get_or_clarify_hero_occupation () -> S01_ParamValue:
	
	var occupation: S01_ParamValue = _hero.get_param (S01_Person.PNAME__OCCUPATION)
	if !occupation:
		occupation = S01_Occupation.select_for_hero ()
		_hero.set_param (S01_Person.PNAME__OCCUPATION, occupation)
	
	return occupation


## Обходит все интерактивные объекты, вложенные в эту Историю, и собирает по ним дерево действий, которое затем можно использовать для отображения действий на панели действий.
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
			
			var num_actions: int = cur_interactive.num_actions
			var j: int = 0
			while j < num_actions:
				var object_action: T00_Action = cur_interactive.get_action_at (j)
				var tree_action: T00_Action = T00_Action.new ().setup (object_action._type)
				object_node.add_child (tree_action)
				
				j += 1
			
			i += 1
	else:
		action_tree = null
	
	return action_tree


## Ищет документ среди своих непосредственных потомков. Если документа не нашлось, создает новый экземпляр документа, добавляет его к своим потомкам и возвращает его.
## Документ всегда должен находиться на первом уровне вложенности (т. е. быть непосредственным потомком Истории).
func get_or_create_document () -> S01_Document:
	
	var document: S01_Document
	var i: int = _children.size ()
	while i:
		i -= 1
		var child: S01_Parametric = _children[i]
		document = child as S01_Document
		if document:
			return document
	
	# Если документа не нашли, то создаем его и возвращаем.
	document = S01_Document.new ()
	document.set_action_panel_name (document.create_action_panel_name ())
	add_child (document)
	return document


# ==================================================
# ====================== TEXT ======================
# ==================================================

func get_template () -> S01_TextTemplate:
	
	return S01_TutorialTemplate.new ()
	
	#match get_param (PNAME__INTRODUCER_TYPE).get_value_variant ():
		#S01_IntroducerType.POLICE_OFFICER.value:
			#return S01_PoliceTemplate.new ()
		#S01_IntroducerType.COURIER.value:
			#return S01_PoliceTemplate.new ()
			##return S01_CourierTemplate.new ()
		#S01_IntroducerType.STRANGER.value:
			#return S01_PoliceTemplate.new ()
			##return S01_StrangerTemplate.new ()
	
	printerr ("Unknown introducer type.")
	return null


func get_text_for_outline__location () -> String:
	
	var intro_location: S01_Location = get_introduction_location ()
	if !intro_location:
		return "Генерация истории произошла с ошибкой: место действия первой сцены не определено."
	
	var loc_type: S01_ParamValue = intro_location.get_param (S01_Location.PNAME__LOCATION_TYPE)
	if !loc_type:
		return "Генерация истории произошла с ошибкой: место действия первой сцены не определено."
	
	# Берем инфу о том, где живет герой: в доме или квартире.
	var hero_living_place_text: String
	if S01_LivingPlace.APARTMENT.equals (_hero.get_living_place ()):
		hero_living_place_text = "квартиры"
	elif S01_LivingPlace.HOUSE.equals (_hero.get_living_place ()):
		hero_living_place_text = "дома"
	
	match loc_type.get_value_variant ():
		S01_LocationType.POLICE_CABINET.value:
			return "Действие начинается в кабинете полицейского участка."
		S01_LocationType.CALL_CENTER_OPEN_SPACE.value:
			return "Действие начинается в кабинете колл-центра."
		S01_LocationType.CLASSROOM.value:
			return "Действие начинается в классе школы."
		S01_LocationType.LAWYER_OFFICE.value:
			return "Действие начинается в офисе юридической конторы."
		S01_LocationType.HALLWAY.value:
			return "Действие начинается в прихожей " + hero_living_place_text + ", где живет главный герой."
		S01_LocationType.APARTMENT_ENTRANCE.value:
			return "Действие начинается в подъезде многоквартирного дома, где живет главный герой."
		S01_LocationType.FRONT_YARD.value:
			return "Действие начинается на дворе перед домом, где живет главный герой."
	
	printerr ("Wrong value for Location Type.")
	return ""


func get_outline_text () -> String:
	
	# Здесь мы пытаемся применить шаблон текста и смотрим, что из этого получается.
	# Шаблон такой: "В [место] приходит [лицо]".
	
	var intro_location: S01_Location = get_introduction_location ()
	var location_type: S01_ParamValue = intro_location.get_location_type ()
	
	var need_introducer_full_name: bool = false
	var need_hero_full_name: bool = false
	var hero_full_name_case: int
	var hero_full_name_is_clarification: bool = false
	var introducer_discovered: bool = false
	
	var hero_living_place_text: String
	if S01_LivingPlace.APARTMENT.equals (_hero.get_living_place ()):
		hero_living_place_text = "В квартиру главного героя"
		hero_full_name_case = T00_WordCase.GENITIVE
		hero_full_name_is_clarification = false
	elif S01_LivingPlace.HOUSE.equals (_hero.get_living_place ()):
		hero_living_place_text = "В дом, где живет главный герой,"
		hero_full_name_case = T00_WordCase.NOMINATIVE
		hero_full_name_is_clarification = true
	
	var result: String
	match location_type.get_value_variant ():
		S01_LocationType.POLICE_CABINET.value:
			result = "В кабинет детектива"
			need_introducer_full_name = true
		S01_LocationType.CALL_CENTER_OPEN_SPACE.value:
			result = "В кабинет колл-центра, где работает главный герой,"
			need_hero_full_name = true
			hero_full_name_case = T00_WordCase.NOMINATIVE
			hero_full_name_is_clarification = true
		S01_LocationType.CLASSROOM.value:
			result = "В класс школы, где работает главный герой,"
			need_hero_full_name = true
			hero_full_name_case = T00_WordCase.NOMINATIVE
			hero_full_name_is_clarification = true
		S01_LocationType.LAWYER_OFFICE.value:
			result = "В офис юридической конторы, где работает главный герой"
			need_hero_full_name = true
			hero_full_name_case = T00_WordCase.NOMINATIVE
			hero_full_name_is_clarification = false
		S01_LocationType.HALLWAY.value:
			result = hero_living_place_text
			need_hero_full_name = true
		S01_LocationType.APARTMENT_ENTRANCE.value:
			result = hero_living_place_text
			need_hero_full_name = true
		S01_LocationType.FRONT_YARD.value:
			result = hero_living_place_text
			need_hero_full_name = true
	
	if need_introducer_full_name:
		result += " " + _introducer._first_name.get_form (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE)
		result += " " + _introducer._last_name.get_form (T00_WordCase.GENITIVE, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (_introducer.get_gender ()))
		introducer_discovered = true
	
	if need_hero_full_name:
		result += " " + _hero._first_name.get_form (hero_full_name_case, T00_WordNumber.SINGLE)
		result += " " + _hero._last_name.get_form (hero_full_name_case, T00_WordNumber.SINGLE, S01_Gender.get_word_gender_by_param (_hero.get_gender ()))
		if hero_full_name_is_clarification:
			result += ","
	
	# Test phrase nodes.
	var w: T00_A_Words = T00_A_Globals.words
	var phrase: T00_AdjArrayNounPhrase = (
		T00_AdjArrayNounPhrase.new ().setup ([w.malenkiy, w.chorniy], w.brodyaga)
	)
	print ("LOOK WHAT WE HAVE HERE: мы видим ", phrase.get_form_for (T00_NounUsage.new ().setup (T00_WordCase.ACCUSATIVE, T00_WordNumber.SINGLE)))
	
	return result


func get_introduction_location () -> S01_Location:
	
	var i: int = _locations.size ()
	while i:
		i -= 1
		var location: S01_Location = _locations[i]
		var loc_story_role: S01_ParamValue = location.get_param (S01_Location.PNAME__STORY_ROLE)
		if loc_story_role && loc_story_role.get_value_variant () == S01_LocationStoryRole.INTRODUCTION_PLACE.value:
			return location
	
	return null


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_introducer_type () -> S01_StringParamValue:
	return get_param (PNAME__INTRODUCER_TYPE)

func get_introduction_place_type () -> S01_StringParamValue:
	return get_param (PNAME__INTRODUCTION_PLACE_TYPE)

func get_x_to_hero_relation () -> S01_StringParamValue:
	return get_param (PNAME__X_TO_HERO_RELATION)

func get_hero_to_x_relation () -> S01_StringParamValue:
	return get_param (PNAME__HERO_TO_X_RELATION)

