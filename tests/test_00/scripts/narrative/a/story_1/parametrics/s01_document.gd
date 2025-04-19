class_name S01_Document extends S01_Parametric


var _is_signed: bool = false


func _init ():
	
	_name = &"document"


## Возвращает Значение Параметра, хранящее фразу, описывающую документ на панели действий.
func create_action_panel_name () -> S01_PhraseParamValue:
	
	var phrase: T00_NounPhrase = T00_NounPhrase.new ().setup (T00_A_Globals.words.document)
	return S01_PhraseParamValue.new (S01_ParamClass.ACTION_PANEL_NAME, phrase)
