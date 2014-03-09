# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#EXAM TYPES
kurssikoe = ExamType.create name:'Kurssikoe'
erilliskoe = ExamType.create name:'Erilliskoe'

#COURSES
ohpe = Course.create name:'Ohjelmoinnin perusteet', hy_id:581325, active:true
ohja = Course.create name:'Ohjelmoinnin jatkokurssi', hy_id:582103, active:true
tira = Course.create name:'Tietorakenteet ja algoritmit', hy_id:58131, active:true
otm = Course.create name:'Ohjelmistotekniikan menetelmät', hy_id:582104, active:true

#EXAMS
ohpe_1 = Exam.create course:ohpe, date:Date.new(2012, 2, 28), exam_type:kurssikoe
ohpe_2 = Exam.create course:ohpe, date:Date.new(2012, 10, 16), exam_type:kurssikoe
ohpe_3 = Exam.create course:ohpe, date:Date.new(2013, 2, 26), exam_type:kurssikoe
ohpe_4 = Exam.create course:ohpe, date:Date.new(2013, 10, 15), exam_type:kurssikoe
ohpe_5 = Exam.create course:ohpe, date:Date.new(2014, 2, 25), exam_type:kurssikoe

ohja_1 = Exam.create course:ohja, date:Date.new(2012, 5, 4), exam_type:kurssikoe
ohja_2 = Exam.create course:ohja, date:Date.new(2012, 12, 10), exam_type:kurssikoe
ohja_3 = Exam.create course:ohja, date:Date.new(2012, 4, 29), exam_type:kurssikoe
ohja_4 = Exam.create course:ohja, date:Date.new(2012, 12, 9), exam_type:kurssikoe

tira_1_1 = Exam.create course:tira, date:Date.new(2012,10,18), exam_type:kurssikoe
tira_1_2 = Exam.create course:tira, date:Date.new(2012,12,14), exam_type:kurssikoe
tira_2_1 = Exam.create course:tira, date:Date.new(2013,10,18), exam_type:kurssikoe
tira_2_2 = Exam.create course:tira, date:Date.new(2013,12,9), exam_type:kurssikoe

tira_e_1 = Exam.create course:tira, date:Date.new(2012,6,12), exam_type:erilliskoe
tira_e_2 = Exam.create course:tira, date:Date.new(2012,8,14), exam_type:erilliskoe

otm_1 = Exam.create course:otm, date:Date.new(2012,9,5), exam_type:kurssikoe
otm_2 = Exam.create course:otm, date:Date.new(2013,12,11), exam_type:kurssikoe
otm_3 = Exam.create course:otm, date:Date.new(2013,9,9), exam_type:kurssikoe

#QUESTIONS, OHPE
ohpe_q1 = "
Kerro mitä seuraavat käsitteet tarkoittavat ja miten ne liittyvät toisiinsa: luokka, olio, me-
todi, oliomuuttuja, metodin apumuuttuja. Anna konkreettinen koodiesimerkki, joka havain-
nollistaa käsitteitä.

Tehtävän vastauksen pituuden ei tule ylittää kahta sivua.
"

ohpe_q2 = "
Ohjelmoinnin perusasiat (7p)

a)(3p) Tee ohjelma, joka tulostaa toistolausetta (esim. while tai for) käyttäen kaikki 2:lla
jaolliset kokonaisluvut aloittaen luvusta 1000 ja päätyen lukuun 2. Tulostuksen tulee
tapahtua siten, että jokaiselle riville tulostetetaan 5 lukua, tämän jälkeen tulostus alkaa
seuraavalta riviltä, eli ohjelman tulostuksen tulee näyttää seuraavalta:

[code]1000 998 996 994 992
990 988 986 984 982
980 978 976 974 972
(paljon rivejä välissä)
10 8 6 4 2[/code]

