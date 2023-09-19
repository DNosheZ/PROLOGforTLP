fibonacci(X, Y) :-
    fibonacci(X, 0, 1, Y).

fibonacci(0, A, _, A).
fibonacci(X, A, B, Y) :-
    X > 0,
    NextX is X - 1,
    NextB is A + B,
    fibonacci(NextX, B, NextB, Y).
