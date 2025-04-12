class_name S01_ClueContainerItem extends S01_Parametric
## Подкласс Параметрика, хранящий сведения о предмете, лежащем внутри контейнера с зацепкой, передаваемого в Интродакшене.


## Название параметра для типа предмета, лежащего в Контейнере с зацепкой.
static var PNAME__ITEM_TYPE: StringName = &"item_type"


## Является ли зацепкой предмет, лежащий в Контейнере.
var _is_clue: bool


func _init ():
	
	_name = &"clue container item"
