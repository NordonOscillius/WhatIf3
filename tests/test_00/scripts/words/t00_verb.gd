class_name T00_Verb extends RefCounted


# Past tense.
var _past_plural: String
var _past_masculine: String
var _past_feminine: String
var _past_neuter: String

# Present tense.
var _present_first_single: String
var _present_first_plural: String
var _present_second_single: String
var _present_second_plural: String
var _present_third_single: String
var _present_third_plural: String

# Future tense.
var _future_first_single: String
var _future_first_plural: String
var _future_second_single: String
var _future_second_plural: String
var _future_third_single: String
var _future_third_plural: String


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __past_plural (value: String) -> T00_Verb:
	_past_plural = value
	return self

func __past_masculine (value: String) -> T00_Verb:
	_past_masculine = value
	return self

func __past_feminine (value: String) -> T00_Verb:
	_past_feminine = value
	return self

func __past_neuter (value: String) -> T00_Verb:
	_past_neuter = value
	return self

func __present_first_single (value: String) -> T00_Verb:
	_present_first_single = value
	return self

func __present_first_plural (value: String) -> T00_Verb:
	_present_first_plural = value
	return self

func __present_second_single (value: String) -> T00_Verb:
	_present_second_single = value
	return self

func __present_second_plural (value: String) -> T00_Verb:
	_present_second_plural = value
	return self

func __present_third_single (value: String) -> T00_Verb:
	_present_third_single = value
	return self

func __present_third_plural (value: String) -> T00_Verb:
	_present_third_plural = value
	return self

func __future_first_single (value: String) -> T00_Verb:
	_future_first_single = value
	return self

func __future_first_plural (value: String) -> T00_Verb:
	_future_first_plural = value
	return self

func __future_second_single (value: String) -> T00_Verb:
	_future_second_single = value
	return self

func __future_second_plural (value: String) -> T00_Verb:
	_future_second_plural = value
	return self

func __future_third_single (value: String) -> T00_Verb:
	_future_third_single = value
	return self

func __future_third_plural (value: String) -> T00_Verb:
	_future_third_plural = value
	return self
