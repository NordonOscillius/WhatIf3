class_name S01_Gender extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Пол".


static var UNKNOWN: S01_StringParamValue = create_param_value (&"unknown")
static var MALE: S01_StringParamValue = create_param_value (&"male")
static var FEMALE: S01_StringParamValue = create_param_value (&"female")


## Создает значение параметра категории S01_ParamClass.GENDER.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.GENDER, value)


static func select_random () -> S01_StringParamValue:
	
	return S01_ParamValue.pick_random_string_param_value ([MALE, FEMALE])


## Возвращает пол, соответствующий значению family_relation: женский для дочери, мужской для дедушки.
static func get_for_family_relation (family_relation: S01_StringParamValue) -> S01_StringParamValue:
	
	match family_relation.get_value_variant ():
		S01_FamilyRelation.FATHER.value: return MALE
		S01_FamilyRelation.MOTHER.value: return FEMALE
		S01_FamilyRelation.GRANDFATHER.value: return MALE
		S01_FamilyRelation.GRANDMOTHER.value: return FEMALE
		S01_FamilyRelation.BROTHER.value: return MALE
		S01_FamilyRelation.SISTER.value: return FEMALE
		S01_FamilyRelation.SON.value: return MALE
		S01_FamilyRelation.DAUGHTER.value: return FEMALE
		S01_FamilyRelation.GRANDSON.value: return MALE
		S01_FamilyRelation.GRANDDAUGHTER.value: return FEMALE
	
	printerr ("Unknown family relation.")
	return null


## Возвращает константу класса T00_WordGender, соответствующую полу param_value.value. Если param_value.value == S01_Gender.UNKNOWN, то метод вернет -1.
static func get_word_gender_by_param (param_value: S01_ParamValue) -> int:
	
	var string_param_value: S01_StringParamValue = param_value as S01_StringParamValue
	assert (string_param_value)
	match string_param_value._value:
		S01_Gender.UNKNOWN.value: return -1
		S01_Gender.MALE.value: return T00_WordGender.MASCULINE
		S01_Gender.FEMALE.value: return T00_WordGender.FEMININE
	
	printerr ("Unknown gender value.")
	return -1