b)(4p) Tee ohjelma, joka saa syötteekseen opiskelijoiden koepistemääriä kuvaavia koko-
naislukuja. Ohjelman toiminta alkaa siten, että se lukee käyttäjältä pistemääriä. Piste-
määrien lukeminen loppuu siihen kun käyttäjä syöttää luvun -1.

Pistemäärän tulee olla luku väliltä 0-30. Jos ohjelmalle syötetään jokin muu pistemäärä,
ohjelma jättää sen huomioimatta.

Luettuaan pistemäärät ohjelma ilmoittaa, mikä (väliltä 0-30 olleista) pistemääristä oli
suurin. Pistemääristä ne joiden suuruus on alle 15 vastaavat arvosanaa hylätty ja loput
arvosanaa hyväksytty. Ohjelma ilmoittaa myös hyväksyttyjen ja hylättyjen arvosanojen
lukumäärät.

Esimerkki:

[code]Syötä koepistemäärät, -1 lopettaa:
20
12
1
29
15
-1
paras pistemäärä: 29
hyväksyttyjä: 3
hylättyjä: 1[/code]

Esimerkissä pistemäärä 12 vastaa hylättyä ja pistemäärät 20, 29 ja 15 hyväksyttyjä
suorituksia. Eli ohjelma ilmoittaa että hyväksyttyjä on 3 ja hylättyjä 1.

Huomaa, että ohjelman tulee jättää huomioimatta kaikki välin 0-30 ulkopuolella olevat
pistemäärät. Esimerkki toiminnasta tilanteessa, jossa syötteiden seassa on huomioimatta
jätettäviä pistemääriä:

[code]Syötä koepistemäärät, -1 lopettaa:
10
100
20
-4
30
-1
paras pistemäärä: 30
hyväksyttyjä: 2
hylättyjä: 1[/code]

Pistemääriä -4 ja 100 ei siis huomioida tuloksissa."

#QUESTIONS, OHJA
ohja_q1 = "
Käsitteistöä (6p)

Vastaa jokaiseen kohtaan lyhyesti ja ytimekkäästi. Koko tehtävän vastauksen pituudeksi riit-
tää noin kaksi sivua.

a) (3p) Javassa on joskus tarve määritellä luokalle metodit equals ja compareTo. Kerro
milloin metodeja tarvitaan ja miten metodit tulee määritellä. Anna esimerkki yksinker-
taisesta luokasta, jolle määrittelet em. metodit.

b) (2p) Mitä ovat poikkeukset (engl. exceptions) ja millaisissa tilanteissa ohjelmoija joutuu
niiden kanssa tekemisiin? Miten poikkeusten käsittely ja niiden heittäminen tapahtuu?
Anna pieni koodiesimerki, joka valaisee tilannetta.

c) (1p) Mitä ovat tapahtumankäsittelijät (engl. action listener) ja minkälaisissa tilanteissa
niitä käytetään?
"

ohja_q2 = "
(11p) Ohjelma saa syötteeksi tiedoston, joka sisältää twiittejä eli twitter-viestejä.

Tiedosto on muotoa:

[code]arto:anybody #beer in #kallio tomorrow?
pekka:today in #tktl exam of #programming
arto:great selection of german #beer now in #oljenkorsi
pekka:exam now done, no more #programming for some time
heikki:some new courses on #programming at #tktl check out the website![/code]

Kukin rivi siis sisältää yhden twiitin. Rivi alkaa twiitin lähettäjän nimellä jota seuraa twiitin
varsinainen sisältö. Twiittien sisällössä #-merkillä merkityt sanat ovat tägejä. Esim. ensim-
mäiseen twiittiin liittyvät tägit #beer ja #kallio.

Tehtävässä tehdään ohjelma, joka lukee twiitit sisältävän tiedoston ja tulostaa twiiteissä
käytetyt tägit ja niiden esiintymislukumäärän.

Ohjelma toimii seuraavasti (käyttäjän syöte vinonnettuna):

