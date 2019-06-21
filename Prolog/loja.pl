:- module(loja,[]).

:- use_module(print).
:- use_module(entidades).
:- use_module(util).





loja(Per,Loj,N) :-
    print:printLoja(Opcao,Per).