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
	
	return S01_ParamValue.pick_random_string_param_value ([TOKEN_MARK, SHAPED_STONE, SHEET_OF_PAPER, STONE_BOX])
	#return S01_ParamValue.pick_random_string_param_value ([TOKEN_MARK, SMALL_KEY, SHAPED_STONE, SHEET_OF_PAPER, STONE_BOX])

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


static func get_description_short (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_NounPhrase.new ().setup (w.zheton)
		SMALL_KEY.value: return T00_NounPhrase.new ().setup (w.klyuchik)
		SHAPED_STONE.value: return T00_NounPhrase.new ().setup (w.kamen)
		SHEET_OF_PAPER.value: return T00_NounPhrase.new ().setup (w.listok)
		STONE_BOX.value: return T00_NounPhrase.new ().setup (w.shkatulka)
		HOUSE_KEY.value: return T00_NounPhrase.new ().setup (w.klyuch)
	
	printerr ("Unknown item type.")
	return null


static func get_description_medium (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_AdjNounPhrase.new ().setup (w.chorniy, w.zheton)
		SMALL_KEY.value: return T00_AdjNounPhrase.new ().setup (w.malenkiy, w.klyuchik)
		SHAPED_STONE.value: return T00_AdjNounPhrase.new ().setup (w.figurniy, w.kamen)
		SHEET_OF_PAPER.value: return T00_NounConstPhrase.new ().setup (w.list, " бумаги")
		STONE_BOX.value: return T00_AdjNounPhrase.new ().setup (w.kamenniy, w.shkatulka)
		HOUSE_KEY.value: return T00_NounConstPhrase.new ().setup (w.klyuch, " от дома")
	
	printerr ("Unknown item type.")
	return null


static func get_description_uninspected (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_AdjArrayNounPhrase.new ().setup ([w.malenkiy, w.chorniy], w.predmet)
		SMALL_KEY.value: return T00_AdjNounPhrase.new ().setup (w.malenkiy, w.klyuchik)
		SHAPED_STONE.value: return T00_AdjNounPhrase.new ().setup (w.figurniy, w.kamen)
		SHEET_OF_PAPER.value: return T00_NounConstPhrase.new ().setup (w.list, " бумаги")
		STONE_BOX.value: return T00_AdjNounPhrase.new ().setup (w.kamenniy, w.shkatulka)
		HOUSE_KEY.value:
			return T00_CompoundPhrase.new ().setup (
				[
					T00_AdjPhrase.new ().setup (w.bolshoy, T00_WordGender.MASCULINE, T00_WordAnimacy.INANIMATE),
					T00_CompoundNounPhrase.new ().setup (w.klyuch, w.babochka, true)
				],
				1
			)
	
	printerr ("Unknown item type.")
	return null


## Название неисследованного предмета для панели действий.
static func get_description_uninspected_for_panel (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_AdjNounPhrase.new ().setup (w.chorniy, w.predmet)
		SMALL_KEY.value: return T00_AdjNounPhrase.new ().setup (w.malenkiy, w.klyuchik)
		SHAPED_STONE.value: return T00_AdjNounPhrase.new ().setup (w.figurniy, w.kamen)
		SHEET_OF_PAPER.value: return T00_NounConstPhrase.new ().setup (w.listok, " бумаги")
		STONE_BOX.value: return T00_AdjNounPhrase.new ().setup (w.kamenniy, w.shkatulka)
		HOUSE_KEY.value: return T00_AdjNounPhrase.new ().setup (w.bolshoy, w.klyuch)
	
	printerr ("Unknown item type.")
	return null


static func get_description_inspected_for_panel (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_AdjNounPhrase.new ().setup (w.chorniy, w.zheton)
		SMALL_KEY.value: return T00_AdjNounPhrase.new ().setup (w.malenkiy, w.klyuchik)
		SHAPED_STONE.value: return T00_AdjNounPhrase.new ().setup (w.figurniy, w.kamen)
		SHEET_OF_PAPER.value: return T00_NounConstPhrase.new ().setup (w.stranitsa, " из книги")
		STONE_BOX.value: return T00_AdjNounPhrase.new ().setup (w.kamenniy, w.shkatulka)
		HOUSE_KEY.value: return T00_NounConstPhrase.new ().setup (w.klyuch, " от дома")
	
	printerr ("Unknown item type.")
	return null


static func get_description_uninspected_short (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_NounPhrase.new ().setup (w.predmet)
		SMALL_KEY.value: return T00_NounPhrase.new ().setup (w.klyuchik)
		SHAPED_STONE.value: return T00_NounPhrase.new ().setup (w.kamen)
		SHEET_OF_PAPER.value: return T00_NounPhrase.new ().setup (w.listok)
		STONE_BOX.value: return T00_NounPhrase.new ().setup (w.shkatulka)
		HOUSE_KEY.value: return T00_NounPhrase.new ().setup (w.klyuch)
	
	printerr ("Unknown item type.")
	return null


static func get_description_for_document (item_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match item_type.value:
		TOKEN_MARK.value: return T00_AdjNounPhrase.new ().setup (w.ploskiy, w.predmet)
		SMALL_KEY.value: return T00_NounPhrase.new ().setup (w.klyuch)
		SHAPED_STONE.value: return T00_AdjNounPhrase.new ().setup (w.kamenniy, w.predmet)
		SHEET_OF_PAPER.value: return T00_NounConstPhrase.new ().setup (w.list, " бумаги с печатным текстом")
		STONE_BOX.value: return T00_NounConstPhrase.new ().setup (w.shkatulka, " из камня")
		HOUSE_KEY.value: return T00_NounPhrase.new ().setup (w.klyuch)
	
	printerr ("Unknown item type.")
	return null


