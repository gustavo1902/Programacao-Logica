pai(joao,lucas).
pai(joao,joaquim).
pai(pedro,silvia).
pai(joaquim, bruno).

mae(maria,lucas).
mae(maria, joaquim).
mae(laura, silvia).
mae(silvia, bruno).

% Todos que tem filhos são felizes

%São irmãos?
irmao(X, Y) :-
    pai(P, X), pai(P,Y),
    mae(M, X), mae(M,Y),
    X\=Y.

neto(A, B) :-
    pai(P, A), pai(A, B),
    mae(M, A), mae(A, B).

avos(A,C) :- 
    (pai(A,B), pai(B,C)) ;
    (mae(A,B), mae(B,C)) ;
    (pai(A,B), mae(B,C)) ;
    (mae(A,B), pai(B,C)).

% Avó
avoF(A,C) :- mae(A,B), pai(B,C). 
avoF(A,D) :- mae(A,B), mae(B,D).
% Avô
avoM(A,C) :- pai(A,B), pai(B, C). 
avoM(A,D) :- pai(A,B), mae(B, D).

tem_filho(X) :- pai(X, _).
tem_filho(X) :- mae(X, _).
