//przygotowanie danych
sort id
histogram wiek
//obczajamy display format, w zasadzie kazde inne
des wiek interested trust education
sum wiek interested trust education
spearman wiek interested trust education
// zmienne PT5 PT7 PT45A PT45B PT45C
//standaryzacja zmiennych
foreach X of varlist wiek interested trust education {
egen `X'_K = std(`X')
}

//prawidlowa ilosc skupien to 10,11

cluster kmeans interested_K trust_K education_K wiek_K, k(1) name(cl1_mean)
cluster kmeans interested_K trust_K education_K wiek_K , k(2) name(cl2_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(3) name(cl3_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(4) name(cl4_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(5) name(cl5_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(6) name(cl6_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(7) name(cl7_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(8) name(cl8_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(9) name(cl9_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(10) name(cl10_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(11) name(cl11_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(12) name(cl12_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(13) name(cl13_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(14) name(cl14_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(15) name(cl15_mean)
cluster kmeans interested_K trust_K education_K wiek_K, k(16) name(cl16_mean)

forvalues i=1(1)16 {
cluster stop cl`i'_mean
}
//statystyki opisowe skupien dla wybranej ilosci skupien
bysort cl3_mean: su interested trust education wiek 


//przeprowadzimy analize oparta o mediany, ktore sa bardziej odporne na obserwacje odstajace
cluster kmedian interested_K trust_K education_K wiek_K, k(1) name(cl1_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(2) name(cl2_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(3) name(cl3_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(4) name(cl4_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(5) name(cl5_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(6) name(cl6_median)
cluster kmedian interested_K trust_K education_K wiek_K, k(7) name(cl7_median)


forvalues i=1(1)7 {
cluster stop cl`i'_median
}
bysort cl2_median: su interested trust education wiek 

// 2 skupienai wg median i 3 wg srednich
