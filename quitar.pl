quitar(_, [], []).
quitar(Elemento, [Elemento|Resto], ListaResultado) :-
    quitar(Elemento, Resto, ListaResultado).
quitar(Elemento, [Cabeza|Resto], [Cabeza|ListaResultado]) :-
    Elemento \= Cabeza,
    quitar(Elemento, Resto, ListaResultado).
