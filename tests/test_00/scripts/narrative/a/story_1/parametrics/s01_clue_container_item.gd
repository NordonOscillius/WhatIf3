class_name S01_ClueContainerItem extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о предмете, лежащем внутри контейнера с зацепкой, передаваемого в Интродакшене.


## Название параметра для типа предмета, лежащего в Контейнере с зацепкой.
static var PNAME__ITEM_TYPE: StringName = &"item_type"
## Название параметра для типа секретного знака, нанесенного на Предмет.
static var PNAME__SECRET_SIGN_TYPE: StringName = &"secret_sign_type"
## Название параметра для цвета предмета.
static var PNAME__COLOR: StringName = &"color"
## Название параметра для геометрической формы предмета.
static var PNAME__GEOMETRIC_SHAPE: StringName = &"geometric_shape"


## Является ли зацепкой предмет, лежащий в Контейнере.
var _is_clue: bool


func _init ():
	
	_name = &"clue container item"


## Возвращает Значение Параметра, хранящее фразу, описывающую предмет на панели действий для случая, когда предмет еще не изучен.
func create_action_panel_name_uninspected () -> S01_PhraseParamValue:
	
	return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, S01_ItemType.get_description_uninspected_for_panel (get_item_type ()))
	#return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, S01_ItemType.get_description_medium (get_item_type ()))


## Возвращает Значение Параметра, хранящее фразу, описывающую предмет на панели действий для случая, когда предмет уже изучен.
func create_action_panel_name_inspected () -> S01_PhraseParamValue:
	
	return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, S01_ItemType.get_description_inspected_for_panel (get_item_type ()))


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_item_type () -> S01_StringParamValue:
	return get_param (PNAME__ITEM_TYPE)

func set_item_type (param_value: S01_StringParamValue):
	set_param (PNAME__ITEM_TYPE, param_value)

func get_heaviness_assessment () -> S01_StringParamValue:
	return S01_ItemType.get_heaviness_assessment (get_item_type ())

func get_secret_sign_type () -> S01_StringParamValue:
	return get_param (PNAME__SECRET_SIGN_TYPE)

func set_secret_sign_type (param_value: S01_StringParamValue):
	set_param (PNAME__SECRET_SIGN_TYPE, param_value)

func get_color () -> S01_StringParamValue:
	return get_param (PNAME__COLOR)

func set_color (param_value: S01_StringParamValue):
	set_param (PNAME__COLOR, param_value)

func get_geometric_shape () -> S01_StringParamValue:
	return get_param (PNAME__GEOMETRIC_SHAPE)

func set_geometric_shape (param_value: S01_StringParamValue):
	set_param (PNAME__GEOMETRIC_SHAPE, param_value)
