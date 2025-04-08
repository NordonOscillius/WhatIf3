class_name T00_Phrase extends RefCounted
## Класс фразы, состоящей из динамических слов и/или статических строк.


var _parts: Array[T00_PhrasePart] = []


func add_part (part: T00_PhrasePart) -> T00_Phrase:
	
	_parts.push_back (part)
	return self


func get_text () -> String:
	
	var result: String = ""
	var num_parts: int = _parts.size ()
	var i: int = 0
	while i < num_parts:
		result += _parts[i].get_text ()
		result += " "
		i += 1
	
	return result.substr (0, result.length () - 1)
