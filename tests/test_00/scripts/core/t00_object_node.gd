class_name T00_ObjectNode extends T00_ActionNode
## Узел дерева T00_ActionNode, представляющий объект, над которым совершается действие и/или который содержит в себе другие объекты.

var _name: T00_Phrase


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __name (value: T00_Phrase) -> T00_ObjectNode:
	_name = value
	return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

func get_panel_text () -> String:
	
	return "[Abstract object]" if _name == null else _name.get_text ()
