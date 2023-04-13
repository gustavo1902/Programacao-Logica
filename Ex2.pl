%fatos de geração
%Quem gerou quem
gerou(antonio, erica).
gerou(emilia, erica).
gerou(antonio, fabio).
gerou(emilia, fabio).
gerou(penha, suzy).
gerou(roberto, suzy).
gerou(roberto, catarina).
gerou(cacilda, catarina).
gerou(cacilda, joao).
gerou(joaquim, joao).
gerou(fabio, marilia).
gerou(suzy, marilia).

%Gênero da pessoa
feminino(emilia).
feminino(erica).
feminino(penha).
feminino(cacilda).
feminino(suzy).
feminino(catarina).
feminino(marilia).
masculino(antonio).
masculino(roberto).
masculino(joaquim).
masculino(joao).
masculino(fabio).

%Regras para a base
% X é filho de Y ?
filho(X,Y) :-
    gerou(Y,X).

% X é mãe de Y?
mae(X,Y) :-
    gerou(X,Y),
    feminino(X).

% X é pai de Y?
pai(X,Y) :-
    gerou(X,Y),
    masculino(X).

% X é avô ou avó de Y?
avo(X,Z) :-
    gerou(X,Y),
    gerou(Y,Z).

% X é irmão de Y, independente de ser do mesmo pai ou mãe
irmao(X, Y) :-
    (pai(Z, X), pai(Z, Y)); % O ; representa ou
    (mae(W, X), mae(W, Y)).
