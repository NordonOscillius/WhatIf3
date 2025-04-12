class_name S01_FriendshipRelation extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Дружеская связь".


static var STRANGER: S01_StringParamValue = create_param_value (&"stranger")
static var FAMILIAR: S01_StringParamValue = create_param_value (&"familiar")
static var FRIEND: S01_StringParamValue = create_param_value (&"friend")


## Создает значение параметра категории S01_ParamClass.FRIENDSHIP_RELATION.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.FRIENDSHIP_RELATION, value)
