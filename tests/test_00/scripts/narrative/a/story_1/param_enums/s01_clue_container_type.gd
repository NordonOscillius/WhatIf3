class_name S01_ClueContainerType extends S01_ParamEnum


## Прозрачный пакет.
static var TRANSPARENT_BAG: S01_StringParamValue = create_param_value (&"transparent_bag")
## Бумажный пакет.
static var PAPER_BAG: S01_StringParamValue = create_param_value (&"paper_bag")
## Сверток цилиндрической формы.
static var CYLINER_BUNDLE: S01_StringParamValue = create_param_value (&"cylinder_bundle")
## Коробка или коробочка.
static var BOX: S01_StringParamValue = create_param_value (&"box")


## Создает значение параметра категории S01_ParamClass.CLUE_CONTAINER_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.CLUE_CONTAINER_TYPE, value)


## Возвращает любое случайное Значение Параметра категории S01_ParamClass.CLUE_CONTAINER_TYPE.
static func select_random () -> S01_StringParamValue:
	
	return S01_ParamValue.pick_random_string_param_value ([TRANSPARENT_BAG, PAPER_BAG, CYLINER_BUNDLE, BOX])


## Выбирает тип контейнера по типу зацепки, лежащей в нем.
static func select_for_clue (clue: S01_ClueContainerItem) -> S01_StringParamValue:
	
	# DEBUG.
	return TRANSPARENT_BAG
	
	assert (clue._is_clue)
	var clue_type: S01_ParamValue = clue.get_param (S01_ClueContainerItem.PNAME__ITEM_TYPE)
	match clue_type.get_value_variant ():
		S01_ItemType.TOKEN_MARK.value:
			return S01_ParamValue.pick_random_string_param_value ([TRANSPARENT_BAG, PAPER_BAG, BOX])
		S01_ItemType.SMALL_KEY.value:
			return S01_ParamValue.pick_random_string_param_value ([TRANSPARENT_BAG, PAPER_BAG, BOX])
		S01_ItemType.SHAPED_STONE.value:
			return S01_ParamValue.pick_random_string_param_value ([PAPER_BAG, CYLINER_BUNDLE, BOX])
		S01_ItemType.SHEET_OF_PAPER.value:
			return S01_ParamValue.pick_random_string_param_value ([TRANSPARENT_BAG, PAPER_BAG])
		S01_ItemType.STONE_BOX.value:
			return S01_ParamValue.pick_random_string_param_value ([BOX])
		S01_ItemType.HOUSE_KEY.value:
			printerr ("Bad value for the clue.")
			return null
	
	printerr ("Can't select Container type by Clue type.")
	return null