[code]give a tweetfile: tweets.txt
programming 3
beer 2
tktl 2
oljenkorsi 1
kallio 1[/code]

Jos käyttäjä yrittää lukea tiedoston, jota ei ole olemassa tai jota ei kyetä lukemaan, huo-
mauttaa ohjelma tästä ja pyytää uutta tiedostoa:

[code]give a tweetfile: nonexistentfile.txt
file does not exist!
give a tweetfile:[/code]

Saadaksesi täydet pisteet, tulee tägit tulostaa esimerkin tapaan esiintymislukumäärän mu-
kaisessa järjestyksessä! Jos tulostus ei ole järjestyksessä, on tehtävän maksimipistemäärä 9.

Voit olettaa että käytössäsi on apuluokka ja siinä metodi, joka palauttaa syötteenään saa-
masta tekstimuotoisesta twiitistä siihen liittyvät tägit:

[code]public public TweetParser {
   public static List<String> getTags(String tweet){
      // ...
   }
}[/code]

HUOM: jos et osaa toteuttaa tiedostosta tapahtuvaa syötteen lukemista, voit lukea syöte-
rivit komentoriviltä. Tällöin tehtävän maksimipistemäärä on 8.
"

#QUESTIONS, TIRA

tira_q1 = "
[15 pistettä] Seuraavassa on kolme suuntaamatomattomia painotettuja verkkoja kos-
kevaa väitettä. Ilmoita kustakin, pitääkö se paikkansa. Jos pitää, niin todista se. Jos
ei pidä, niin anna vastaesimerkki.

a) Jos verkossa on [latex]n[/latex] solmua ja se on täydellinen (eli joka solmusta on kaari jokai-
seen toiseen solmuun), niin leveyssuuntainen läpikäynti vie aikaa [latex]\Theta(n^2)[/latex]. Voit
tässä olettaa tunnetuksi, mitä luentomateriaalissa kerrotaan leveyssuuntaisen
läpikäynnin aikavaativuudesta yleisessä tapauksessa.

b) Jos verkossa [latex]G = (V, E)[/latex] on ainakin [latex]|V|[/latex] kaarta ja [latex]e[/latex] on sellainen kaari, että
[latex]w(e) > w(e^')[/latex] kaikilla [latex]e \\neq e^'[/latex], niin kaari [latex]e[/latex] ei kuulu mihinkään verkon pienimpään
virittävään puuhun. Tässä [latex]w(e)[/latex] tarkoittaa kaaren [latex]e[/latex] painoa.

c) Jos [latex](v_0, ..., v_k)[/latex] on ainoa lyhin polku solmusta [latex]v_0[/latex] solmuun [latex]v_k[/latex] , niin kaikki kaaret
[latex](v_i, v_{i+1}), i = 0, ..., k-1[/latex], kuuluvat jokaiseen verkon pienimpään virittävään puuhun."

#QUESTIONS, OTM
otm_q1 = "
Kirjoita molemmista kohdista noin yhden sivun mittainen essee, jossa selität
termien merkityksen ja niiden suhteen toisiinsa. Kirjoita kokonaisia hyvin muotoiltuja
lauseita, pelkillä ranskalaisilla viivoilla ei pisteitä ole luvassa.

a) ohjelmistotuotantoprojektin vaiheet, vesiputousmalli, ketterät menetelmät

b) oliosuunnittelun periaatteet, koodihaju, tekninen velka, refaktorointi"

#BULK
lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et pellentesque felis. Nullam at eros at tellus convallis bibendum. Maecenas malesuada pretium justo, nec lobortis tortor blandit euismod. Proin venenatis erat sed enim tempor tincidunt. Aliquam euismod enim id velit sagittis, at consectetur odio vulputate. Quisque pretium a magna eget rutrum. Nunc mauris neque, ullamcorper non viverra eget, pulvinar ac ligula."

