class_name S01_ClueContainer extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о контейнере с зацепкой, передаваемым в Интродакшене.

static var PNAME__CONTAINER_TYPE: StringName = &"container_type"
static var PNAME__HEAVINESS: StringName = &"heaviness"

var _clue_item: S01_ClueContainerItem


func _init ():
	
	_name = &"clue container"


func generate ():
	
	var story: S01_Story = T00_A_Globals.story
	
	# Генерируем предмет зацепки.
	_clue_item = S01_ClueContainerItem.new ()
	_clue_item._is_clue = true
	_clue_item.set_item_type (S01_ItemType.select_for_clue ())
	_clue_item.set_action_panel_name (_clue_item.create_action_panel_name_uninspected ())
	_clue_item.set_secret_sign_type (S01_SecretSignType.select_for_clue_item ())
	_clue_item.set_color (S01_Color.select_for_item (_clue_item))
	var shape: S01_StringParamValue = S01_GeometricShape.select_for_clue_item (_clue_item)
	if shape:
		_clue_item.set_geometric_shape (shape)
	add_child (_clue_item)
	
	# DEBUG.
	# Если Интродакшен происходит в полицейском участке, то нужно передать наследство и ключ от дома.
	#var story: S01_Story = T00_A_Globals.story
	#if story.get_param (S01_Story.PNAME__INTRODUCER_TYPE).get_value_variant () == S01_IntroducerType.POLICE_OFFICER.value:
		#var key: S01_ClueContainerItem = S01_ClueContainerItem.new ()
		#key._is_clue = false
		#key.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.HOUSE_KEY)
		#add_child (key)
	
	# С вероятностью 50% передаем и ключ от дома (сейчас я делаю только вариант с полицейским).
	# DEBUG.
	#if true:
	if T00_A_Globals.randomizer.randf () >= .5:
		var key: S01_ClueContainerItem = S01_ClueContainerItem.new ()
		key._is_clue = false
		key.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.HOUSE_KEY)
		key.set_param (PNAME__ACTION_PANEL_NAME, key.create_action_panel_name_uninspected ())
		key.set_param (S01_ClueContainerItem.PNAME__COLOR, S01_Color.select_for_item (key))
		add_child (key)
	
	# Подбираем тип контейнера по типу зацепки.
	set_param (PNAME__CONTAINER_TYPE, S01_ClueContainerType.select_for_clue (_clue_item))
	# Устанавливаем название контейнера на панели действий.
	set_param (PNAME__ACTION_PANEL_NAME, S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, get_description_short ()))
	# Устанавливаем параметр "Оценка тяжести" в зависимости от того, какие предметы находятся в контейнере.
	update_heaviness_assessment ()


func update_heaviness_assessment ():
	
	var objective_heaviness: S01_StringParamValue = S01_Heaviness.LIGHT.clone_shallow ()
	var items: Array[S01_ClueContainerItem] = get_items ()
	var i: int = items.size ()
	while i:
		i -= 1
		# "Прибавляем" оценочную тяжесть предмета к общей тяжести контейнера (пока что объективной).
		objective_heaviness.set_from (S01_Heaviness.get_sum (objective_heaviness, items[i].get_heaviness_assessment ()))
	
	var subjective_heaviness: S01_StringParamValue
	match get_container_type ().value:
		S01_ClueContainerType.TRANSPARENT_BAG.value: subjective_heaviness = objective_heaviness
		S01_ClueContainerType.PAPER_BAG.value: subjective_heaviness = S01_Heaviness.increase (objective_heaviness)
		S01_ClueContainerType.CYLINER_BUNDLE.value: subjective_heaviness = objective_heaviness
		S01_ClueContainerType.BOX.value: subjective_heaviness = objective_heaviness
		#S01_ClueContainerType.BOX.value: subjective_heaviness = S01_Heaviness.decrease (objective_heaviness)
	
	set_param (PNAME__HEAVINESS, subjective_heaviness)


## Возвращает массив, содержащий все предметы типа S01_ClueContainerItem внутри контейнера.
func get_items () -> Array[S01_ClueContainerItem]:
	
	var result: Array[S01_ClueContainerItem] = []
	var num_children: int = _children.size ()
	var i: int = 0
	while i < num_children:
		var item: S01_ClueContainerItem = _children[i] as S01_ClueContainerItem
		if item:
			result.push_back (item)
		
		i += 1
	
	return result


## Добавляет действие типа action_type ко всем предметам типа S01_ClueContainerItem внутри контейнера.
func create_and_add_action_to_all_items (action_type: StringName, sort_alphabetically: bool = false):
	
	var num_children: int = _children.size ()
	var i: int = 0
	while i < num_children:
		var item: S01_ClueContainerItem = _children[i] as S01_ClueContainerItem
		if item:
			item.create_and_add_action (action_type, sort_alphabetically)
		
		i += 1


func get_description_short () -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match get_container_type ().value:
		S01_ClueContainerType.TRANSPARENT_BAG.value: return T00_NounPhrase.new ().setup (w.paket)
		S01_ClueContainerType.PAPER_BAG.value: return T00_NounPhrase.new ().setup (w.paket)
		S01_ClueContainerType.CYLINER_BUNDLE.value: return T00_NounPhrase.new ().setup (w.svyortok)
		S01_ClueContainerType.BOX.value: return T00_NounPhrase.new ().setup (w.korobka)
	
	printerr ("Unknown container type.")
	return null


func get_description_long () -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match get_container_type ().value:
		S01_ClueContainerType.TRANSPARENT_BAG.value: return T00_AdjArrayNounPhrase.new ().setup ([w.nebolshoy, w.prozrachniy], w.paket)
		S01_ClueContainerType.PAPER_BAG.value: return T00_AdjArrayNounPhrase.new ().setup ([w.nebolshoy, w.bumazhnyi], w.paket)
		S01_ClueContainerType.CYLINER_BUNDLE.value: return T00_AdjArrayNounPhrase.new ().setup ([w.prodolgovatiy, w.krugliy], w.svyortok)
		S01_ClueContainerType.BOX.value: return T00_AdjNounPhrase.new ().setup (w.nebolshoy, w.korobka)
	
	printerr ("Unknown container type.")
	return null


func is_transparent () -> bool:
	
	if get_container_type ().value == S01_ClueContainerType.TRANSPARENT_BAG.value:
		return true
	return false


## Возвращает род существительного, обозначающего контейнер - константу класса T00_WordGender.
func get_word_gender () -> int:
	
	match get_container_type ().value:
		S01_ClueContainerType.TRANSPARENT_BAG.value: return T00_WordGender.MASCULINE
		S01_ClueContainerType.PAPER_BAG.value: return T00_WordGender.MASCULINE
		S01_ClueContainerType.CYLINER_BUNDLE.value: return T00_WordGender.MASCULINE
		S01_ClueContainerType.BOX.value: return T00_WordGender.FEMININE
	
	printerr ("Unknown container type.")
	return T00_WordGender.UNKNOWN


## Возвращает глагол, соответствующий помещению в контейнер предмета, который для него предназначен. Например, "завернуть" или "положить" (в контейнер).
func get_place_into_verb () -> T00_Verb:
	
	var type: S01_StringParamValue = get_container_type ()
	if type.equals (S01_ClueContainerType.CYLINER_BUNDLE):
		return T00_A_Globals.words.zavernut
	
	return T00_A_Globals.words.polozhit


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_container_type () -> S01_StringParamValue:
	return get_param (PNAME__CONTAINER_TYPE)

func get_heaviness () -> S01_StringParamValue:
	return get_param (PNAME__HEAVINESS)

