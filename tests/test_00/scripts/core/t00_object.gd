class_name T00_Object extends RefCounted


var _location: T00_Location
var _name: String


func destroy ():
	
	if (_location):
		printerr ("Object is added to some location, remove it first.")
	
	# Do some stuff.
	# ...


func connect_to_location (location: T00_Location):
	
	assert (!_location)
	_location = location


func disconnect_from_location ():
	
	_location = null


func update ():
	
	# Do something.
	# ...
	pass


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var location: T00_Location:
	
	get: return _location


var name: String:
	
	get: return _name