ohpe_bulk_q1 = "OHPE BULK QUESTION 1 " + lipsum
ohpe_bulk_q2 = "OHPE BULK QUESTION 2 " + lipsum
ohpe_bulk_q3 = "OHPE BULK QUESTION 3 " + lipsum
ohpe_bulk_q4 = "OHPE BULK QUESTION 4 " + lipsum
ohpe_bulk_q5 = "OHPE BULK QUESTION 5 " + lipsum

ohja_bulk_q1 = "OHJA BULK QUESTION 1 " + lipsum
ohja_bulk_q2 = "OHJA BULK QUESTION 2 " + lipsum
ohja_bulk_q3 = "OHJA BULK QUESTION 3 " + lipsum
ohja_bulk_q4 = "OHJA BULK QUESTION 4 " + lipsum
ohja_bulk_q5 = "OHJA BULK QUESTION 5 " + lipsum

tira_bulk_q1 = "TIRA BULK QUESTION 1 " + lipsum
tira_bulk_q2 = "TIRA BULK QUESTION 2 " + lipsum
tira_bulk_q3 = "TIRA BULK QUESTION 3 " + lipsum
tira_bulk_q4 = "TIRA BULK QUESTION 4 " + lipsum
tira_bulk_q5 = "TIRA BULK QUESTION 5 " + lipsum

otm_bulk_q1 = "otm BULK QUESTION 1 " + lipsum
otm_bulk_q2 = "otm BULK QUESTION 2 " + lipsum
otm_bulk_q3 = "otm BULK QUESTION 3 " + lipsum
otm_bulk_q4 = "otm BULK QUESTION 4 " + lipsum
otm_bulk_q5 = "otm BULK QUESTION 5 " + lipsum

#ANSWERS
ohpe_bulk_a = "OHPE BULK ANSWER"
ohja_bulk_a = "OHJA BULK ANSWER"
tira_bulk_a = "TIRA BULK ANSWER"
otm_bulk_a = "OTM BULK ANSWER"

#CRITERIA
ohpe_bulk_c = "OHPE BULK CRITERIA"
ohja_bulk_c = "OHPE BULK CRITERIA"
tira_bulk_c = "TIRA BULK CRITERIA"
otm_bulk_c = "OTM BULK CRITERIA"

#EXERCISES
ohpe_ex1 = Exercise.create points:5, question:ohpe_q1
ohpe_ex2 = Exercise.create points:7, question:ohpe_q2
ohpe_ex_b1 = Exercise.create points:0, question:ohpe_bulk_q1, answer:ohpe_bulk_a, criteria:ohpe_bulk_c
ohpe_ex_b2 = Exercise.create points:0, question:ohpe_bulk_q2, answer:ohpe_bulk_a, criteria:ohpe_bulk_c
ohpe_ex_b3 = Exercise.create points:0, question:ohpe_bulk_q3, answer:ohpe_bulk_a, criteria:ohpe_bulk_c
ohpe_ex_b4 = Exercise.create points:0, question:ohpe_bulk_q4, answer:ohpe_bulk_a, criteria:ohpe_bulk_c
ohpe_ex_b5 = Exercise.create points:0, question:ohpe_bulk_q5, answer:ohpe_bulk_a, criteria:ohpe_bulk_c

ohja_ex1 = Exercise.create points:6, question:ohja_q1
ohja_ex2 = Exercise.create points:11, question:ohja_q2
ohja_ex_b1 = Exercise.create points:0, question:ohja_bulk_q1, answer:ohja_bulk_a, criteria:ohja_bulk_c
ohja_ex_b2 = Exercise.create points:0, question:ohja_bulk_q2, answer:ohja_bulk_a, criteria:ohja_bulk_c
ohja_ex_b3 = Exercise.create points:0, question:ohja_bulk_q3, answer:ohja_bulk_a, criteria:ohja_bulk_c
ohja_ex_b4 = Exercise.create points:0, question:ohja_bulk_q4, answer:ohja_bulk_a, criteria:ohja_bulk_c
ohja_ex_b5 = Exercise.create points:0, question:ohja_bulk_q5, answer:ohja_bulk_a, criteria:ohja_bulk_c

