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


static func get_choices_for_x_to_hero_relation () -> Array[S01_ParamValue]:
	
	return [FATHER, MOTHER, GRANDFATHER, GRANDMOTHER, BROTHER, SISTER]


## Инвертирует родственную связь param_value, используя пол другого лица. Например, если param_value - отец FATHER, то метод вернет сына SON или дочь DAUGHTER в зависимости от значения gender.
static func invert (param_value: S01_StringParamValue, gender: S01_StringParamValue) -> S01_StringParamValue:
	
	if gender.equals (S01_Gender.UNKNOWN):
		printerr ("Unknown gender.")
		return null
	
	var gender_is_male: bool = gender.equals (S01_Gender.MALE)
	
	match param_value._value:
		FATHER.value: return SON if gender_is_male else DAUGHTER
		MOTHER.value: return SON if gender_is_male else DAUGHTER
		GRANDFATHER.value: return GRANDSON if gender_is_male else GRANDDAUGHTER
		GRANDMOTHER.value: return GRANDSON if gender_is_male else GRANDDAUGHTER
		BROTHER.value: return BROTHER if gender_is_male else SISTER
		SISTER.value: return BROTHER if gender_is_male else SISTER
		SON.value: return FATHER if gender_is_male else MOTHER
		DAUGHTER.value: return FATHER if gender_is_male else MOTHER
		GRANDSON.value: return GRANDFATHER if gender_is_male else GRANDMOTHER
		GRANDDAUGHTER.value: return GRANDFATHER if gender_is_male else GRANDMOTHER
	
	printerr ("Can't invert family relation.")
	return null


static func get_phrase_official (family_relation: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match family_relation.value:
		FATHER.value: return T00_NounPhrase.new ().setup (w.otets)
		MOTHER.value: return T00_NounPhrase.new ().setup (w.mat_)
		GRANDFATHER.value: return T00_NounPhrase.new ().setup (w.ded)
		GRANDMOTHER.value: return T00_NounPhrase.new ().setup (w.babushka)
		BROTHER.value: return T00_NounPhrase.new ().setup (w.brat)
		SISTER.value: return T00_NounPhrase.new ().setup (w.sestra)
		SON.value: return T00_NounPhrase.new ().setup (w.syn)
		DAUGHTER.value: return T00_NounPhrase.new ().setup (w.doch)
		GRANDSON.value: return T00_NounPhrase.new ().setup (w.vnuk)
		GRANDDAUGHTER.value: return T00_NounPhrase.new ().setup (w.vnuchka)
	
	printerr ("Unknown family relation type.")
	return null


## "Дедушка", а не "дед"; "мама" вместо "матери"; "папа" вместо "отца".
static func get_phrase_nick (family_relation: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match family_relation.value:
		FATHER.value: return T00_NounPhrase.new ().setup (w.papa)
		MOTHER.value: return T00_NounPhrase.new ().setup (w.mama)
		GRANDFATHER.value: return T00_NounPhrase.new ().setup (w.dedushka)
		GRANDMOTHER.value: return T00_NounPhrase.new ().setup (w.babushka)
		BROTHER.value: return T00_NounPhrase.new ().setup (w.brat)
		SISTER.value: return T00_NounPhrase.new ().setup (w.sestra)
		SON.value: return T00_NounPhrase.new ().setup (w.syn)
		DAUGHTER.value: return T00_NounPhrase.new ().setup (w.doch)
		GRANDSON.value: return T00_NounPhrase.new ().setup (w.vnuk)
		GRANDDAUGHTER.value: return T00_NounPhrase.new ().setup (w.vnuchka)
	
	printerr ("Unknown family relation type.")
	return null


## Обычно маму, папу, дедушку или бабушку не называют по имени, когда обращаются к ним. Этот метод возвращает true, если к персонажу "можно" обратиться по имени.
static func get_name_availability_for_appeal (family_relation: S01_StringParamValue) -> bool:
	
	match family_relation.value:
		FATHER.value: return false
		MOTHER.value: return false
		GRANDFATHER.value: return false
		GRANDMOTHER.value: return false
		BROTHER.value: return true
		SISTER.value: return true
		SON.value: return true
		DAUGHTER.value: return true
		GRANDSON.value: return true
		GRANDDAUGHTER.value: return true
	
	printerr ("Unknown family relation type.")
	return false
