class_name S01_ItemType extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Тип предмета".

# ==================== CLUE TYPES ====================

## Метка-жетон произвольной формы.
static var TOKEN_MARK: S01_StringParamValue = create_param_value (&"token_mark")
## Ключик.
static var SMALL_KEY: S01_StringParamValue = create_param_value (&"small_key")
## Камень призматической формы (треугольной, квадратной, круглой).
static var SHAPED_STONE: S01_StringParamValue = create_param_value (&"shaped_stone")
## Лист бумаги.
static var SHEET_OF_PAPER: S01_StringParamValue = create_param_value (&"sheet_of_paper")
## Каменная шкатулка.
static var STONE_BOX: S01_StringParamValue = create_param_value (&"stone_box")

# ==================== OTHER TYPES ====================

## Ключ от дома.
static var HOUSE_KEY: S01_StringParamValue = create_param_value (&"house_key")


## Создает значение параметра категории S01_ParamClass.ITEM_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.ITEM_TYPE, value)


## Случайным образом выбирает Значение Параметра для зацепки.
static func select_for_clue () -> S01_StringParamValue:
	
	return S01_ParamValue.pick_random_string_param_value ([TOKEN_MARK, SMALL_KEY, SHAPED_STONE, SHEET_OF_PAPER, STONE_BOX])

## Возвращает Значение Параметра категории "Оценка тяжести предмета" по Значению Параметра категории "Тип предмета".
static func get_heaviness_assessment (item_type: S01_StringParamValue) -> S01_StringParamValue:
	
	match item_type.value:
		TOKEN_MARK.value: return S01_Heaviness.LIGHT
		SMALL_KEY.value: return S01_Heaviness.LIGHT
		SHAPED_STONE.value: return S01_Heaviness.HEAVY
		SHEET_OF_PAPER.value: return S01_Heaviness.LIGHT
		STONE_BOX.value: return S01_Heaviness.HEAVY
		HOUSE_KEY.value: return S01_Heaviness.LIGHT
	
	printerr ("Unknown item type.")
	return null
