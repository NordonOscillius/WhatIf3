class_name S01_GeometricShape extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Геометрическая форма".


## Круг.
static var CIRCLE: S01_StringParamValue = create_param_value (&"circle")
## Треугольник.
static var TRIANGLE: S01_StringParamValue = create_param_value (&"triangle")
## Квадрат.
static var SQUARE: S01_StringParamValue = create_param_value (&"square")
## Шестиугольник.
static var HEXAGON: S01_StringParamValue = create_param_value (&"hexagon")


## Создает значение параметра категории S01_ParamClass.GEOMETRIC_SHAPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.GEOMETRIC_SHAPE, value)


static func select_for_clue_item (item: S01_ClueContainerItem) -> S01_StringParamValue:
	
	match item.get_item_type ().value:
		S01_ItemType.TOKEN_MARK.value: return S01_ParamValue.pick_random_string_param_value ([CIRCLE, SQUARE, HEXAGON])
		S01_ItemType.SMALL_KEY.value: return null
		S01_ItemType.SHAPED_STONE.value: return S01_ParamValue.pick_random_string_param_value ([CIRCLE, TRIANGLE, SQUARE, HEXAGON])
		S01_ItemType.SHEET_OF_PAPER.value: return null
		S01_ItemType.STONE_BOX.value: return S01_ParamValue.pick_random_string_param_value ([CIRCLE, SQUARE, HEXAGON])
	
	printerr ("Unknown item type.")
	return null


static func get_noun_for_shape (shape_param: S01_StringParamValue) -> T00_Noun:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match shape_param.value:
		CIRCLE.value: return w.krug
		TRIANGLE.value: return w.treugolnik
		SQUARE.value: return w.kvadrat
		HEXAGON.value: return w.shestiugolnik
	
	printerr ("Unknown geometric shape type.")
	return null


static func get_adjectve_for_shape (shape_param: S01_StringParamValue) -> T00_Adjective:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match shape_param.value:
		CIRCLE.value: return w.krugliy
		TRIANGLE.value: return w.treugolniy
		SQUARE.value: return w.kvadratniy
		HEXAGON.value: return w.shestiugolniy
	
	printerr ("Unknown geometric shape type.")
	return null
