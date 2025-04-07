class_name T00_Beat extends RefCounted
## Бит истории. Содержит строку, описывающую кусочек истории (ее бит), и дерево действий, которое герой может совершить. Если дерево действий пусто или равно null, то плеер истории T00_StoryPlayer не предлагает игроку никаких действий и только ждет от него клика мышью, чтобы перейти к следующему биту.


## Строка, описывающая бит истории.
var _story_text: String
## Дерево действий, доступных игроку, или null, бит можно промотать дальше щелчком мыши.
var _action_tree: T00_ActionNode
## Является ли строка ремаркой. Ремарки служат подсказками для игрока и не записываются в основной сюжет книги _book (но присутствуют в самой книге).
var _is_remark: bool = false


# ==================================================
# ================== INITIALIZERS ==================
# ==================================================

func __story_text (value: String) -> T00_Beat:
	_story_text = value
	return self

func __action_tree (value: T00_ActionNode) -> T00_Beat:
	_action_tree = value
	return self

func __is_remark (value: bool) -> T00_Beat:
	_is_remark = value
	return self
