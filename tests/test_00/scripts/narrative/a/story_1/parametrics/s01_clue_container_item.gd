class_name S01_ClueContainerItem extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о предмете, лежащем внутри контейнера с зацепкой, передаваемого в Интродакшене.


## Название параметра для типа предмета, лежащего в Контейнере с зацепкой.
static var PNAME__ITEM_TYPE: StringName = &"item_type"
## Название параметра для типа секретного знака, нанесенного на Предмет.
static var PNAME__SECRET_SIGN_TYPE: StringName = &"secret_sign_type"


## Является ли зацепкой предмет, лежащий в Контейнере.
var _is_clue: bool


func _init ():
	
	_name = &"clue container item"


## Возвращает Значение Параметра, хранящее фразу, описывающую предмет на панели действий.
func get_action_panel_name () -> S01_PhraseParamValue:
	
	return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, S01_ItemType.get_description_uninspected_for_panel (get_item_type ()))
	#return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, S01_ItemType.get_description_medium (get_item_type ()))


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_item_type () -> S01_StringParamValue:
	return get_param (PNAME__ITEM_TYPE)

func get_heaviness_assessment () -> S01_StringParamValue:
	return S01_ItemType.get_heaviness_assessment (get_item_type ())

func get_secret_sign_type () -> S01_StringParamValue:
	return get_param (PNAME__SECRET_SIGN_TYPE)

