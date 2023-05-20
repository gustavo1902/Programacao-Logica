%fatos
mae(maria, alessandra).
pai(joao, alessandra).
mae(maria, isolda).
pai(joao, isolda).
mae(maria, luis).
pai(joao, luis).
mae(maria, alencar).
pai(joao, alencar).

pai(jose, gilberto).
mae(luzia, gilberto).
pai(jose, gilmar).
mae(luzia, gilmar).
pai(jose, maura).
mae(luzia, maura).
pai(jose, eder).
mae(luzia, eder).

mae(alessandra, gustavo).
pai(gilberto, gustavo).
mae(alessandra, guilherme).
pai(gilberto, guilherme).

mae(isolda, flavia).
pai(wilson, flavia).
mae(isolda, tiago).
pai(wilson, tiago).

pai(eder, felipe).
mae(ivanilda, felipe).
pai(eder, daniel).
mae(ivanilda, daniel).

pai(alencar, walter).
mae(cida, walter).
pai(alencar, sabrina).
mae(cida, sabrina).


% Regras
sexo(maria, feminino).
sexo(luzia, feminino).
sexo(alessandra, feminino).
sexo(isolda, feminino).
sexo(maura, feminino).
sexo(ivanilda, feminino).
sexo(cida, feminino).
sexo(sabrina, feminino).
sexo(flavia, feminino).

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

irmao(X, Y) :- pai(Z, X), pai(Z, Y), X \== Y, sexo(X, masculino).
irma(X, Y) :- mae(Z, X), mae(Z, Y), X \== Y, sexo(X, feminino).
irmaos(X, Y) :- pai(Z, X), pai(Z, Y), X \== Y.

descendente(X, Y) :- pai(Y, X).
descendentes(X, Y) :- pai(Y, X).

mae(X, Y) :- mae(X, Y), sexo(X, feminino).
pai(X, Y) :- pai(X, Y), sexo(X, masculino).

filho(X, Y) :- pai(Y, X), sexo(X, masculino).
filha(X, Y) :- pai(Y, X), sexo(X, feminino).
filhos(X, Y) :- pai(Y, X).

avo(X, Y) :- pai(X, Z), pai(Z, Y), sexo(X, masculino).
avoh(X, Y) :- mae(X, Z), mae(Z, Y), sexo(X, feminino).
avos(X, Y) :- pai(X, Z), pai(Z, Y).

tio(X, Y) :- pai(Z, Y), irmao(X, Z).
tia(X, Y) :- mae(Z, Y), irma(X, Z).
tios(X, Y) :- pai(Z, Y), irmaos(X, Z).

primo(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W), sexo(X, masculino).
prima(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W), sexo(X, feminino).
primos(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W).

sobrinho(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W), sexo(X, masculino).
sobrinha(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W), sexo(X, feminino).
sobrinhos(X, Y) :- pai(Z, X), pai(W, Y), irmaos(Z, W).

neto(X, Y) :- pai(Y, Z), pai(Z, X), sexo(X, masculino).
neta(X, Y) :- pai(Y, Z), pai(Z, X), sexo(X, feminino).
netos(X, Y) :- pai(Y, Z), pai(Z, X).

