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

mae(tereza, maria)
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


% Regras
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

irmao(X, Y) :- pai(Z, X), pai(Z, Y), X \== Y, sexo(X, masculino).
irma(X, Y) :- mae(Z, X), mae(Z, Y), X \== Y, sexo(X, feminino).
irmaos(X, Y) :- pai(Z, X), pai(Z, Y), X \== Y.

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

