class_name S01_Location extends S01_Parametric
## Подкласс Параметрика, хранящий данные о Локации.


# Название параметра для роли этой Локации в истории.
static var PNAME__STORY_ROLE: StringName = &"story_role"
# Название параметра для типа Локации.
static var PNAME__LOCATION_TYPE: StringName = &"location_type"


func _init ():
	
	_name = &"location"
