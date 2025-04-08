class_name T00_Location extends RefCounted
## Класс локации. Локация содержит объекты; объекты, в свою очередь, могут (потенциально) также содержать в себе другие объекты.
## Над объектами можно производить действия, но над Локацией - нельзя. Чтобы разрешить герою, находящемуся в локации "Кабинет", осмотреть кабинет, следует добавить в эту локацию одноименный объект "Кабинет", над которым уже можно будет производить действие.


## Уникальное имя локации.
var _name: String
var _objects: Array[T00_Object] = []
## Объекты, которые необходимо отложенно добавить вне цикла. Формат - {object : true}.
var _def_added_objects: Dictionary = {}
## Объекты, которые необходимо отложенно удалить вне цикла. Формат - {object : true}.
var _def_removed_objects: Dictionary = {}

## Мир, в котором находится локация.
var _world: T00_World


func connect_to_world (world: T00_World):
	
	assert (!_world)
	_world = world


func disconnect_from_world ():
	
	_world = null


func add_object (object: T00_Object) -> T00_Location:
	
	if object._location:
		printerr ("Object is added to some location, remove it first.")
		return
	
	object.connect_to_location (self)
	_objects.push_back (object)
	return self


func remove_object_at (index: int):
	
	assert (index >= 0 && index < _objects.size ())
	_objects.remove_at (index)


func remove_object (object: T00_Object):
	
	var index: int = _objects.find (object)
	assert (index >= 0)
	_objects.remove_at (index)


func get_object_at (index: int) -> T00_Object:
	
	return _objects[index]


## Возвращает первый попавшийся объект с именем name или null, если не найдено ни одного такого объекта.
func get_object_by_name (name: String) -> T00_Object:
	
	var i: int = _objects.size ()
	while i:
		i -= 1
		var cur_object: T00_Object = _objects[i]
		if cur_object._name == name:
			return cur_object
	
	return null


func add_object_deferred (object: T00_Object):
	
	if !_def_added_objects.has (object):
		_def_added_objects[object] = true


func remove_object_deferred (object: T00_Object):
	
	if !_def_removed_objects.has (object):
		_def_removed_objects[object] = true


func update ():
	
	# Обновляем все объекты.
	var num_objects: int = _objects.size ()
	var i: int = 0
	while i < num_objects:
		var object: T00_Object = _objects[i]
		object.update ()
		
		i += 1
	
	# Отложенное добавление и удаление объектов.
	
	for def_object in _def_added_objects:
		add_object (def_object)
	
	for def_object in _def_removed_objects:
		remove_object (def_object)
	
	_def_added_objects.clear ()
	_def_removed_objects.clear ()


# ==================================================
# ==================== ACCESSORS ===================
# ==================================================

var world: T00_World:
	
	get: return _world


var name: String:
	
	get: return _name

