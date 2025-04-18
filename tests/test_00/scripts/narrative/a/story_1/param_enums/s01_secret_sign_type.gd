class_name S01_SecretSignType extends S01_ParamEnum
## Перечислитель Значений Параметров категории "Тип секретного символа".


## Перечеркнутая спираль.
static var SPIRAL: S01_StringParamValue = create_param_value (&"spiral")
## Глаз: четыре ресницы сверху, три - снизу.
static var EYE: S01_StringParamValue = create_param_value (&"eye")
## "Невозможный" игральный кубик: двойка, тройка и пятерка.
static var DICE: S01_StringParamValue = create_param_value (&"dice")


## Создает значение параметра категории S01_ParamClass.SECRET_SIGN_TYPE.
static func create_param_value (value: StringName) -> S01_StringParamValue:
	
	return S01_StringParamValue.new (S01_ParamClass.SECRET_SIGN_TYPE, value)


static func select_for_clue_item () -> S01_StringParamValue:
	
	return S01_ParamValue.pick_random_string_param_value ([SPIRAL, EYE, DICE])


static func get_description_medium (sign_type: S01_StringParamValue) -> T00_SimplePhrase:
	
	var w: T00_A_Words = T00_A_Globals.words
	
	match sign_type.value:
		SPIRAL.value: return T00_AdjNounPhrase.new ().setup (w.zachyorknutiy, w.spiral)
		EYE.value: return T00_AdjNounPhrase.new ().setup (w.otkrytiy, w.glaz)
		DICE.value: return T00_AdjNounPhrase.new ().setup (w.igralniy, w.kubik)
	
	printerr ("Unknown sign type.")
	return null
