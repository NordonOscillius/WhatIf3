class_name T00_A_Words extends RefCounted
## Коллекция ВСЕХ динамических слов, используемых в игре.

# ==================================================
# ===================== NOUNS ======================
# ==================================================

var avtoslesar: T00_Noun
var babochka: T00_Noun
var babushka: T00_Noun
var brat: T00_Noun
var brodyaga: T00_Noun
var ded: T00_Noun
var dedushka: T00_Noun
var detectiv: T00_Noun
var doch: T00_Noun
var doctor: T00_Noun
var document: T00_Noun
var drug: T00_Noun
var fermer: T00_Noun
var glaz: T00_Noun
var kamen: T00_Noun
var klyuch: T00_Noun
var klyuchik: T00_Noun
var korobka: T00_Noun
var krug: T00_Noun
var kubik: T00_Noun
var kvadrat: T00_Noun
var leytenant: T00_Noun
var list: T00_Noun
var listok: T00_Noun
var mama: T00_Noun
var mat_: T00_Noun
var neznakomets: T00_Noun
var neznakomka: T00_Noun
var otets: T00_Noun
var paket: T00_Noun
var papa: T00_Noun
var pensioner: T00_Noun
var plotnik: T00_Noun
var podruga: T00_Noun
var predmet: T00_Noun
var prodavets: T00_Noun
var sestra: T00_Noun
var shestiugolnik: T00_Noun
var shkatulka: T00_Noun
var spiral: T00_Noun
var stranitsa: T00_Noun
var stroitel: T00_Noun
var svyortok: T00_Noun
var syn: T00_Noun
var treugolnik: T00_Noun
var uborschik: T00_Noun
var uborschitsa: T00_Noun
var uchitel: T00_Noun
var uchitelnitsa: T00_Noun
var vnuchka: T00_Noun
var vnuk: T00_Noun
var vrach: T00_Noun
var yurist: T00_Noun
var zheton: T00_Noun

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

var belyi: T00_Adjective
var bolshoy: T00_Adjective
var bumazhnyi: T00_Adjective
var chorniy: T00_Adjective
var figurniy: T00_Adjective
var igralniy: T00_Adjective
var kamenniy: T00_Adjective
var krasniy: T00_Adjective
var krugliy: T00_Adjective
var kvadratniy: T00_Adjective
var malenkiy: T00_Adjective
var nebolshoy: T00_Adjective
var oranzheviy: T00_Adjective
var otkrytiy: T00_Adjective
var ploskiy: T00_Adjective
var prodolgovatiy: T00_Adjective
var prozrachniy: T00_Adjective
var seriy: T00_Adjective
var siniy: T00_Adjective
var shestiugolniy: T00_Adjective
var treugolniy: T00_Adjective
var zachyorknutiy: T00_Adjective
var zelyoniy: T00_Adjective
var zhyoltiy: T00_Adjective
var znakomyi: T00_Adjective


# ==================================================
# ===================== VERBS ======================
# ==================================================

