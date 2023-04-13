pai(joao,lucas).
%mae(maria,lucas).
pai(joao,joaquim).
%mae(maria,joaquim).
pai(pedro,silvia).
%mae(laura,silvia).
pai(joaquim, bruno).
%mae(silvia, bruno).

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
    
avo(A,C) :- pai(A,B), pai(B,C).
avo(A,C) :- mae(A,B), mae(B,C).
avo(A,D) :- pai(A,D), pai(B,D).
avo(A,D) :- mae(A,D), mae(B,D).



tem_filho(X) :- pai(X, _).
tem_filho(X) :- mae(X, _).

