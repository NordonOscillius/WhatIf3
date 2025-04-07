class_name T00_NamePart extends T00_Noun
## Часть имени персонажа: собственно имя, фамилия, отчество, форма уменьшительно-ласкательного и т.д.


func _init ():
	
	# Всегда означает одушевленное лицо.
	_animacy = T00_WordAnimacy.ANIMATE
