class_name T00_ActionPanelPurpose extends T00_PhrasePurpose
## Назначение Фразы: получить название объекта, которое будет отображаться на Панели Действий.


## Уровень исследования объекта, для которого нужно получить название.
var _inspection_level: int = 0


func _init ():
	
	_type = T00_PhrasePurposeType.ACTION_PANEL_PURPOSE


func setup (inspection_level: int) -> T00_ActionPanelPurpose:
	
	_inspection_level = inspection_level
	return self


func __inspection_level (value: int) -> T00_ActionPanelPurpose:
	_inspection_level = value
	return self
