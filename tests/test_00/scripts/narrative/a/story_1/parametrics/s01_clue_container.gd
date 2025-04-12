class_name S01_ClueContainer extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о контейнере с зацепкой, передаваемым в Интродакшене.

static var PNAME__CONTAINER_TYPE: StringName = &"container_type"

var _items: Array = []


func _init ():
	
	_name = &"clue container"


func generate ():
	
	# Генерируем предмет зацепки.
	var clue: S01_ClueContainerItem = S01_ClueContainerItem.new ()
	clue._is_clue = true
	clue.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.select_for_clue ())
	_items.push_back (clue)
	
	# Если Интродакшен происходит в полицейском участке, то нужно передать наследство и ключ от дома.
	var story: S01_Story = T00_A_Globals.story
	if story.get_param (S01_Story.PNAME__INTRODUCER_TYPE).get_value_variant () == S01_IntroducerType.POLICE_OFFICER.value:
		var key: S01_ClueContainerItem = S01_ClueContainerItem.new ()
		key._is_clue = false
		key.set_param (S01_ClueContainerItem.PNAME__ITEM_TYPE, S01_ItemType.HOUSE_KEY)
		_items.push_back (key)
	
	# Подбираем тип контейнера по типу зацепки.
	set_param (PNAME__CONTAINER_TYPE, S01_ClueContainerType.select_for_clue (clue))
