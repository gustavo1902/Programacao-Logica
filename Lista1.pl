%1
analisa_lista([]) :-
    write('A lista está vazia.').
analisa_lista([Head|Tail]) :-
    Tail = [], % lista com apenas um elemento
    write('A cabeca da lista eh: '), write(Head), nl,
    write('A cauda da lista eh: []').
analisa_lista([Head|Tail]) :-
    Tail \= [], % lista com dois ou mais elementos
    write('A cabeca da lista eh: '), write(Head), nl,
    write('A cauda da lista eh: '), write(Tail).

%2
remove_duplicados([], []).
remove_duplicados([H|T], [H|T1]) :- 
    delete(T, H, T2),
    remove_duplicados(T2, T1).
