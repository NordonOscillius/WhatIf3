class_name T00_Action extends T00_ActionNode
## Класс конкретного действия над объектом.
## Объект, над которым можно совершить это действие, - это _parent узла.
## Экземпляр этого класса НЕ ДОЛЖЕН содержать потомков (_children.size () должен быть равен нулю).


static var GREET: StringName = &"greet"
static var INSPECT: StringName = &"inspect"

static var _names_by_type: Dictionary = {
	GREET: "поздороваться",
	INSPECT: "осмотреть"
}

var _type: StringName
var _name: String


func setup (type: StringName) -> T00_Action:
	
	assert (_names_by_type.has (type))
	
	_type = type
	_name = _names_by_type[type]
	
	return self


func get_panel_text () -> String:
	
	return "Abstract action" if !_name else _name
