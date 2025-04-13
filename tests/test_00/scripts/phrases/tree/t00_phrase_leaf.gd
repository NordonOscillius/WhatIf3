class_name T00_PhraseLeaf extends T00_PhrasePart
## Лист Дерева Фразы. Может содержать только член предложения - сочетание лексемы с ее ролью внутри фразы.


var _constituent: T00_Constituent


func destroy ():
	
	_constituent = null


func __constituent (value: T00_Constituent) -> T00_PhraseLeaf:
	_constituent = value
	return self
