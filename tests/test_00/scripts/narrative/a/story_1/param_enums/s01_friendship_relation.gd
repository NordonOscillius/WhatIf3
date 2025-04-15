class_name S01_FriendshipRelation extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Дружеская связь".


static var STRANGER: S01_StringParamValue = create_param_value (&"stranger")
static var FAMILIAR: S01_StringParamValue = create_param_value (&"familiar")
static var FRIEND: S01_StringParamValue = create_param_value (&"friend")


## Создает значение параметра категории S01_ParamClass.FRIENDSHIP_RELATION.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.FRIENDSHIP_RELATION, value)


static func get_phrase (friendship_relation: S01_StringParamValue, gender: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	var is_male: bool = gender.value == S01_Gender.MALE.value
	
	match friendship_relation.value:
		S01_FriendshipRelation.STRANGER.value: return T00_NounPhrase.new ().setup (w.neznakomets if is_male else w.neznakomka)
		S01_FriendshipRelation.FAMILIAR.value: return T00_AdjPhrase.new ().setup (w.znakomyi, T00_WordGender.MASCULINE if is_male else T00_WordGender.FEMININE, T00_WordAnimacy.ANIMATE)
		S01_FriendshipRelation.FRIEND.value: return T00_NounPhrase.new ().setup (w.drug if is_male else w.podruga)
	
	printerr ("Unknown friendship relation type.")
	return null
