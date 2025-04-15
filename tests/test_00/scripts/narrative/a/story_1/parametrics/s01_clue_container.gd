class_name S01_ClueContainer extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о контейнере с зацепкой, передаваемым в Интродакшене.

static var PNAME__CONTAINER_TYPE: StringName = &"container_type"

#var _items: Array = []


func _init ():
	
	_name = &"clue container"


func generate ():
	
	# Генерируем предмет зацепки.
	var clue: S01_ClueContainerItem = S01_ClueContainerItem.new ()
	clue._is_clue = true
	clue.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.select_for_clue ())
	#_items.push_back (clue)
	add_child (clue)
	
	# Если Интродакшен происходит в полицейском участке, то нужно передать наследство и ключ от дома.
	var story: S01_Story = T00_A_Globals.story
	if story.get_param (S01_Story.PNAME__INTRODUCER_TYPE).get_value_variant () == S01_IntroducerType.POLICE_OFFICER.value:
		var key: S01_ClueContainerItem = S01_ClueContainerItem.new ()
		key._is_clue = false
		key.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.HOUSE_KEY)
		#_items.push_back (key)
		add_child (key)
	
	# Подбираем тип контейнера по типу зацепки.
	set_param (PNAME__CONTAINER_TYPE, S01_ClueContainerType.select_for_clue (clue))


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


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_container_type () -> S01_StringParamValue:
	return get_param (PNAME__CONTAINER_TYPE)

