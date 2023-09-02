hombre(carlos). hombre(mario). hombre(sebas).
hombre(luis). hombre(rodrigo). hombre(freddy). 
mujer(claudia). mujer(estefa). mujer(juanita).
mujer(consuelo). mujer(marta).
hijo(estefa, carlos). hijo(estefa, claudia).
hijo(manuel, carlos). hijo(lola, carlos).
hijo(sebas, estefa). hijo(sebas, mario).
hijo(juanita, estefa). hijo(juanita, mario).
hijo(rodrigo, consuelo). hijo(rodrigo, sebas).
hijo(marta, juanita). hijo(marta, luis).
hijo(freddy, juanita). hijo(freddy, luis).
hijo(susana, juanita). hijo(susana, luis).

padre(P, X) :- hijo(X, P), hombre(P).
madre(M, X) :- hijo(X, M), mujer(M).

abuelo(AP, X) :- padre(AP, P), hijo(X, P).
abuela(AM, X) :- madre(AM, M), hijo(X, M).

sexo_opuesto(X, Y) :- hombre(X), mujer(Y).
sexo_opuesto(Y, X) :- hombre(X), mujer(Y).

hermanos(X, Y) :- hijo(X, Z), hijo(Y, Z), X\=Y.
%SE Debe completar el siguiente codigo(solo cambie el codigo donde se encuentre el ...):
tio(X, Y) :-hijo(Y,Z),hermanos(X,Z),hombre(X).
tia(X, Y) :- hijo(Y,Z),hermanos(X,Z),mujer(X).

sobrino(X, Y) :- hijo(X,Z),hermanos(Y,Z).
primos(X,Y) :- hijo(X,H),hijo(Y,L),hermanos(H,L).

%bisabuelo(BAP, X) :- ...
%bisabuela(BAP, X) :- ...

%NO BORRAR
isEqual(A,B):- A==B.
ope(N,R):- isEqual(N,1),abuelo(R,juanita).
ope(N,R):- isEqual(N,2),abuelo(carlos,sebas),R is 1,!.
ope(N,R):- isEqual(N,2),R is 0.
ope(N,R):- isEqual(N,3),hermanos(freddy,marta),R is 1,!.
ope(N,R):- isEqual(N,3),R is 0.
ope(N,R):- isEqual(N,4),hermanos(susana,R).
ope(N,R):- isEqual(N,5),tia(R,rodrigo).
ope(N,R):- isEqual(N,6),sobrino(R,manuel).
ope(N,R):- isEqual(N,7),primos(alejo, sebas),R is 1,!.
ope(N,R):- isEqual(N,7),R is 0.
ope(N,R):- isEqual(N,8),primos(rodrigo, R).
ope(N,R):- isEqual(N,9),primos(_, estefa),R is 1,!.
ope(N,R):- isEqual(N,9),R is 0.
ope(N,R):- isEqual(N,10),abuelo(R, rodrigo).
ope(N,R):- isEqual(N,11),bisabuela(R, susana).
ope(N,R):- isEqual(N,12),bisabuelo(R, freddy).

main:- 
    read(N),findall(R,ope(N,R),L), sort(L,L1),write(L1), halt. 
:- main.
