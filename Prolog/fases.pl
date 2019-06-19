:- module(fases,[]).

:- use_module(print).

fases(Per,Novo) :-
    print:printFases(Opcao,Per), Novo = Per.