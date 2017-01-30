/// Opis danych
des
summarize interested syst glos petition skala happy health gender education 
histogram interested 
histogram syst 
histogram glos 
histogram petition 
histogram skala
histogram happy 
histogram health 
histogram gender
histogram education
/// Zbadajmy rozklad zmiennej zaleznej
tab dziel
//wychodza male p-value ale dla danych z euro tez podobnie wychodzilo,wiec szalu nie ma
//uznajemy ze sa normalne i tyle
swilk interested syst glos petition skala happy health gender education
/// Jaki model nalezy wybrac?
bysort dziel: su interested syst glos petition skala happy health gender education 
corr  interested syst glos petition skala happy health gender education 

/// Przeprowadz odpowiednia analize dyskryminacyjna
/// Zastanow sie jaki model zastosowac oraz jaki dobrac rozklad a-priori

/// Zastanow sie czy wszystkie zmienne dobrze rozdzielaja zbior

/// Zbadaj stosunek do euro metoda najblizszych sasiadow
// losujemy 10% probe prosta by przyspieszyc obliczenia
sample 10
// Zastanow sie jaki rozklad a-priori wybrac aby zbadac poprawnosc klasyfikacji
discrim knn  interested syst glos petition skala happy health gender education , group(dziel2) k(6)
qnorm interested
