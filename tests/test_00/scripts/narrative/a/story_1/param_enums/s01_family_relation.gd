class_name S01_FamilyRelation extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Родственная связь".


static var FATHER: S01_StringParamValue = create_param_value (&"father")
static var MOTHER: S01_StringParamValue = create_param_value (&"mother")
static var GRANDFATHER: S01_StringParamValue = create_param_value (&"grandfather")
static var GRANDMOTHER: S01_StringParamValue = create_param_value (&"grandmother")
static var BROTHER: S01_StringParamValue = create_param_value (&"brother")
static var SISTER: S01_StringParamValue = create_param_value (&"sister")
static var SON: S01_StringParamValue = create_param_value (&"son")
static var DAUGHTER: S01_StringParamValue = create_param_value (&"daughter")
static var GRANDSON: S01_StringParamValue = create_param_value (&"grandson")
static var GRANDDAUGHTER: S01_StringParamValue = create_param_value (&"granddaughter")


## Создает значение параметра категории S01_ParamClass.FAMILY_RELATION.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.FAMILY_RELATION, value)
