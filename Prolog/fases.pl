:- module(fases,[]).

:- use_module(print).
:- use_module(entidades).
:- use_module(util).
:- use_module(batalha).


mudaVida([A,B,C,E,F,G,H,I,J,K,L], Vida, Sai) :- Nova is B - Vida, Sai = [A,Nova,C,E,F,G,H,I,J,K,L].


fasesOp(1,Per,Novo) :- entidades:manguezal(X), mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(2,Per,Novo) :- entidades:casa(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(3,Per,Novo) :- entidades:jogosVoraz(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(4,Per,Novo) :- entidades:piloto(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(5,Per,Novo) :- entidades:area51(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(6,Per,Novo) :- entidades:faseBoss(X),mapa(X,Per,Aux),fases(Aux,Novo).
fasesOp(7,Per,Novo) :- Novo = Per.
fasesOp(_,Per,Novo) :- fases(Per,Novo).


fases(Per,Novo) :-
    print:printFases(Opcao,Per), 
    fasesOp(Opcao,Per,Novo).



pegaAleatorio([Cab|Cor],1,Saida) :- Saida = Cab.
pegaAleatorio([Cab|Cor],Ite,Saida) :- N is Ite - 1, pegaAleatorio(Cor,N,Saida).


mapaOp(1,[Nome,Des,QuantGrupo,Lista],Per,Novo) :-  
    % gera numero aleatorio
    Qtd is QuantGrupo + 1,
    random(1, Qtd, RandomNumber),

    pegaAleatorio(Lista,RandomNumber,[QuaInimi,Loot,ListIni]),  /* colocar uma função que gera os numeros aleatorios */
    print:entraBatalha(ListIni),
    lerString(K),
    batalha:batalha(Per,[QuaInimi,Loot,ListIni],Aux),
    mapa([Nome,Des,QuantGrupo,Lista],Aux,Novo).

mapaOp(2,Fase,Per,Novo) :- 
    writeln("Bolsa foi chamada"),
    mapa(Fase,Per,Novo).

mapaOp(3,Fase,Per,Novo) :- Novo = Per.

mapaOp(_,Fase,Per,Novo) :- mapa(Fase,Per,Novo).

mapa(Fase,Per,Novo) :-
    print:descrMapa(Fase),
    print:printMapa(Op),
    mapaOp(Op,Fase,Per,Novo).

    

