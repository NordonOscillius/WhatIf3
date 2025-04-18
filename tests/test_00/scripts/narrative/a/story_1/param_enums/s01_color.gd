class_name S01_Color extends S01_ParamEnum


## Черный.
static var BLACK: S01_StringParamValue = create_param_value (&"black")
## Белый.
static var WHITE: S01_StringParamValue = create_param_value (&"white")
## Темно-красный.
static var DARK_RED: S01_StringParamValue = create_param_value (&"dark_red")
## Светло-серый.
static var LIGHT_GRAY: S01_StringParamValue = create_param_value (&"light_gray")
## Темно-серый.
static var DARK_GRAY: S01_StringParamValue = create_param_value (&"dark_gray")
## Бледно-синий.
static var PALE_BLUE: S01_StringParamValue = create_param_value (&"pale_blue")
## Бледно-зеленый.
static var PALE_GREEN: S01_StringParamValue = create_param_value (&"pale_green")
## Бледно-оранжевый.
static var PALE_ORANGE: S01_StringParamValue = create_param_value (&"pale_orange")
## Бледно-желтый.
static var PALE_YELLOW: S01_StringParamValue = create_param_value (&"pale_yellow")


## Создает значение параметра категории S01_ParamClass.COLOR.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.COLOR, value)


static func select_for_item (item: S01_ClueContainerItem) -> S01_StringParamValue:
	
	match item.get_item_type ().value:
		S01_ItemType.TOKEN_MARK.value: return S01_ParamValue.pick_random_string_param_value ([BLACK])
		S01_ItemType.SMALL_KEY.value: return S01_ParamValue.pick_random_string_param_value ([LIGHT_GRAY, DARK_GRAY])
		S01_ItemType.SHAPED_STONE.value: return S01_ParamValue.pick_random_string_param_value ([DARK_RED, LIGHT_GRAY, DARK_GRAY, PALE_BLUE, PALE_GREEN])
		S01_ItemType.SHEET_OF_PAPER.value: return S01_ParamValue.pick_random_string_param_value ([WHITE, LIGHT_GRAY, PALE_YELLOW])
		S01_ItemType.STONE_BOX.value: return S01_ParamValue.pick_random_string_param_value ([LIGHT_GRAY, DARK_GRAY, PALE_BLUE, PALE_GREEN, PALE_ORANGE])
		S01_ItemType.HOUSE_KEY.value: return S01_ParamValue.pick_random_string_param_value ([PALE_ORANGE, PALE_YELLOW, LIGHT_GRAY])
	
	printerr ("Unknown item type.")
	return null


## Создает и возвращает Простую Фразу, хранящую название цвета. Фраза не содержит субъекта (это T00_AdjPhrase или T00_ConstAdjPhrase) и по умолчанию относится к неявному неодушевленному существительному мужского рода (по умолчанию фраза будет возвращать, например, строку "зеленый" при запросе get_form_for() для винительного падежа). Если необходимо отнести прилагательное в составе фразы к существительному другого рода или одушевленности, следует передать соответствующие значения параметров gender и animacy.
static func get_phrase_for_color (color: S01_StringParamValue, gender: int = T00_WordGender.MASCULINE, animacy: int = T00_WordAnimacy.INANIMATE) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match color.value:
		BLACK.value: return T00_AdjPhrase.new ().setup (w.chorniy, gender, animacy)
		WHITE.value: return T00_AdjPhrase.new ().setup (w.belyi, gender, animacy)
		DARK_RED.value: return T00_ConstAdjPhrase.new ().setup ("темно-", w.krasniy, gender, animacy)
		LIGHT_GRAY.value: return T00_ConstAdjPhrase.new ().setup ("светло-", w.seriy, gender, animacy)
		DARK_GRAY.value: return T00_ConstAdjPhrase.new ().setup ("темно-", w.seriy, gender, animacy)
		PALE_BLUE.value: return T00_ConstAdjPhrase.new ().setup ("бледно-", w.siniy, gender, animacy)
		PALE_GREEN.value: return T00_ConstAdjPhrase.new ().setup ("бледно-", w.zelyoniy, gender, animacy)
		PALE_ORANGE.value: return T00_ConstAdjPhrase.new ().setup ("бледно-", w.oranzheniy, gender, animacy)
		PALE_YELLOW.value: return T00_ConstAdjPhrase.new ().setup ("бледно-", w.zhyoltiy, gender, animacy)
	
	printerr ("Unknown color.")
	return null