var govorit: T00_Verb
var kazatsya: T00_Verb
var lezhat: T00_Verb
var moch: T00_Verb
var nagnutsya: T00_Verb
var napomnit: T00_Verb
var okazatsya: T00_Verb
var pokazat: T00_Verb
var pokazatsya: T00_Verb
var polozhit: T00_Verb
var ponyat: T00_Verb
var posmotret: T00_Verb
var priglashat: T00_Verb
var priglasit: T00_Verb
var sidet: T00_Verb
var stoyat: T00_Verb
var zavernut: T00_Verb


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
	babochka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("бабочка", "бабочки", "бабочке", "бабочку", "бабочкой", "бабочке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("бабочки", "бабочек", "бабочкам", "бабочек", "бабочками", "бабочках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	babushka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("бабушка", "бабушки", "бабушке", "бабушку", "бабушкой", "бабушке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("бабушки", "бабушек", "бабушкам", "бабушек", "бабушками", "бабушках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	brat = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("брат", "брата", "брату", "брата", "братом", "брате"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("братья", "братьев", "братьям", "братьев", "братьями", "братьях"))
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
	ded = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("дед", "деда", "деду", "деда", "дедом", "деде"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("деды", "дедов", "дедам", "дедов", "дедами", "дедах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	dedushka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("дедушка", "дедушки", "дедушке", "дедушку", "дедушкой", "дедушке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("дедушки", "дедушек", "дедушкам", "дедушек", "дедушками", "дедушках"))
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
	doch = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("дочь", "дочери", "дочери", "дочь", "дочерью", "дочери"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("дочери", "дочерей", "дочерям", "дочерей", "дочерями", "дочерях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	doctor = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("доктор", "доктора", "доктору", "доктора", "доктором", "докторе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("доктора", "докторов", "докторам", "докторов", "докторами", "докторах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	document = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("документ", "документа", "документу", "документ", "документом", "документе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("документы", "документов", "документам", "документы", "документами", "документах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	drug = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("друг", "друга", "другу", "друга", "другом", "друге"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("друзья", "друзей", "друзьям", "друзей", "друзьями", "друзьях"))
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
	glaz = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("глаз", "глаза", "глазу", "глаз", "глазом", "глазе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("глаза", "глаз", "глазам", "глаза", "глазами", "глазах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	kamen = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("камень", "камня", "камню", "камень", "камнем", "камне"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("камни", "камней", "камням", "камни", "камнями", "камнях"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	klyuch = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("ключ", "ключа", "ключу", "ключ", "ключом", "ключе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("ключи", "ключей", "ключам", "ключи", "ключами", "ключах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	klyuchik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("ключик", "ключика", "ключику", "ключик", "ключиком", "ключике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("ключики", "ключиков", "ключикам", "ключики", "ключиками", "ключиках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	korobka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("коробка", "коробки", "коробке", "коробку", "коробкой", "коробке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("коробки", "коробок", "коробкам", "коробки", "коробками", "коробках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	krug = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("круг", "круга", "кругу", "круг", "кругом", "круге"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("круги", "кругов", "кругам", "круги", "кругами", "кругах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	kubik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("кубик", "кубика", "кубику", "кубик", "кубиком", "кубике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("кубики", "кубиков", "кубикам", "кубики", "кубиками", "кубиках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	kvadrat = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("квадрат", "квадрата", "квадрату", "квадрат", "квадратом", "квадрате"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("квадраты", "квадратов", "квадратам", "квадраты", "квадратами", "квадратах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	leytenant = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("лейтенант", "лейтенанта", "лейтенанту", "лейтенанта", "лейтенантом", "лейтенанте"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("лейтенанты", "лейтенантов", "лейтенантам", "лейтенантов", "лейтенантами", "лейтенантах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	list = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("лист", "листа", "листу", "лист", "листом", "листе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("листы", "листов", "листам", "листы", "листами", "листах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	listok = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("листок", "листка", "листку", "листок", "листком", "листке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("листки", "листков", "листкам", "листки", "листками", "листках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	mama = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("мама", "мамы", "маме", "маму", "мамой", "маме"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("мамы", "мам", "мамам", "мам", "мамами", "мамах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	mat_ = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("мать", "матери", "матери", "мать", "матерью", "матери"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("матери", "матерей", "матерям", "матерей", "матерями", "матерях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	neznakomets = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("незнакомец", "незнакомца", "незнакомцу", "незнакомца", "незнакомцем", "незнакомце"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("незнакомцы", "незнакомцев", "незнакомцам", "незнакомцев", "незнакомцами", "незнакомцах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	neznakomka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("незнакомка", "незнакомки", "незнакомке", "незнакомку", "незнакомкой", "незнакомке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("незнакомки", "незнакомок", "незнакомкам", "незнакомок", "незнакомками", "незнакомках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	otets = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("отец", "отца", "отцу", "отца", "отцом", "отце"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("отцы", "отцов", "отцам", "отцов", "отцами", "отцах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	paket = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("пакет", "пакета", "пакету", "пакет", "пакетом", "пакете"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("пакеты", "пакетов", "пакетам", "пакеты", "пакетами", "пакетах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	papa = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("папа", "папы", "папе", "папу", "папой", "папе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("папы", "пап", "папам", "пап", "папами", "папах"))
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
	podruga = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("подруга", "подруги", "подруге", "подругу", "подругой", "подруге"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("подруги", "подруг", "подругам", "подруг", "подругами", "подругах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	predmet = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("предмет", "предмета", "предмету", "предмет", "предметом", "предмете"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("предметы", "предметов", "предметам", "предметы", "предметами", "предметах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	prodavets = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("продавец", "продавца", "продавцу", "продавца", "продавцом", "продавце"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("продавцы", "продавцов", "продавцам", "продавцов", "продавцами", "продавцах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	sestra = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("сестра", "сестры", "сестре", "сестру", "сестрой", "сестре"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("сестры", "сестер", "сестрам", "сестер", "сестрами", "сестрах"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	shestiugolnik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("шестиугольник", "шестиугольника", "шестиугольнику", "шестиугольник", "шестиугольником", "шестиугольнике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("шестиугольники", "шестиугольников", "шестиугольникам", "шестиугольники", "шестиугольниками", "шестиугольниках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	shkatulka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("шкатулка", "шкатулки", "шкатулке", "шкатулку", "шкатулкой", "шкатулке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("шкатулки", "шкатулок", "шкатулкам", "шкатулки", "шкатулками", "шкатулках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	spiral = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("спираль", "спирали", "спирали", "спираль", "спиралью", "спирали"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("спирали", "спиралей", "спиралям", "спирали", "спиралями", "спиралях"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	stranitsa = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("страница", "страницы", "странице", "страницу", "страницей", "странице"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("страницы", "страниц", "страницам", "страницы", "страницами", "страницах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	stroitel = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("строитель", "строителя", "строителю", "строителя", "строителем", "строителе"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("строители", "строителей", "строителям", "строителей", "строителями", "строителях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	svyortok = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("сверток", "свертка", "свертку", "сверток", "свертком", "свертке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("свертки", "свертков", "сверткам", "свертки", "свертками", "свертках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	syn = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("сын", "сына", "сыну", "сына", "сыном", "сыне"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("сыновья", "сыновей", "сыновьям", "сыновей", "сыновьями", "сыновьях"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)
	treugolnik = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("треугольник", "треугольника", "треугольнику", "треугольник", "треугольником", "треугольнике"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("треугольники", "треугольников", "треугольникам", "треугольники", "треугольниками", "треугольниках"))
		.__animacy (T00_WordAnimacy.INANIMATE)
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
	vnuchka = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("внучка", "внучки", "внучке", "внучку", "внучкой", "внучке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("внучки", "внучек", "внучкам", "внучек", "внучками", "внучках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.FEMININE)
	)
	vnuk = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("внук", "внука", "внуку", "внука", "внуком", "внуке"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("внуки", "внуков", "внуками", "внуков", "внуками", "внуках"))
		.__animacy (T00_WordAnimacy.ANIMATE)
		.__gender (T00_WordGender.MASCULINE)
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
	zheton = T00_Utils.fluent (
		T00_Noun.new ()
		.__single_forms (T00_NounCaseForms.new ().setup ("жетон", "жетона", "жетону", "жетон", "жетоном", "жетоне"))
		.__plural_forms (T00_NounCaseForms.new ().setup ("жетоны", "жетонов", "жетонам", "жетоны", "жетонами", "жетонах"))
		.__animacy (T00_WordAnimacy.INANIMATE)
		.__gender (T00_WordGender.MASCULINE)
	)


func init_adjectives ():
	
	belyi = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("белый", "белого", "белому", "белого", "белый", "белым", "белом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("белая", "белой", "белой", "белую", "белую", "белой", "белой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("белое", "белого", "белому", "белое", "белое", "белым", "белом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("белые", "белый", "белым", "белых", "белые", "белыми", "белых"))
	)
	bolshoy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("большой", "большого", "большому", "большого", "большой", "большим", "большом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("большая", "большой", "большой", "большую", "большую", "большой", "большой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("большое", "большого", "большому", "большое", "большое", "большим", "большом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("большие", "больших", "большим", "больших", "большие", "большими", "больших"))
	)
	bumazhnyi = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("бумажный", "бумажного", "бумажному", "бумажного", "бумажный", "бумажным", "бумажном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("бумажная", "бумажной", "бумажной", "бумажную", "бумажную", "бумажной", "бумажной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("бумажное", "бумажного", "бумажному", "бумажное", "бумажное", "бумажным", "бумажном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("бумажные", "бумажный", "бумажным", "бумажных", "бумажные", "бумажными", "бумажных"))
	)
	chorniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("черный", "черного", "черному", "черного", "черный", "черным", "черном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("черная", "черной", "черной", "черную", "черную", "черной", "черной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("черное", "черного", "черному", "черное", "черное", "черным", "черном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("черные", "черных", "черным", "черных", "черные", "черными", "черных"))
	)
	figurniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("фигурный", "фигурного", "фигурному", "фигурного", "фигурный", "фигурным", "фигурном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("фигурная", "фигурной", "фигурной", "фигурную", "фигурную", "фигурной", "фигурной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("фигурное", "фигурного", "фигурному", "фигурное", "фигурное", "фигурным", "фигурном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("фигурные", "фигурных", "фигурным", "фигурных", "фигурные", "фигурными", "фигурных"))
	)
	igralniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("игральный", "игрального", "игральному", "игрального", "игральный", "игральным", "игральном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("игральная", "игральной", "игральной", "игральную", "игральную", "игральной", "игральной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("игральное", "игрального", "игральному", "игральное", "игральное", "игральным", "игральном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("игральные", "игральных", "игральным", "игральных", "игральные", "игральными", "игральных"))
	)
	kamenniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("каменный", "каменного", "каменному", "каменного", "каменный", "каменным", "каменном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("каменная", "каменной", "каменной", "каменную", "каменную", "каменной", "каменной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("каменное", "каменного", "каменному", "каменное", "каменное", "каменным", "каменном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("каменные", "каменных", "каменным", "каменных", "каменные", "каменными", "каменных"))
	)
	krasniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("красный", "красного", "красному", "красного", "красный", "красным", "красном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("красная", "красной", "красной", "красную", "красную", "красной", "красной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("красное", "красного", "красному", "красное", "красное", "красным", "красном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("красные", "красных", "красным", "красных", "красные", "красными", "красных"))
	)
	krugliy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("круглый", "круглого", "круглому", "круглого", "круглый", "круглым", "круглом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("круглая", "круглой", "круглой", "круглую", "круглую", "круглой", "круглой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("круглое", "круглого", "круглому", "круглое", "круглое", "круглым", "круглом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("круглые", "круглых", "круглым", "круглых", "круглые", "круглыми", "круглых"))
	)
	kvadratniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("квадратный", "квадратного", "квадратному", "квадратного", "квадратный", "квадратным", "квадратном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("квадратная", "квадратной", "квадратной", "квадратную", "квадратную", "квадратной", "квадратной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("квадратное", "квадратного", "квадратному", "квадратное", "квадратное", "квадратным", "квадратном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("квадратные", "квадратных", "квадратным", "квадратных", "квадратные", "квадратными", "квадратных"))
	)
	malenkiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("маленький", "маленького", "маленькому", "маленького", "маленький", "маленьким", "маленьком"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("маленькая", "маленькой", "маленькой", "маленькую", "маленькую", "маленькой", "маленькой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("маленькое", "маленького", "маленькому", "маленькое", "маленькое", "маленьким", "маленьком"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("маленькие", "маленьких", "маленьким", "маленьких", "маленькие", "маленькими", "маленьких"))
	)
	nebolshoy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("небольшой", "небольшого", "небольшому", "небольшого", "небольшой", "небольшим", "небольшом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("небольшая", "небольшой", "небольшой", "небольшую", "небольшую", "небольшой", "небольшой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("небольшое", "небольшого", "небольшому", "небольшое", "небольшое", "небольшим", "небольшом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("небольшие", "небольших", "небольшим", "небольших", "небольшие", "небольшими", "небольших"))
	)
	oranzheviy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("оранжевый", "оранжевого", "оранжевому", "оранжевого", "оранжевый", "оранжевым", "оранжевом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("оранжевая", "оранжевой", "оранжевой", "оранжевую", "оранжевую", "оранжевой", "оранжевой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("оранжевое", "оранжевого", "оранжевому", "оранжевое", "оранжевое", "оранжевым", "оранжевом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("оранжевые", "оранжевых", "оранжевым", "оранжевых", "оранжевые", "оранжевыми", "оранжевых"))
	)
	otkrytiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("открытый", "открытого", "открытому", "открытого", "открытый", "открытым", "открытом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("открытая", "открытой", "открытой", "открытую", "открытую", "открытой", "открытой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("открытое", "открытого", "открытому", "открытое", "открытое", "открытым", "открытом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("открытые", "открытых", "открытым", "открытых", "открытые", "открытыми", "открытых"))
	)
	ploskiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("плоский", "плоского", "плоскому", "плоского", "плоский", "плоским", "плоском"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("плоская", "плоской", "плоской", "плоскую", "плоскую", "плоской", "плоской"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("плоское", "плоского", "плоскому", "плоское", "плоское", "плоским", "плоском"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("плоские", "плоских", "плоским", "плоских", "плоские", "плоскими", "плоских"))
	)
	prodolgovatiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("продолговатый", "продолговатого", "продолговатому", "продолговатого", "продолговатый", "продолговатым", "продолговатом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("продолговатая", "продолговатой", "продолговатой", "продолговатую", "продолговатую", "продолговатой", "продолговатой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("продолговатое", "продолговатого", "продолговатому", "продолговатое", "продолговатое", "продолговатым", "продолговатом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("продолговатые", "продолговатых", "продолговатым", "продолговатых", "продолговатые", "продолговатыми", "продолговатых"))
	)
	prozrachniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("прозрачный", "прозрачного", "прозрачному", "прозрачного", "прозрачный", "прозрачным", "прозрачном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("прозрачная", "прозрачной", "прозрачной", "прозрачную", "прозрачную", "прозрачной", "прозрачной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("прозрачное", "прозрачного", "прозрачному", "прозрачное", "прозрачное", "прозрачным", "прозрачном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("прозрачные", "прозрачных", "прозрачным", "прозрачных", "прозрачные", "прозрачными", "прозрачных"))
	)
	seriy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("серый", "серого", "серому", "серого", "серый", "серым", "сером"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("серая", "серой", "серой", "серую", "серую", "серой", "серой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("серое", "серого", "серому", "серое", "серое", "серым", "сером"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("серые", "серых", "серым", "серых", "серые", "серыми", "серых"))
	)
	siniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("синий", "синего", "синему", "синего", "синий", "синим", "синем"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("синяя", "синей", "синей", "синюю", "синюю", "синей", "синей"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("синее", "синего", "синему", "синее", "синее", "синим", "синем"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("синие", "синих", "синим", "синих", "синие", "синими", "синих"))
	)
	shestiugolniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("шестиугольный", "шестиугольного", "шестиугольному", "шестиугольного", "шестиугольный", "шестиугольным", "шестиугольном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("шестиугольная", "шестиугольной", "шестиугольной", "шестиугольную", "шестиугольную", "шестиугольной", "шестиугольной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("шестиугольное", "шестиугольного", "шестиугольному", "шестиугольное", "шестиугольное", "шестиугольным", "шестиугольном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("шестиугольные", "шестиугольных", "шестиугольным", "шестиугольных", "шестиугольные", "шестиугольными", "шестиугольных"))
	)
	treugolniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("треугольный", "треугольного", "треугольному", "треугольного", "треугольный", "треугольным", "треугольном"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("треугольная", "треугольной", "треугольной", "треугольную", "треугольную", "треугольной", "треугольной"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("треугольное", "треугольного", "треугольному", "треугольное", "треугольное", "треугольным", "треугольном"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("треугольные", "треугольных", "треугольным", "треугольных", "треугольные", "треугольными", "треугольных"))
	)
	zachyorknutiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("зачеркнутый", "зачеркнутого", "зачеркнутому", "зачеркнутого", "зачеркнутый", "зачеркнутым", "зачеркнутом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("зачеркнутая", "зачеркнутой", "зачеркнутой", "зачеркнутую", "зачеркнутую", "зачеркнутой", "зачеркнутой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("зачеркнутое", "зачеркнутого", "зачеркнутому", "зачеркнутое", "зачеркнутое", "зачеркнутым", "зачеркнутом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("зачеркнутые", "зачеркнутых", "зачеркнутым", "зачеркнутых", "зачеркнутые", "зачеркнутыми", "зачеркнутых"))
	)
	zelyoniy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("зеленый", "зеленого", "зеленому", "зеленого", "зеленый", "зеленым", "зеленом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("зеленая", "зеленой", "зеленой", "зеленую", "зеленую", "зеленой", "зеленой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("зеленое", "зеленого", "зеленому", "зеленое", "зеленое", "зеленым", "зеленом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("зеленые", "зеленых", "зеленым", "зеленых", "зеленые", "зелеными", "зеленых"))
	)
	zhyoltiy = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("желтый", "желтого", "желтому", "желтого", "желтый", "желтым", "желтом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("желтая", "желтой", "желтой", "желтую", "желтую", "желтой", "желтой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("желтое", "желтого", "желтому", "желтое", "желтое", "желтым", "желтом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("желтые", "желтых", "желтым", "желтых", "желтые", "желтыми", "желтых"))
	)
	znakomyi = (
		T00_Adjective.new ()
		.__masculine_single_forms (T00_AdjCaseForms.new ().setup ("знакомый", "знакомого", "знакомому", "знакомого", "знакомый", "знакомым", "знакомом"))
		.__feminine_single_forms (T00_AdjCaseForms.new ().setup ("знакомая", "знакомой", "знакомой", "знакомую", "знакомую", "знакомой", "знакомой"))
		.__neuter_single_forms (T00_AdjCaseForms.new ().setup ("знакомое", "знакомого", "знакомому", "знакомое", "знакомое", "знакомым", "знакомом"))
		.__plural_forms (T00_AdjCaseForms.new ().setup ("знакомые", "знакомых", "знакомым", "знакомых", "знакомые", "знакомыми", "знакомых"))
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
	lezhat = T00_Verb.new ().setup (
		"лежать", "лежал", "лежала", "лежало", "лежали",
		"лежу", "лежим", "лежишь", "лежите", "лежит", "лежат",
		"буду лежать", "будем лежать", "будешь лежать", "будете лежать", "будет лежать", "будут лежать"
	)
	moch = T00_Verb.new ().setup (
		"мочь", "мог", "могла", "могло", "могли",
		"могу", "можем", "можешь", "можете", "может", "могут",
		"смогу", "сможем", "сможешь", "сможете", "сможет", "смогут"
	)
	nagnutsya = T00_Verb.new ().setup (
		"нагнуться", "нагнулся", "нагнулась", "нагнулось", "нагнулись",
		"нагибаюсь", "нагибаемся", "нагибаешься", "нагибаетесь", "нагибается", "нагибаются",
		"нагнусь", "нагнемся", "нагнешься", "нагнетесь", "нагнется", "нагнутся"
	)
	napomnit = T00_Verb.new ().setup (
		"напомнить", "напомнил", "напомнила", "напомнило", "напомнили",
		"напоминаю", "напоминаем", "напоминаешь", "напоминаете", "напоминает", "напоминают",
		"напомню", "напомним", "напомнишь", "напомните", "напомнит", "напомнят"
	)
	okazatsya = T00_Verb.new ().setup (
		"оказаться", "оказался", "оказалась", "оказалось", "оказались",
		"оказываюсь", "оказываемся", "оказываешься", "оказываетесь", "оказываетсь", "оказываются",
		"окажусь", "окажемся", "окажешься", "окажетесь", "окажется", "окажутся"
	)
	pokazat = T00_Verb.new ().setup (
		"показать", "показал", "показала", "показало", "показали",
		"показываю", "показываем", "показываешь", "показываете", "показывает", "показывают",
		"покажу", "покажем", "покажешь", "покажете", "покажет", "покажут"
	)
	pokazatsya = T00_Verb.new ().setup (
		"показаться", "показался", "показалась", "показалось", "показались",
		"показываюсь", "показываемся", "показываешься", "показываетесь", "показываетсь", "показываются",
		"покажусь", "покажемся", "покажешься", "покажетесь", "покажется", "покажутся"
	)
	polozhit = T00_Verb.new ().setup (
		"положить", "положил", "положила", "положило", "положили",
		"кладу", "кладем", "кладешь", "кладете", "кладет", "кладут",
		"положу", "положим", "положишь", "положите", "положит", "положат"
	)
	ponyat = T00_Verb.new ().setup (
		"понять", "понял", "поняла", "поняло", "поняли",
		"понимаю", "понимаем", "понимаешь", "понимаете", "понимает", "понимают",
		"пойму", "поймем", "поймешь", "поймете", "поймет", "поймут"
	)
	# Troubles?
	posmotret = T00_Verb.new ().setup (
		"посмотреть", "посмотрел", "посмотрела", "посмотрело", "посмотрели",
		"смотрю", "смотрим", "смотришь", "смотрите", "смотрит", "смотрят",
		"посмотрю", "посмотрим", "посмотришь", "посмотрите", "посмотрит", "посмотрят"
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
	zavernut = T00_Verb.new ().setup (
		"завернуть", "завернул", "завернула", "завернуло", "завернули",
		"заворачиваю", "заворачиваем", "заворачиваешь", "заворачиваете", "заворачивает", "заворачивают",
		"заверну", "завернем", "завернешь", "завернете", "завернет", "завернут"
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


