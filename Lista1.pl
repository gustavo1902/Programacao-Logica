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
% 05º exercício
% 06º exercício
% 07º exercício
% 08º exercício
% 09º exercício
% 10º exercício
% 11º exercício
% 12º exercício
% 13º exercício

%---------------------------------------------------------------%

gosta(joao, pizza).

soma_lista([], 0).
soma_lista([Head|Tail], Soma) :-
    soma_lista(Tail, Soma1),
    Soma is Head + Soma1.
