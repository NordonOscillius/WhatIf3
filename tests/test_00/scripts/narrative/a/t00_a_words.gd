class_name T00_A_Words extends RefCounted
## Коллекция ВСЕХ динамических слов, используемых в игре.

# ==================================================
# ===================== NOUNS ======================
# ==================================================

var avtoslesar: T00_Noun
var brodyaga: T00_Noun
var doctor: T00_Noun
var detectiv: T00_Noun
var fermer: T00_Noun
var leytenant: T00_Noun
var pensioner: T00_Noun
var plotnik: T00_Noun
var prodavets: T00_Noun
var stroitel: T00_Noun
var uborschik: T00_Noun
var uborschitsa: T00_Noun
var uchitel: T00_Noun
var uchitelnitsa: T00_Noun
var vrach: T00_Noun
var yurist: T00_Noun

# Имена (мужские).
var male_name_braian: T00_Noun
var male_name_gregori: T00_Noun
var male_name_deniel: T00_Noun
var male_name_devid: T00_Noun
var male_name_edvin: T00_Noun
var male_name_kevin: T00_Noun
var male_name_kris: T00_Noun
var male_name_lester: T00_Noun
var male_name_metiyu: T00_Noun
var male_name_oliver: T00_Noun
var male_name_stiven: T00_Noun
var male_name_tom: T00_Noun
var male_name_trevis: T00_Noun

# Имена (женские).
var female_name_ayris: T00_Noun
var female_name_amanda: T00_Noun
var female_name_betti: T00_Noun
var female_name_dzheyn: T00_Noun
var female_name_dzhil: T00_Noun
var female_name_gven: T00_Noun
var female_name_greys: T00_Noun
var female_name_kristina: T00_Noun
var female_name_monika: T00_Noun
var female_name_patritsiya: T00_Noun
var female_name_samanta: T00_Noun
var female_name_veronika: T00_Noun

# Фамилии.
var last_name_bell: T00_LastName
var last_name_braun: T00_LastName
var last_name_devis: T00_LastName
var last_name_grey: T00_LastName
var last_name_harris: T00_LastName
var last_name_holl: T00_LastName
var last_name_kuper: T00_LastName
var last_name_morris: T00_LastName
var last_name_teilor: T00_LastName
var last_name_uayt: T00_LastName
var last_name_uoker: T00_LastName
var last_name_yang: T00_LastName


# ==================================================
# ================== ADJECTIVES ====================
# ==================================================

var chorniy: T00_Adjective
var malenkiy: T00_Adjective
var prozrachniy: T00_Adjective


# ==================================================
# ===================== VERBS ======================
# ==================================================

var govorit: T00_Verb
var kazatsya: T00_Verb
var nagnutsya: T00_Verb
var pokazat: T00_Verb
var priglashat: T00_Verb
var priglasit: T00_Verb
var sidet: T00_Verb
var stoyat: T00_Verb


# ==================================================
# ==================== HELPERS =====================
# ==================================================

func get_all_male_names () -> Array[T00_Noun]:
	
	return [male_name_braian, male_name_gregori, male_name_deniel, male_name_devid, male_name_edvin, male_name_kevin, male_name_kris, male_name_lester, male_name_metiyu, male_name_oliver, male_name_stiven, male_name_tom, male_name_trevis]


func get_all_female_names () -> Array[T00_Noun]:
	
	return [female_name_ayris, female_name_amanda, female_name_betti, female_name_dzheyn, female_name_dzhil, female_name_gven, female_name_greys, female_name_kristina, female_name_monika, female_name_patritsiya, female_name_samanta, female_name_veronika]


func get_all_last_names () -> Array[T00_LastName]:
	
	return [last_name_bell, last_name_braun, last_name_devis, last_name_grey, last_name_harris, last_name_holl, last_name_kuper, last_name_morris, last_name_teilor, last_name_uayt, last_name_uoker, last_name_yang]


# ==================================================
# ====================== INIT ======================
# ==================================================


func _init ():
	
	init_nouns ()
	init_adjectives ()
	init_verbs ()
	init_male_names ()
	init_female_names ()
	init_last_names ()


