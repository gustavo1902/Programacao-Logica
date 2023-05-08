% 01º exercício
analisa_lista([], _, _) :-
    write('A lista está vazia.').
analisa_lista([Head], _, _) :-
    Tail = [], % lista com apenas um elemento
    write('A cabeca da lista eh: '), write(Head), nl,
    write('A cauda da lista eh: []').
analisa_lista([Head|Tail], _, _) :-
    Tail \= [], % lista com dois ou mais elementos
    write('A cabeca da lista eh: '), write(Head), nl,
    write('A cauda da lista eh: '), write(Tail).

% 02º exercício
remove_duplicados([], []).
remove_duplicados([H|T], [H|T1]) :- 
    delete(T, H, T2),
    remove_duplicados(T2, T1).

% 03º exercício
troca([], _, _, []).
troca([X|T], X, Y, [Y|R]) :- troca(T, X, Y, R).
troca([H|T], X, Y, [H|R]) :- H \= X, troca(T, X, Y, R).

% 04º exercício
potencia([], [[]]).
potencia([H|T], P) :-
    potencia(T, P1),
    findall([H|Subset], (member(Subset, P1)), NewSubsets),
    append(P1, NewSubsets, P).

% 05º exercício
mais_longa([], [_|_]).
mais_longa([_|_], []) :- fail.
mais_longa([_|T1], [_|T2]) :- mais_longa(T1, T2).


% 06º exercício
distancia((X1,Y1), (X2,Y2), Dist) :-
    Dist is sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2).

% 07º exercício
quadrado(0, _).
quadrado(N, C) :- 
    N > 0,
    write_row(N, C),
    nl,
    N1 is N - 1,
    quadrado(N1, C).

write_row(0, _).
write_row(N, C) :- 
    N > 0,
    write(C),
    N1 is N - 1,
    write_row(N1, C).


% 08º exercício
elemento_n(List, N, Elemento) :-
    N0 is N - 1,
    nth0(N0, List, Elemento).

% 09º exercício
media(List, Media) :-
    sum_list(List, Soma),
    length(List, Tamanho),
    Media is Soma / Tamanho.

% 10º exercício
minimo(List, Result) :- min_list(List, Result).

% 11º exercício
intervalo(Inf, Sup, [Inf|Result]) :- Inf < Sup, NextInf is Inf + 1, intervalo(NextInf, Sup, Result).
intervalo(Sup, Sup, []).

% 12º exercício
mdc(A, 0, A) :- !.
mdc(A, B, X) :- 
    R is A mod B,
    mdc(B, R, X).

% 13º exercício
ocorrencias(_, [], 0).
ocorrencias(X, [X|T], N) :- ocorrencias(X, T, N1), N is N1+1.
ocorrencias(X, [_|T], N) :- ocorrencias(X, T, N).

% 14º exercício
divisores(N, Div) :- divisores_aux(N, 1, Div).

divisores_aux(N, I, []) :- I > N.
divisores_aux(N, I, [I|T]) :- N mod I =:= 0, I1 is I+1, divisores_aux(N, I1, T).
divisores_aux(N, I, T) :- I1 is I+1, divisores_aux(N, I1, T).

%---------------------------------------------------------------%

gosta(joao, pizza).

soma_lista([], 0).
soma_lista([Head|Tail], Soma) :-
    soma_lista(Tail, Soma1),
    Soma is Head + Soma1.
