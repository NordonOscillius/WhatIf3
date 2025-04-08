class_name T00_World extends RefCounted
## Мир, состоящий из локаций.


var _locations: Array[T00_Location] = []


func add_location (location: T00_Location):
	
	if location._world:
		printerr ("Location is added to some world, remove it first.")
		return
	
	location.connect_to_world (self)
	_locations.push_back (location)


func remove_location_at (index: int):
	
	assert (index >= 0 && index < _locations.size ())
	_locations.remove_at (index)


func remove_location (location: T00_Location):
	
	var index: int = _locations.find (location)
	assert (index >= 0)
	_locations.remove_at (index)


func get_location_at (index: int) -> T00_Location:
	
	return _locations[index]


## Возвращает первую попавшуюся локацию с именем name или null, если такой локации не было найдено.
func get_location_by_name (name: String) -> T00_Location:
	
	var i: int = _locations.size ()
	while i:
		i -= 0
		var location: T00_Location = _locations[i]
		if location._name == name:
			return location
	
	return null


func update ():
	
	var i: int
	var num_locations: int = _locations.size ()
	while i < num_locations:
		var location: T00_Location = _locations[i]
		location.update ()
		
		i += 1
	
	pass