tira_ex1 = Exercise.create points:15, question:tira_q1
tira_ex_b1 = Exercise.create points:0, question:tira_bulk_q1, answer:tira_bulk_a, criteria:tira_bulk_c
tira_ex_b2 = Exercise.create points:0, question:tira_bulk_q2, answer:tira_bulk_a, criteria:tira_bulk_c
tira_ex_b3 = Exercise.create points:0, question:tira_bulk_q3, answer:tira_bulk_a, criteria:tira_bulk_c
tira_ex_b4 = Exercise.create points:0, question:tira_bulk_q4, answer:tira_bulk_a, criteria:tira_bulk_c
tira_ex_b5 = Exercise.create points:0, question:tira_bulk_q5, answer:tira_bulk_a, criteria:tira_bulk_c

otm_ex1 = Exercise.create points:4, question:otm_q1
otm_ex_b1 = Exercise.create points:0, question:otm_bulk_q1, answer:otm_bulk_a, criteria:otm_bulk_c
otm_ex_b2 = Exercise.create points:0, question:otm_bulk_q2, answer:otm_bulk_a, criteria:otm_bulk_c
otm_ex_b3 = Exercise.create points:0, question:otm_bulk_q3, answer:otm_bulk_a, criteria:otm_bulk_c
otm_ex_b4 = Exercise.create points:0, question:otm_bulk_q4, answer:otm_bulk_a, criteria:otm_bulk_c
otm_ex_b5 = Exercise.create points:0, question:otm_bulk_q5, answer:otm_bulk_a, criteria:otm_bulk_c

#EXAMS-EXERCISES OHPE
ExamsExercise.create exam:ohpe_1, exercise:ohpe_ex1
ExamsExercise.create exam:ohpe_1, exercise:ohpe_ex2
ExamsExercise.create exam:ohpe_1, exercise:ohpe_ex_b1
ExamsExercise.create exam:ohpe_1, exercise:ohpe_ex_b2

ExamsExercise.create exam:ohpe_2, exercise:ohpe_ex1
ExamsExercise.create exam:ohpe_2, exercise:ohpe_ex_b2
ExamsExercise.create exam:ohpe_2, exercise:ohpe_ex_b3
ExamsExercise.create exam:ohpe_2, exercise:ohpe_ex_b4

ExamsExercise.create exam:ohpe_3, exercise:ohpe_ex2
ExamsExercise.create exam:ohpe_3, exercise:ohpe_ex_b5
ExamsExercise.create exam:ohpe_3, exercise:ohpe_ex_b4
ExamsExercise.create exam:ohpe_3, exercise:ohpe_ex_b1

ExamsExercise.create exam:ohpe_4, exercise:ohpe_ex1
ExamsExercise.create exam:ohpe_4, exercise:ohpe_ex2
ExamsExercise.create exam:ohpe_4, exercise:ohpe_ex_b3
ExamsExercise.create exam:ohpe_4, exercise:ohpe_ex_b4

ExamsExercise.create exam:ohpe_5, exercise:ohpe_ex1
ExamsExercise.create exam:ohpe_5, exercise:ohpe_ex2
ExamsExercise.create exam:ohpe_5, exercise:ohpe_ex_b1
ExamsExercise.create exam:ohpe_5, exercise:ohpe_ex_b5

#EXAMS-EXERCISES OHJA
ExamsExercise.create exam:ohja_1, exercise:ohja_ex1
ExamsExercise.create exam:ohja_1, exercise:ohja_ex2
ExamsExercise.create exam:ohja_1, exercise:ohja_ex_b1
ExamsExercise.create exam:ohja_1, exercise:ohja_ex_b2

