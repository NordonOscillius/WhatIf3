class_name S01_Location extends S01_Parametric
## Подкласс Параметрика, хранящий данные о Локации.


# Название параметра для роли этой Локации в истории.
static var PNAME__STORY_ROLE: StringName = &"story_role"
# Название параметра для типа Локации.
static var PNAME__LOCATION_TYPE: StringName = &"location_type"


func _init ():
	
	_name = &"location"


# ==================================================
# ==================== SHORTCUTS ===================
# ==================================================

func get_story_role () -> S01_StringParamValue:
	return get_param (PNAME__STORY_ROLE)

func get_location_type () -> S01_StringParamValue:
	return get_param (PNAME__LOCATION_TYPE)
