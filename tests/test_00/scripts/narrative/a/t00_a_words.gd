class_name T00_A_Words extends RefCounted
## Коллекция ВСЕХ динамических слов, используемых в игре.

var avtoslesar: T00_Noun
var brodyaga: T00_Noun
var doctor: T00_Noun
var detectiv: T00_Noun
var fermer: T00_Noun
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


func _init ():
	
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
		.__gender (T00_WordGender.MASCULINE)
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