func init_nouns ():
	
	avtoslesar = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("автослесарь", "автослесаря", "автослесарю", "автослесаря", "автослесарем", "автослесаре"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("автослесари", "автослесарей", "автослесарям", "автослесарей", "автослесарями", "автослесарях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	brodyaga = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("бродяга", "бродяги", "бродяге", "бродягу", "бродягой", "бродяге"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("бродяги", "бродяг", "бродягам", "бродяг", "бродягами", "бродягах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	doctor = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("доктор", "доктора", "доктору", "доктора", "доктором", "докторе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("доктора", "докторов", "докторам", "докторов", "докторами", "докторах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	detectiv = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("детектив", "детектива", "детективу", "детектива", "детективом", "детективе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("детективы", "детективов", "детективам", "детективов", "детективами", "детективах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	fermer = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("фермер", "фермера", "фермеру", "фермера", "фермером", "фермере"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("фермеры", "фермеров", "фермерам", "фермеров", "фермерами", "фермерах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	leytenant = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("лейтенант", "лейтенанта", "лейтенанту", "лейтенанта", "лейтенантом", "лейтенанте"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("лейтенанты", "лейтенантов", "лейтенантам", "лейтенантов", "лейтенантами", "лейтенантах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	pensioner = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("пенсионер", "пенсионера", "пенсионеру", "пенсионера", "пенсионером", "пенсионере"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("пенсионеры", "пенсионеров", "пенсионерам", "пенсионеров", "пенсионерами", "пенсионерах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	plotnik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("плотник", "плотника", "плотнику", "плотника", "плотником", "плотнике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("плотники", "плотников", "плотникам", "плотников", "плотниками", "плотниках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	prodavets = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("продавец", "продавца", "продавцу", "продавца", "продавцом", "продавце"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("продавцы", "продавцов", "продавцам", "продавцов", "продавцами", "продавцах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	stroitel = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("строитель", "строителя", "строителю", "строителя", "строителем", "строителе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("строители", "строителей", "строителям", "строителей", "строителями", "строителях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	uborschik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("уборщик", "уборщика", "уборщику", "уборщика", "уборщиком", "уборщике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("уборщики", "уборщиков", "уборщикам", "уборщиков", "уборщиками", "уборщиках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	uborschitsa = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("уборщица", "уборщицы", "уборщице", "уборщицу", "уборщицей", "уборщице"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("уборщицы", "уборщиц", "уборщицам", "уборщиц", "уборщицами", "уборщицах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	uchitel = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("учитель", "учителя", "учителю", "учителя", "учителем", "учителе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("учителя", "учителей", "учителям", "учителей", "учителями", "учителях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	uchitelnitsa = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("учительница", "учительницы", "учительнице", "учительницу", "учительницей", "учительнице"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("учительницы", "учительниц", "учительницам", "учительниц", "учительницами", "учительницах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	vrach = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("врач", "врача", "врачу", "врача", "врачом", "враче"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("врачи", "врачей", "врачам", "врачей", "врачами", "врачах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	yurist = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("юрист", "юриста", "юристу", "юриста", "юристом", "юристе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("юристы", "юристов", "юристам", "юристов", "юристами", "юристах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)


func init_adjectives ():
	
	chorniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("черный", "черного", "черному", "черного", "черный", "черным", "черном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("черная", "черной", "черной", "черную", "черную", "черной", "черной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("черное", "черного", "черному", "черное", "черное", "черным", "черном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("черные", "черных", "черным", "черных", "черные", "черными", "черных"))
	)
	malenkiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("маленький", "маленького", "маленькому", "маленького", "маленький", "маленьким", "маленьком"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("маленькая", "маленькой", "маленькой", "маленькую", "маленькую", "маленькой", "маленькой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("маленькое", "маленького", "маленькому", "маленькое", "маленькое", "маленьким", "маленьком"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("маленькие", "маленьких", "маленьким", "маленьких", "маленькие", "маленькими", "маленьких"))
	)
	prozrachniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("прозрачный", "прозрачного", "прозрачному", "прозрачного", "прозрачный", "прозрачным", "прозрачном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("прозрачная", "прозрачной", "прозрачной", "прозрачную", "прозрачную", "прозрачной", "прозрачной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("прозрачное", "прозрачного", "прозрачному", "прозрачное", "прозрачное", "прозрачным", "прозрачном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("прозрачные", "прозрачных", "прозрачным", "прозрачных", "прозрачные", "прозрачными", "прозрачных"))
	)
	
	pass


func init_verbs ():
	
	govorit = T00_Verb.new ().setup (
		"говорить", "говорил", "говорила", "говорило", "говорили",
		"говорю", "говорим", "говоришь", "говорите", "говорит", "говорят",
		"буду говорить", "будем говорить", "будешь говорить", "будете говорить", "будет говорить", "будут говорить"
	)
	kazatsya = T00_Verb.new ().setup (
		"казаться", "казался", "казалась", "казалось", "казались",
		"кажусь", "кажемся", "кажешься", "кажетесь", "кажется", "кажутся",
		"буду казаться", "будем казаться", "будешь казаться", "будете казаться", "будет казаться", "будут казаться"
	)
	nagnutsya = T00_Verb.new ().setup (
		"нагнуться", "нагнулся", "нагнулась", "нагнулось", "нагнулись",
		"нагибаюсь", "нагибаемся", "нагибаешься", "нагибаетесь", "нагибается", "нагибаются",
		"нагнусь", "нагнемся", "нагнешься", "нагнетесь", "нагнется", "нагнутся"
	)
	pokazat = T00_Verb.new ().setup (
		"показать", "показал", "показала", "показало", "показали",
		"показываю", "показываем", "показываешь", "показываете", "показывает", "показывают",
		"покажу", "покажем", "покажешь", "покажете", "покажет", "покажут"
	)
	priglashat = T00_Verb.new ().setup (
		"приглашать", "приглашал", "приглашала", "пригласило", "пригласили",
		"приглашаю", "приглашаем", "приглашаешь", "приглашаете", "приглашает", "приглашают",
		"буду приглашать", "будем приглашать", "будешь приглашать", "будете приглашать", "будет приглашать", "будут приглашать"
	)
	priglasit = T00_Verb.new ().setup (
		"пригласить", "пригласил", "пригласила", "пригласило", "пригласили",
		"приглашаю", "приглашаем", "приглашаешь", "приглашаете", "приглашает", "приглашают",
		"приглашу", "пригласим", "пригласишь", "пригласите", "пригласит", "пригласят"
	)
	sidet = T00_Verb.new ().setup (
		"сидеть", "сидел", "сидела", "сидело", "сидели",
		"сижу", "сидим", "сидишь", "сидите", "сидит", "сидят",
		"буду сидеть", "будем сидеть", "будешь сидеть", "будете сидеть", "будет сидеть", "будут сидеть"
	)
	stoyat = T00_Verb.new ().setup (
		"стоять", "стоял", "стояла", "стояло", "стояли",
		"стою", "стоим", "стоишь", "стоите", "стоит", "стоят",
		"буду стоять", "будем стоять", "будешь стоять", "будете стоять", "будет стоять", "будут стоять"
	)
	
	pass


func init_male_names ():
	
	male_name_braian = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Брайан", "Брайана", "Брайану", "Брайана", "Брайаном", "Брайане"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Брайаны", "Брайанов", "Брайанам", "Брайанов", "Брайанами", "Брайанах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_gregori = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Грегори", "Грегори", "Грегори", "Грегори", "Грегори", "Грегори"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Грегори", "Грегори", "Грегори", "Грегори", "Грегори", "Грегори"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_deniel = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Дэниэл", "Дэниэла", "Дэниэлу", "Дэниэла", "Дэниэлом", "Дэниэле"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Дэниэлы", "Дэниэлов", "Дэниэлам", "Дэниэлов", "Дэниэлами", "Дэниэлах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_devid = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Дэвид", "Дэвида", "Дэвиду", "Дэвида", "Дэвидом", "Дэвиде"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Дэвиды", "Дэвидов", "Дэвидам", "Дэвидов", "Дэвидами", "Дэвидах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_edvin = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Эдвин", "Эдвина", "Эдвину", "Эдвина", "Эдвином", "Эдвине"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Эдвины", "Эдвинов", "Эдвинам", "Эдвинов", "Эдвинами", "Эдвинах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_kevin = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Кевин", "Кевина", "Кевину", "Кевина", "Кевином", "Кевине"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Кевины", "Кевинов", "Кевинам", "Кевинов", "Кевинами", "Кевинах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_kris = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Крис", "Криса", "Крису", "Криса", "Крисом", "Крисе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Крисы", "Крисов", "Крисам", "Крисов", "Крисами", "Крисах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_lester = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Лестер", "Лестера", "Лестеру", "Лестера", "Лестером", "Лестере"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Лестеры", "Лестеров", "Лестерам", "Лестеров", "Лестерами", "Лестерах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_metiyu = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Мэтью", "Мэтью", "Мэтью", "Мэтью", "Мэтью", "Мэтью"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Мэтью", "Мэтью", "Мэтью", "Мэтью", "Мэтью", "Мэтью"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_oliver = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Оливер", "Оливера", "Оливеру", "Оливера", "Оливером", "Оливере"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Оливеры", "Оливеров", "Оливерам", "Оливеров", "Оливерами", "Оливерах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_stiven = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Стивен", "Стивена", "Стивену", "Стивена", "Стивеном", "Стивене"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Стивены", "Стивенов", "Стивенам", "Стивенов", "Стивенами", "Стивенах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_tom = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Том", "Тома", "Тому", "Тома", "Томом", "Томе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Томы", "Томов", "Томам", "Томов", "Томами", "Томах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	male_name_trevis = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Трэвис", "Трэвиса", "Трэвису", "Трэвиса", "Трэвисом", "Трэвисе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Трэвисы", "Трэвисов", "Трэвисам", "Трэвисов", "Трэвисами", "Трэвисах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	
	pass


func init_female_names ():
	
	female_name_ayris = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Айрис", "Айрис", "Айрис", "Айрис", "Айрис", "Айрис"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Айрис", "Айрис", "Айрис", "Айрис", "Айрис", "Айрис"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_amanda = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Аманда", "Аманды", "Аманде", "Аманду", "Амандой", "Аманде"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Аманды", "Аманд", "Амандам", "Аманд", "Амандами", "Амандах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_betti = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Бетти", "Бетти", "Бетти", "Бетти", "Бетти", "Бетти"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Бетти", "Бетти", "Бетти", "Бетти", "Бетти", "Бетти"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_dzheyn = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Джейн", "Джейн", "Джейн", "Джейн", "Джейн", "Джейн"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Джейн", "Джейн", "Джейн", "Джейн", "Джейн", "Джейн"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_dzhil = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Джил", "Джил", "Джил", "Джил", "Джил", "Джил"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Джил", "Джил", "Джил", "Джил", "Джил", "Джил"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_gven = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Гвен", "Гвен", "Гвен", "Гвен", "Гвен", "Гвен"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Гвен", "Гвен", "Гвен", "Гвен", "Гвен", "Гвен"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_greys = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Грейс", "Грейс", "Грейс", "Грейс", "Грейс", "Грейс"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Грейс", "Грейс", "Грейс", "Грейс", "Грейс", "Грейс"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_kristina = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Кристина", "Кристины", "Кристине", "Кристину", "Кристиной", "Кристине"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Кристины", "Кристин", "Кристинам", "Кристин", "Кристинами", "Кристинах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_kristina = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Кристина", "Кристины", "Кристине", "Кристину", "Кристиной", "Кристине"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Кристины", "Кристин", "Кристинам", "Кристин", "Кристинами", "Кристинах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_monika = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Моника", "Моники", "Монике", "Монику", "Моникой", "Монике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Моники", "Моник", "Моникам", "Моник", "Мониками", "Мониках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_patritsiya = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Патриция", "Патриции", "Патриции", "Патрицию", "Патрицией", "Патриции"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Патриции", "Патриций", "Патрициям", "Патриций", "Патрициями", "Патрициях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_samanta = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Саманта", "Саманты", "Саманте", "Саманту", "Самантой", "Саманте"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Саманты", "Самант", "Самантам", "Самант", "Самантами", "Самантах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	female_name_veronika = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("Вероника", "Вероники", "Веронике", "Веронику", "Вероникой", "Веронике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Вероники", "Вероник", "Вероникам", "Вероник", "Верониками", "Верониках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	
	pass


func init_last_names ():
	
	last_name_bell = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Белл", "Белла", "Беллу", "Белла", "Беллом", "Белле"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Белл", "Белл", "Белл", "Белл", "Белл", "Белл"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Беллы", "Беллов", "Беллам", "Беллов", "Беллами", "Беллах"))
	)
	last_name_braun = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Браун", "Брауна", "Брауну", "Брауна", "Брауном", "Брауне"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Браун", "Браун", "Браун", "Браун", "Браун", "Браун"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Брауны", "Браунов", "Браунам", "Браунов", "Браунами", "Браунах"))
	)
	last_name_devis = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Дэвис", "Дэвиса", "Дэвису", "Дэвиса", "Дэвисом", "Дэвисе"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Дэвис", "Дэвис", "Дэвис", "Дэвис", "Дэвис", "Дэвис"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Дэвисы", "Дэвисов", "Дэвисам", "Дэвисов", "Дэвисами", "Дэвисах"))
	)
	last_name_grey = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Грей", "Грея", "Грею", "Грея", "Греем", "Грее"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Грей", "Грей", "Грей", "Грей", "Грей", "Грей"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Греи", "Греев", "Греям", "Греев", "Греями", "Греях"))
	)
	last_name_harris = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Харрис", "Харриса", "Харрису", "Харриса", "Харрисом", "Харрисе"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Харрис", "Харрис", "Харрис", "Харрис", "Харрис", "Харрис"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Харрисы", "Харрисов", "Харрисам", "Харрисов", "Харрисами", "Харрисах"))
	)
	last_name_holl = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Холл", "Холла", "Холлу", "Холла", "Холлом", "Холле"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Холл", "Холл", "Холл", "Холл", "Холл", "Холл"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Холлы", "Холлов", "Холлам", "Холлов", "Холлами", "Холлах"))
	)
	last_name_kuper = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Купер", "Купера", "Куперу", "Купера", "Купером", "Купере"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Купер", "Купер", "Купер", "Купер", "Купер", "Купер"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Куперы", "Куперов", "Куперам", "Куперов", "Куперами", "Куперах"))
	)
	last_name_morris = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Моррис", "Морриса", "Моррису", "Морриса", "Моррисом", "Моррисе"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Моррис", "Моррис", "Моррис", "Моррис", "Моррис", "Моррис"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Моррисы", "Моррисов", "Моррисам", "Моррисов", "Моррисами", "Моррисах"))
	)
	last_name_teilor = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Тейлор", "Тейлора", "Тейлору", "Тейлора", "Тейлором", "Тейлоре"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Тейлор", "Тейлор", "Тейлор", "Тейлор", "Тейлор", "Тейлор"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Тейлоры", "Тейлоров", "Тейлорам", "Тейлоров", "Тейлорами", "Тейлорах"))
	)
	last_name_uayt = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Уайт", "Уайта", "Уайту", "Уайта", "Уайтом", "Уайте"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Уайт", "Уайт", "Уайт", "Уайт", "Уайт", "Уайт"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Уайты", "Уайтов", "Уайтам", "Уайтов", "Уайтами", "Уайтах"))
	)
	last_name_uoker = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Уокер", "Уокера", "Уокеру", "Уокера", "Уокером", "Уокере"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Уокер", "Уокер", "Уокер", "Уокер", "Уокер", "Уокер"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Уокеры", "Уокеров", "Уокерам", "Уокеров", "Уокерами", "Уокерах"))
	)
	last_name_yang = T00_Utils.fluent (
		T00_LastName.new ()
		.__masculine_single_forms (T00_NounCaseForms.new ().setup ("Янг", "Янга", "Янгу", "Янга", "Янгом", "Янге"))
		.__feminine_single_forms (T00_NounCaseForms.new ().setup ("Янг", "Янг", "Янг", "Янг", "Янг", "Янг"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("Янги", "Янгов", "Янгам", "Янгов", "Янгами", "Янгах"))
	)
	
	pass


