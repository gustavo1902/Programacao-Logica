%fatos
progenitor(maria, alessandra).
progenitor(joao, alessandra).
progenitor(maria, isolda).
progenitor(joao, isolda).
progenitor(maria, luis).
progenitor(joao, luis).
progenitor(maria, alencar).
progenitor(joao, alencar).

progenitor(jose, gilberto).
progenitor(luzia, gilberto).
progenitor(luzia, gilmar).
progenitor(jose, gilmar).
progenitor(luzia, maura).
progenitor(jose, maura).
progenitor(luzia, eder).
progenitor(jose, eder).

progenitor(alessandra, gustavo).
progenitor(gilberto, gustavo).
progenitor(alessandra, guilherme).
progenitor(gilberto, guilherme).

progenitor(isolda, flavia).
progenitor(wilson, flavia).
progenitor(isolda, tiago).
progenitor(wilson, tiago).

progenitor(eder, felipe).
progenitor(ivanilda, felipe).
progenitor(eder, daniel).
progenitor(ivanilda, daniel).

progenitor(alencar, walter).
progenitor(cida, walter).
progenitor(alencar, sabrina).
progenitor(cida, sabrina).

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

% Regras
irmao(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \== Y, sexo(X, masculino).
irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \== Y, sexo(X, feminino).
irmaos(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \== Y.

descendente(X, Y) :- progenitor(Y, X).
descendentes(X, Y) :- progenitor(Y, X).

% Regras
mae(X, Y) :- progenitor(X, Y), sexo(X, feminino).
pai(X, Y) :- progenitor(X, Y), sexo(X, masculino).

% Regras
filho(X, Y) :- progenitor(Y, X), sexo(X, masculino).
filha(X, Y) :- progenitor(Y, X), sexo(X, feminino).
filhos(X, Y) :- progenitor(Y, X).

% Regras
avo(X, Y) :- progenitor(X, Z), progenitor(Z, Y), sexo(X, masculino).
avoh(X, Y) :- progenitor(X, Z), progenitor(Z, Y), sexo(X, feminino).
avos(X, Y) :- progenitor(X, Z), progenitor(Z, Y).

% Regras
tio(X, Y) :- progenitor(Z, Y), irmao(X, Z).
tia(X, Y) :- progenitor(Z, Y), irma(X, Z).
tios(X, Y) :- progenitor(Z, Y), irmaos(X, Z).

% Regras
primo(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W), sexo(X, masculino).
prima(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W), sexo(X, feminino).
primos(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W).

% Regras
sobrinho(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W), sexo(X, masculino).
sobrinha(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W), sexo(X, feminino).
sobrinhos(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmaos(Z, W).

% Regras
neto(X, Y) :- progenitor(Y, Z), progenitor(Z, X), sexo(X, masculino).
neta(X, Y) :- progenitor(Y, Z), progenitor(Z, X), sexo(X, feminino).
netos(X, Y) :- progenitor(Y, Z), progenitor(Z, X).

