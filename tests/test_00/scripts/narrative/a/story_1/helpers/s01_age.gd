class_name S01_Age extends RefCounted
## Класс-помощник для подбора значений для S01_IntParamValue категории "Возраст".


static func select_random (from: int, to: int) -> S01_IntParamValue:
	
	var value: int = T00_A_Globals.randomizer.randi_range (from, to)
	return S01_IntParamValue.new (S01_ParamClass.AGE, value)


## Подбирает возраст Интродьюсера в зависимости от типа его роли в сюжете.
static func select_for_introducer () -> S01_IntParamValue:
	
	var story: S01_Story = T00_A_Globals.story
	var introducer_type: S01_StringParamValue = story.get_introducer_type ()
	match introducer_type.value:
		S01_IntroducerType.POLICE_OFFICER.value:
			return select_random (22, 55)
		S01_IntroducerType.COURIER.value:
			return select_random (18, 45)
		S01_IntroducerType.STRANGER.value:
			return select_random (18, 80)
	
	printerr ("Unknown introducer type.")
	return null


## Подбирает возраст для Икса и героя. Первый элемент возвращенного массива - для Икса, второй - для героя.
static func select_for_x_and_hero () -> Array[S01_IntParamValue]:
	
	var x_age: S01_IntParamValue
	var hero_age: S01_IntParamValue
	var story: S01_Story = T00_A_Globals.story
	var x_to_hero_relation: S01_StringParamValue = story.get_x_to_hero_relation ()
	if x_to_hero_relation.value == S01_FriendshipRelation.FRIEND.value:
		x_age = select_random (22, 45)
		hero_age = select_random (x_age.value - 7, x_age.value + 7)
	elif x_to_hero_relation.value == S01_FamilyRelation.BROTHER.value || x_to_hero_relation.value == S01_FamilyRelation.SISTER.value:
		x_age = select_random (22, 45)
		hero_age = select_random (x_age.value - 3, x_age.value + 3)
		if x_age.value == hero_age.value:
			hero_age.value = x_age.value - 1 if T00_A_Globals.randomizer.randf () < .5 else x_age.value + 1
	elif x_to_hero_relation.value == S01_FamilyRelation.FATHER.value || x_to_hero_relation.value == S01_FamilyRelation.MOTHER.value:
		hero_age = select_random (20, 45)
		x_age = S01_IntParamValue.new (hero_age.param_class, hero_age.value + get_random_childbearing_age ())
	elif x_to_hero_relation.value == S01_FamilyRelation.GRANDFATHER.value || x_to_hero_relation.value == S01_FamilyRelation.GRANDMOTHER.value:
		x_age = select_random (50, 80)
		hero_age = S01_IntParamValue.new (x_age.param_class, x_age.value - get_random_childbearing_age () - get_random_childbearing_age ())
		if hero_age.value < 20:
			hero_age.value = 20
	else:
		printerr ("Unknown introducer type.")
		return []
	
	return [x_age, hero_age]


## Случайный возраст, в котором персонаж мог обзавестись потомством.
static func get_random_childbearing_age () -> int:
	
	return T00_A_Globals.randomizer.randi_range (18, 28)
