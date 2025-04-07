class_name T00_FullName extends RefCounted
## Полное имя персонажа: имя и фамилия.


var _first_name: T00_NamePart
var _last_name: T00_NamePart


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __first_name (value: T00_NamePart) -> T00_FullName:
	_first_name = value
	return self

func __last_name (value: T00_NamePart) -> T00_FullName:
	_last_name = value
	return self
