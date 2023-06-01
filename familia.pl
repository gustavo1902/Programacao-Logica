%fatos
pai(tadeu, maria).
pai(joao, alessandra).
pai(joao, isolda).
pai(joao, luis).
pai(joao, alencar).
pai(jonas, jose).
pai(jose, gilberto).
pai(jose, gilmar).
pai(jose, maura).
pai(jose, eder).
pai(gilberto, gustavo).
pai(gilberto, guilherme).
pai(wilson, flavia).
pai(wilson, tiago).
pai(eder, felipe).
pai(eder, daniel).
pai(alencar, walter).
pai(alencar, sabrina).

mae(tereza, maria).
mae(maria, alessandra).
mae(maria, isolda).
mae(maria, luis).
mae(maria, alencar).
mae(lena, jose).
mae(luzia, gilberto).
mae(luzia, gilmar).
mae(luzia, maura).
mae(luzia, eder).
mae(alessandra, gustavo).
mae(alessandra, guilherme).
mae(isolda, flavia).
mae(isolda, tiago).
mae(ivanilda, felipe).
mae(ivanilda, daniel).
mae(cida, walter).
mae(cida, sabrina).


sexo(tereza, feminino).
sexo(maria, feminino).
sexo(luzia, feminino).
sexo(alessandra, feminino).
sexo(isolda, feminino).
sexo(maura, feminino).
sexo(ivanilda, feminino).
sexo(cida, feminino).
sexo(sabrina, feminino).
sexo(flavia, feminino).

sexo(tadeu, masculino).
sexo(joao, masculino).
sexo(jose, masculino).
sexo(gilberto, masculino).
sexo(gustavo, masculino).
sexo(guilherme, masculino).
sexo(luis, masculino).
sexo(gilmar, masculino).
sexo(eder, masculino).
sexo(felipe, masculino).
sexo(daniel, masculino).
sexo(alencar, masculino).
sexo(walter, masculino).

%Regra

/*Considerei apenas parentes diretos
Pelo fato de todos os irmaõs terem o mesmo pai e mãe coloquei apenas essa regra.*/
irmaos(X, Y) :- pai(Z, X), pai(Z, Y), X \== Y.
 
avos(X, Y) :- pai(X, Z), pai(Z, Y).
avos(X, Y) :- mae(X, Z), pai(Z, Y).
avos(X, Y) :- pai(X, Z), mae(Z, Y).
avos(X, Y) :- mae(X, Z), mae(Z, Y).

tios(X, Y) :- pai(Z, Y), irmaos(X, Z).
tios(X, Y) :- mae(Z, Y), irmaos(X, Z).

primos(X, Y) :- (mae(Z, X), mae(W, Y), irmaos(Z, W) ; pai(Z, X), pai(W, Y), irmaos(Z, W) ; mae(Z, X), pai(W, Y), irmaos(Z, W) ; pai(Z, X), mae(W, Y), irmaos(Z, W)).

sobrinhos(X, Y) :- (pai(Z, X), irmaos(Z, Y) ; mae(Z, X), irmaos(Z, Y)).

netos(X, Y) :- (pai(Y, Z), pai(Z, X)) ; (pai(Y, Z), mae(Z, X)) ; (mae(Y, Z), pai(Z, X)) ; (mae(Y, Z), mae(Z, X)).
