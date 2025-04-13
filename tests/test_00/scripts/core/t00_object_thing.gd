class_name T00_ObjectThing extends T00_Thing


## Массив, в котором хранятся Фразы, соответствующие разным степеням исследованности объекта. Фраза с нулевым индексом соответствует минимальному уровню исследованности.
var _phrases_by_inspections: Array[T00_SimplePhrase] = []


func get_phrase_for (purpose: T00_PhrasePurpose) -> T00_SimplePhrase:
	
	var action_panel_purpose: T00_ActionPanelPurpose = purpose as T00_ActionPanelPurpose
	if !action_panel_purpose:
		printerr ("The 'purpose' parameter should be a T00_ActionPanelPurpose instance.")
		return null
	
	var level: int = action_panel_purpose._inspection_level
	var max_level: int = _phrases_by_inspections.size () - 1
	if level > max_level:
		level = max_level
	
	return _phrases_by_inspections[level]
