class_name S01_Person extends S01_Parametric
## Подкласс Параметрика, хранящий данные о человеке.

# Типы параметров, которые могут хранится в экземпляре Личности.

# Название параметра для роли Человека в истории.
static var PNAME__STORY_ROLE: StringName = &"story_role"
# Название параметра для рода деятельности Человека.
static var PNAME__OCCUPATION: StringName = &"occupation"


func _init ():
	
	_name = &"person"
