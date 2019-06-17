% main do jogo

:- use_module(print).

fat(0, 1).
fat(X,K) :- X > 0,
            A is X - 1,
            fat(A, Y),
            K is (X * Y).

main :-
    read(Y),(
        Y =:= 1 -> (inicio_jogo(X),writeln(X));(
            Y =:= 2 -> helloWorld;(
                Y =:= 3 -> writeln("opcao 3"); (
                    (fat(Y,Z),writeln(Z))
                )
            )
        )
    ).
