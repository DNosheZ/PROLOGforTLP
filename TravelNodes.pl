tramo(medellin,cartagena,Avion,200000).
tramo(cartagena,bogota,Bus,40000).
tramo(bogota,cali,Bus,130000).
tramo(cali,popayan,Bus,20000).
tramo(cali,puerto_asis,Bus,90000).
tramo(puerto_asis,mitu,Lancha,150000).
tramo(bogota,bucaramanga,Bus,58000).
tramo(bucaramanga,neiva,Avion,210000).
tramo(neiva,cali,Bus,81000).
% Predicado para encontrar el recorrido óptimo desde Origen hasta Destino.
% enrutar(Origen, Destino, Recorrido, Tipos_transporte, Precio_total, PreciosPorTrayecto).
enrutar(Origen, Destino, Recorrido, Tipos_transporte, Precio_total, PreciosPorTrayecto) :-
    findall([RecorridoOptimo, TiposTransporteOptimos, CostosOptimos, PrecioTotalOptimo, PreciosPorTrayectoOptimos],
            enrutar_helper(Origen, Destino, [Origen], RecorridoOptimo, TiposTransporteOptimos, CostosOptimos, PrecioTotalOptimo, PreciosPorTrayectoOptimos),
            Recorridos),
    mejor_recorrido(Recorridos, Recorrido, Tipos_transporte, Precio_total, PreciosPorTrayecto).

% Encuentra el recorrido óptimo entre varios recorridos posibles.
mejor_recorrido([], [], [], 0, []).
mejor_recorrido([[Recorrido, TiposTransporte, Costos, PrecioTotal, PreciosPorTrayecto]|Resto], RecorridoOptimo, TiposTransporteOptimos, PrecioTotalOptimo, PreciosPorTrayectoOptimos) :-
    mejor_recorrido(Resto, RestoRecorrido, RestoTiposTransporte, RestoPrecioTotal, RestoPreciosPorTrayecto),
    (PrecioTotalOptimo = 0, PrecioTotal > 0; % Inicialización
     PrecioTotal < PrecioTotalOptimo ->
        RecorridoOptimo = Recorrido,
        TiposTransporteOptimos = TiposTransporte,
        PrecioTotalOptimo = PrecioTotal,
        PreciosPorTrayectoOptimos = PreciosPorTrayecto
    ;
        RecorridoOptimo = RestoRecorrido,
        TiposTransporteOptimos = RestoTiposTransporte,
        PrecioTotalOptimo = RestoPrecioTotal,
        PreciosPorTrayectoOptimos = RestoPreciosPorTrayecto
    ).

% Predicado para calcular el costo total de una lista de costos.
costo_total([], 0).
costo_total([Costo|Resto], Total) :-
    costo_total(Resto, RestoTotal),
    Total is Costo + RestoTotal.

% Predicado auxiliar para encontrar recorridos posibles.
enrutar_helper(Origen, Destino, Visitados, [Destino|Visitados], [], [], 0, []) :-
    Origen = Destino. % Caso base cuando se llega al destino sin usar transportes.
enrutar_helper(Origen, Destino, Visitados, Recorrido, TiposTransporte, Costos, PrecioTotal, PreciosPorTrayecto) :-
    tramo(Origen, Intermedio, Medio, Costo),
    not(member(Intermedio, Visitados)), % Evita ciclos
    enrutar_helper(Intermedio, Destino, [Intermedio|Visitados], RecorridoResto, TiposTransporteResto, CostosResto, PrecioTotalResto, PreciosPorTrayectoResto),
    Recorrido = [Intermedio|RecorridoResto],
    TiposTransporte = [Medio|TiposTransporteResto],
    Costos = [Costo|CostosResto],
    PrecioTotal is Costo + PrecioTotalResto,
    PreciosPorTrayecto = [Costo|PreciosPorTrayectoResto].
