class_name S01_ParamClass extends RefCounted
## Перечислитель названий для типов (категорий) параметров, таких как семейное родство (FAMILY_RELATION) или возраст (AGE). Константы этого класса используются в наследниках класса S01_ParamValue и классах-перечислителях, хранящих конкретные значения параметров одной группы (S01_FamilyRelation).


## StringName для категории "Родственные связи".
static var FAMILY_RELATION: StringName = &"family_relation"
## StringName для категории "Дружеские связи".
static var FRIENDSHIP_RELATION: StringName = &"friendship_relation"
## StringName для категории "Роль персонажа в истории".
static var CHAR_STORY_ROLE: StringName = &"char_story_role"
## StringName для категории "Тип места Интродакшена".
static var INTRODUCTION_PLACE_TYPE: StringName = &"introduction_place_type"
## StringName для категории "Тип Интродьюсера".
static var INTRODUCER_TYPE: StringName = &"introducer_type"
## StringName для категории "Роль Локации в истории".
static var LOCATION_STORY_ROLE: StringName = &"location_story_role"
## StringName для категории "Тип Локации".
static var LOCATION_TYPE: StringName = &"location_type"
## StringName для категории "Род деятельности персонажа".
static var OCCUPATION: StringName = &"occupation"
## StringName для категории "Тип контейнера с зацепкой".
static var CLUE_CONTAINER_TYPE: StringName = &"clue_container_type"
## StringName для категории "Тип предмета".
static var ITEM_TYPE: StringName = &"item_type"
## StringName для категории "Место проживания".
static var LIVING_PLACE: StringName = &"living_place"
## StringName для категории "Пол".
static var GENDER: StringName = &"gender"

# Phrase Param Values.

## StringName для категории "Название объекта, отображаемое на панели действий" (PhraseParamValue).
static var ACTION_PANEL_NAME: StringName = &"action_panel_name"

# Int Param Values.

## StringName для категории "Возраст" (IntParamValue).
static var AGE: StringName = &"age"
