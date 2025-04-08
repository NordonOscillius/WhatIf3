class_name T00_A_Hero extends RefCounted


## Локация, в которой сейчас находится герой.
var _location: T00_Location
var _occupation: T00_A_Occupation


func _init (narrator: T00_A_Narrator):
	
	_occupation = T00_A_Occupation.generate_for_hero (narrator._randomizer)
