invertir_numero(Number, Reversed) :- invertir_numero(Number, 0, Reversed).
invertir_numero(0, Reversed, Reversed).
invertir_numero(Number, Accumulator, Reversed) :-
    Number > 0,
    Digit is Number mod 10
    NextNumber is Number // 10,
    NewAccumulator is Accumulator * 10 + Digit,
    invertir_numero(NextNumber, NewAccumulator, Reversed).