ExamsExercise.create exam:ohja_2, exercise:ohja_ex1
ExamsExercise.create exam:ohja_2, exercise:ohja_ex_b2
ExamsExercise.create exam:ohja_2, exercise:ohja_ex_b3
ExamsExercise.create exam:ohja_2, exercise:ohja_ex_b4

ExamsExercise.create exam:ohja_3, exercise:ohja_ex2
ExamsExercise.create exam:ohja_3, exercise:ohja_ex_b5
ExamsExercise.create exam:ohja_3, exercise:ohja_ex_b4
ExamsExercise.create exam:ohja_3, exercise:ohja_ex_b1

ExamsExercise.create exam:ohja_4, exercise:ohja_ex1
ExamsExercise.create exam:ohja_4, exercise:ohja_ex2
ExamsExercise.create exam:ohja_4, exercise:ohja_ex_b3
ExamsExercise.create exam:ohja_4, exercise:ohja_ex_b4

#EXAMS-EXERCISES TIRA
ExamsExercise.create exam:tira_1_1, exercise:tira_ex1
ExamsExercise.create exam:tira_1_1, exercise:tira_ex_b1
ExamsExercise.create exam:tira_1_1, exercise:tira_ex_b2
ExamsExercise.create exam:tira_1_1, exercise:tira_ex_b3

ExamsExercise.create exam:tira_1_2, exercise:tira_ex1
ExamsExercise.create exam:tira_1_2, exercise:tira_ex_b2
ExamsExercise.create exam:tira_1_2, exercise:tira_ex_b3
ExamsExercise.create exam:tira_1_2, exercise:tira_ex_b4

ExamsExercise.create exam:tira_2_1, exercise:tira_ex1
ExamsExercise.create exam:tira_2_1, exercise:tira_ex_b5
ExamsExercise.create exam:tira_2_1, exercise:tira_ex_b4
ExamsExercise.create exam:tira_2_2, exercise:tira_ex_b1

ExamsExercise.create exam:tira_2_2, exercise:tira_ex1
ExamsExercise.create exam:tira_2_2, exercise:tira_ex_b3
ExamsExercise.create exam:tira_2_2, exercise:tira_ex_b4
ExamsExercise.create exam:tira_1_1, exercise:tira_ex_b5

ExamsExercise.create exam:tira_e_1, exercise:tira_ex1
ExamsExercise.create exam:tira_e_1, exercise:tira_ex_b1
ExamsExercise.create exam:tira_e_1, exercise:tira_ex_b2
ExamsExercise.create exam:tira_e_1, exercise:tira_ex_b3

ExamsExercise.create exam:tira_e_2, exercise:tira_ex1
ExamsExercise.create exam:tira_e_2, exercise:tira_ex_b2
ExamsExercise.create exam:tira_e_2, exercise:tira_ex_b3
ExamsExercise.create exam:tira_e_2, exercise:tira_ex_b4

#EXAMS-EXERCISES OTM
ExamsExercise.create exam:otm_1, exercise:otm_ex1
ExamsExercise.create exam:otm_1, exercise:otm_ex_b4
ExamsExercise.create exam:otm_1, exercise:otm_ex_b1
ExamsExercise.create exam:otm_1, exercise:otm_ex_b2

ExamsExercise.create exam:otm_2, exercise:otm_ex1
ExamsExercise.create exam:otm_2, exercise:otm_ex_b2
ExamsExercise.create exam:otm_2, exercise:otm_ex_b3
ExamsExercise.create exam:otm_2, exercise:otm_ex_b4

ExamsExercise.create exam:otm_3, exercise:otm_ex1
ExamsExercise.create exam:otm_3, exercise:otm_ex_b5
ExamsExercise.create exam:otm_3, exercise:otm_ex_b4
ExamsExercise.create exam:otm_3, exercise:otm_ex_b1