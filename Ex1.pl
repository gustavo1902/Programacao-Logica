pai(joao, joaquim).
pai(joao, lucas).
pai(pedro, silvia).
pai(joaquim, bruno).
mae(silvia, bruno).
mae(maria, lucas).
mae(maria, joaquim).
mae(laura, silvia).

% Todos que tem filhos são felizes

%São irmãos?
irmao(X, Y) :-
    pai(P, X), pai(P,Y),
    mae(M, X), mae(M,Y),
    X\=Y.

neto(A, B) :-
    pai(P, A), pai(A, B),
    mae(M, A), mae(A, B).
    
avo(A,C) :- pai(A,B), pai(B,C).
avo(A,C) :- mae(A,B), mae(B,C).

tem_filho(X) :- pai(X, _).
tem_filho(X) :- mae(X, _).

