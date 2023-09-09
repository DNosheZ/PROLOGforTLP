pelicula(1, amores_perros, 2000, mexico, drama).
pelicula(2, dolor_y_gloria, 2019, españa, drama).
pelicula(3, mujeres_al_borde_de_un_ataque_de_nervios, 1988, españa, drama).
pelicula(4, la_musica_del_silencio, 2018, italia, biografia).
pelicula(5, titanic, 1997, estados_unidos, drama).
pelicula(6, mamma_mia, 2008, reino_unido, musical).
pelicula(7, espectro, 2013, mexico, terror).
pelicula(8, rapidos_y_furiosos_6, 2013, reino_unido,accion).


director(mamma_mia,phyllida_lloyd).
director(espectro, alfonso_pineda_ulloa).
director(rapidos_y_furiosos_6, justin_lin).
director(amores_perros, alejandro_gonzález_iñárritu).
director(dolor_y_gloria, pedro_almodovar).
director(mujeres_al_borde_de_un_ataque_de_nervios, pedro_almodovar).
director(la_musica_del_silencio, michael_radford).
director(titanic, james_cameron).
 
actor(la_musica_del_silencio, antonio_banderas, maestro).
actor(la_musica_del_silencio, toby_sebastian, amos_bardi).
actor(la_musica_del_silencio, jordi_mollà, sandro).
actor(amores_perros, gael_garcia_bernal, octavio).
actor(amores_perros, marco_perez, ramiro).
actor(dolor_y_gloria, antonio_banderas, salvador).
actor(dolor_y_gloria, leonardo_sbaraglia, federico).
actor(mujeres_al_borde_de_un_ataque_de_nervios, antonio_banderas, carlos).
actriz(titanic, kate_winslet, rose).
actriz(dolor_y_gloria, penélope_cruz, madre_de_salvador).
actriz(amores_perros, vanessa_bauche, susana).
actriz(dolor_y_gloria, cecilia_roth, zulema).
actriz(mujeres_al_borde_de_un_ataque_de_nervios, carmen_maura, pepa).
actriz(mujeres_al_borde_de_un_ataque_de_nervios, rossy_de_palma, marisa).


genero(A,R):- pelicula(_,A,_,_,B), R = B.
%Aca va su codigo
%Encuentre las películas realizadas después del del 2000 y en las que hayan participado los actores Antonio Banderas y Penélope Cruz; 
%adicionalmente, suministre el nombre del director, el género de la película, el año, y el país de producción.
mayor(Pelicula,Actor,Actriz,Anio,Genero,Director,Pais):- Anio>2000,Actor=antonio_banderas,Actriz=penélope_cruz,pelicula(_, Pelicula, Anio, Pais, Genero),actor(Pelicula,Actor,_),actriz(Pelicula,Actriz,_),director(Pelicula,Director). 
%Aca va su codigo
%cree una regla en prolog que permita encontrar el director de una pelicula donde haya actuado jordi mollà, 
%en qué año se exhibió y de qué país fue la película.
encuentra(Actor,Anio,Pais,Director):- Actor=jordi_mollà,director(Pelicula, Director),pelicula(_, Pelicula, Anio, Pais, _),actor(_, Actor, _).
%Aca va su codigo
%cree una regla en prolog que permita encontrar las películas de género drama, dando año de exhibición, director,actores y actrices, que tengan actores y actrices.
peliculas(Genero,Anio,Pelicula,Director,Actores,Actrices):- Genero=drama,director(Pelicula,Director),pelicula(_, Pelicula, Anio, _,Genero),actor(Pelicula, Actores, _),actriz(Pelicula, Actrices, _).
%Aca va su codigo
%cree una regla en prolog que permita encontrar las películas producidas después de 2012, dando año de exhibición,director.
despues(Anio,Pelicula,Director):- pelicula(_, Pelicula, Anio, _, _),director(Pelicula,Director), Anio>2012.
% NO BORRAR
isEqual(A,B):- A==B.
ope(N,E,R):- isEqual(N,1),mayor(R,E,penélope_cruz,_,_,_,_).
ope(N,E,R):- isEqual(N,2),mayor(_,E,penélope_cruz,R,_,_,_).
ope(N,E,R):- isEqual(N,3),mayor(_,E,penélope_cruz,_,R,_,_).
ope(N,E,R):- isEqual(N,4),mayor(_,E,penélope_cruz,_,_,R,_).
ope(N,E,R):- isEqual(N,17),mayor(_,E,penélope_cruz,_,_,_,R).
ope(N,E,R):- isEqual(N,5),despues(R,_,_),E is 1+4.
ope(N,E,R):- isEqual(N,6),despues(_,R,_),E is 1+3.
ope(N,E,R):- isEqual(N,7),despues(_,_,R),E is 1+2.
ope(N,E,R):- isEqual(N,8),encuentra(E,R,_,_).
ope(N,E,R):- isEqual(N,9),encuentra(E,_,R,_).
ope(N,E,R):- isEqual(N,10),encuentra(E,_,_,R).
ope(N,E,R):- isEqual(N,11),peliculas(E,R,_,_,_,_).
ope(N,E,R):- isEqual(N,12),peliculas(E,_,R,_,_,_).
ope(N,E,R):- isEqual(N,13),peliculas(E,_,_,R,_,_).
ope(N,E,R):- isEqual(N,14),peliculas(E,_,_,_,R,_).
ope(N,E,R):- isEqual(N,15),peliculas(E,_,_,_,_,R).
ope(N,E,R):- isEqual(N,16),aggregate_all(count, pelicula(_,_,_,_,_), R),E is 1+2.

main:- 
    read(N),read(E),findall(R,ope(N,E,R),L), sort(L,L1),write(L1), halt.
:-main.
