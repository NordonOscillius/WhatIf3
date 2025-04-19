class_name T00_Globals extends RefCounted


static var LABEL_FONT_FACE_USUAL: FontFile = preload ("res://tests/test_00/res/fonts/montserrat/Montserrat-Regular.ttf")
static var LABEL_FONT_FACE_THICK: FontFile = preload ("res://tests/test_00/res/fonts/montserrat/Montserrat-Medium.ttf")
static var LABEL_FONT_FACE_THIN: FontFile = preload ("res://tests/test_00/res/fonts/montserrat/Montserrat-Light.ttf")
static var LABEL_FONT_FACE_BOLD: FontFile = preload ("res://tests/test_00/res/fonts/montserrat/Montserrat-SemiBold.ttf")


## Экземпляр игры.
static var game: T00_Game
## Проигрыватель истории. Устанавливается игрой при инициализации.
static var story_player: T00_StoryPlayer
## Экземпляр мира.
static var world: T00_World
