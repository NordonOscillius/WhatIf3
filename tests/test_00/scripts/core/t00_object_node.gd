class_name T00_ObjectNode extends T00_ActionNode
## Узел дерева T00_ActionNode, представляющий объект, над которым совершается действие и/или который содержит в себе другие объекты.

var _name: String

# ОПОМНИСЬ, ТОВАРИЩ. Нода объекта - одноразовая; она не должна хранить подобных состояний. Простого имени было бы достаточно, потому что каждый раз при выборе нового действия состояние мира может измениться, и эту самую ноду придется пересоздавать по новой. Просматривая ноды объектов и действий, ты НЕ изменяешь состояние мира.
# Другое дело, что нода могла бы хранить ссылку на объект ВНУТРИ МИРА, который и хранит устойчивое состояние.

#var _thing: T00_Thing
#var _inspection_level: int = 0


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __name (value: String) -> T00_ObjectNode:
	_name = value
	return self

#func __thing (value: T00_Thing) -> T00_ObjectNode:
	#_thing = value
	#return self
#
#func __inspection_level (value: int) -> T00_ObjectNode:
	#_inspection_level = value
	#return self


# ==================================================
# ===================== COMMON =====================
# ==================================================

func get_panel_text () -> String:
	
	#if !_thing:
		#return "[Abstract object]"
	#
	#var phrase: T00_SimplePhrase = _thing.get_phrase_for (T00_ActionPanelPurpose.new ().setup (_inspection_level))
	#return phrase.get_form_for (T00_NounUsage.create_initial ())
	
	return "[Abstract object]" if _name == null else _name
