# About 
This work present homework number 1, part 2 for the school year 2016/2017 in [Digital Signal Processing](http://tnt.etf.rs/~oe3dos/) in the 3rd year, Department of Electronics, School of Electrical Engineering, University of Belgrade.

# About the homework number 1 in Serbian
Cilj prvog domaćeg zadatka je da studenti samostalno probaju osnovne metode frekvencijske analize signala korišćenjem diskretne Furijeove transformacije i da na realnim primerima uoče prednosti brzih algoritama za izračunavanje diskretne Furijeove transformacije u primeni izračunavanja konvolucije, kao i da ovladaju elementarnim korišćenjem programskog paketa MATLAB u digitalnoj obradi signala.

Domaći zadatak se sastoji iz četiri dela. Prvi deo domaćeg zadatka predstavlja primenu diskretne Furijeove transformacije za izračunavanje konvolucije prilikom emulacije reverberacije zvuka. Drugi deo domaćeg zadatka je poređenje različitih prozorskih funkcija u frekvencijskoj analizi signala. Treći deo zahteva crtanje spektrograma i identifikaciju matematičkog oblika signala iz odbiraka koji su dati. Četvrti i poslednji deo se odnosi na frekvencijsku analizu realnog muzičkog signala.

# Text of the task in Serbian
Dat je analogni signal x(t) = 5 cos(2pf1t) + 1000 cos(2pf2t) + 10 cos(2pf3t), f1 = 1 kHz, f2 = 1,24 kHz, f3 = 1,3 kHz . Signal se diskretizuje učestanošću fs = 10 kHz.

1. Odrediti minimalan broj odbiraka N digitalnog signala x[n] za koju prilikom izračunavanja diskretne Furijeove transformacije ne dolazi do curenja spektra. Obrazložiti u izveštaju. Nacrtati ovaj signal u n tačaka, kao i njegovu diskretnu Furijeovu transformaciju (realni i imaginarni deo na istoj slici, jedan grafik ispod drugog).

2.Na signal iz tačke 1. primeniti neku prozorsku funkciju čiji odbirci opadaju do nule ka krajevima. Trajanje te prozorske funkcije je jednako trajanju signala N. Nacrtati diskretnu Furijeovutransformaciju modifikovanog signala (realni i imaginarni deo na istoj slici, jedan grafik ispod drugog) i objasniti dobijene grafike.

3. Ako je signal odabiran u 1,3N tačaka, prikazati amplitudski spektar ovog signala (u dB) ako se nad njim prethodno primeni:
a. pravougaona prozorska funkcija,
b. trougaona prozorska funkcija,
c. Hanova prozorska funkcija,
d. Hemingova prozorska funkcija,
e. Blekmenova prozorska funkcija,
f. Kajzerova prozorska funkcija za beta = 3,
g. Kajzerova prozorska funkcija za beta = 7,
h. Kajzerova prozorska funkcija za beta = 10.
Uporediti dobijene spektre i objasniti zašto se na nekim graficima mogu jasnije razaznati spektralne komponente u odnosu na druge.

4. Napisati funkciju hamming_slabljenje(N) kojom se računa slabljenje maksimalnog bočnog luka Hemingove prozorske funkcije dužine N odbiraka. Korišćenjem ove funkcije nacrtati grafik zavisnosti slabljenja od dužine sekvence za opseg N od 8 do 1024. Obratiti pažnju na to koji luk ima najmanje slabljenje za različito N.

Obeležiti sve ose odgovarajućim oznakama/tekstom. Amplitudske spektre crtati tako da je frekvencijska osa u hercima od 0 do fs/2.U kodu komentarima jasno naznačiti koji deo koda se odnosi na koji deo zadatka. Skriptu nazvati windows_godinaupisa-bojindeksa.m i priložiti je uz izveštaj.

# Some screenshot
![1](https://user-images.githubusercontent.com/16638876/30588300-76ffd312-9d36-11e7-8bc3-351dfee2454a.png)

![2](https://user-images.githubusercontent.com/16638876/30588304-7b43d45a-9d36-11e7-9ac4-f6fc6ac9f97e.png)

![3](https://user-images.githubusercontent.com/16638876/30588308-7fa27e8e-9d36-11e7-98da-b3d76513a71d.png)
