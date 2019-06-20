:- module(fases,[]).

:- use_module(print).
:- use_module(entidades).


mudaVida([A,B,C,E,F,G,H,I,J,K,L], Vida, Sai) :- Nova is B - Vida, Sai = [A,Nova,C,E,F,G,H,I,J,K,L].


fasesOp(1,Per,Novo) :- entidades:manguezal(X), mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(2,Per,Novo) :- entidades:casa(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(3,Per,Novo) :- entidades:jogosVoraz(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(4,Per,Novo) :- entidades:piloto(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(5,Per,Novo) :- entidades:area51(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(6,Per,Novo) :- entidades:faseBoss(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(_,Per,Novo) :- Novo = Per.


fases(Per,Novo) :-
    print:printFases(Opcao,Per), 
    fasesOp(Opcao,Per,Novo).






% mapaOp(1,Per,Novo) :-  
%     entraBatalha()

mapa(Fase,Per,Novo) :-
    print:descrMapa(Fase),
    print:printMapa(Op),
    mudaVida(Per,5,Novo).

    

