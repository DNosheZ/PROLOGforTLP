producto(X, Y, Z) :-
    producto(X, Y, 0, Z).

producto(0, _, Acumulador, Acumulador).
producto(X, Y, AcumuladorParcial, Z) :-
    X > 0,
    NuevoAcumuladorParcial is AcumuladorParcial + Y,
    NuevoX is X - 1,
    producto(NuevoX, Y, NuevoAcumuladorParcial, Z).
