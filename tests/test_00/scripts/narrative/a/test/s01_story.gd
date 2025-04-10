class_name S01_Story extends RefCounted

enum FamilyRelation {
	GRANDFATHER,
	GRANDMOTHER,
	FATHER,
	MOTHER,
	BROTHER,
	SISTER
}

enum FriendshipRelation {
	STRANGER,
	FAMILIAR,
	FRIEND
}

enum CommunerState {
	NOT_COMMUNER,
	COMMUNER
}

enum Gender {
	UNKNOWN,
	MALE,
	FEMALE
}

enum Occupation {
	UNKNOWN,
	POLICE_OFFICER,
	INDIFFERENT
}

enum PoliceOfficerRank {
	LEUTENANT,
	MAJOR
}


var _x_to_hero_relation: int
var _x_is_communer_state: int
var _x_gender: int
var _introducer_occupation: int
var _introducer_gender: int
var _introducer_police_rank: int	# имеет смысл только для ветки полицейского

var _police_rank_instance: S01_PoliceRank


func _init ():
	
	_x_gender = Gender.FEMALE
	pass


