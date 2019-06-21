:- module(batalha,[]).

:- use_module(util).
:- use_module(print).


batalha(Per,Lista,Novo) :-
    write(Lista),
    print:escolhaTipoAtk(Per,Lista,Opcao),
    Novo = Per, 
    lerString(K).