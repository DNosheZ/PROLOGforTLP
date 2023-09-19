invertir_numero(Number, Reversed) :-
    invertir_numero_helper(Number, 0, Reversed).
invertir_numero_helper(0, Reversed, Reversed).
invertir_numero_helper(Number, PartialReversed, Reversed) :-
    Number > 0,
    Digit is Number mod 10,
    NextNumber is Number // 10,
    NewPartialReversed is PartialReversed * 10 + Digit,
    invertir_numero_helper(NextNumber, NewPartialReversed, Reversed).
