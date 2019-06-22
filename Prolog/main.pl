:- initialization main, halt.
% main do jogo

:- use_module(print).
:- use_module(entidades).
:- use_module(fases).
:- use_module(loja).


/* modelo de como vai funcionar alterar a vida do personagem/inimigos */
mudaVida([A,B,C,D,E], Vida, Sai) :- Nova is B - Vida, Sai = [A,Nova,C,D,E].

loop(Per) :- print:printLobby(Op,Per),
             loopOp(Op,Per).

loopOp(1,Per) :- fases:fases(Per,Novo),loop(Novo).
loopOp(2,Per) :- writeln("Loja"),loja:loja(Per,(entidades:lojao),N),loop(N).
loopOp(3,Per) :- writeln("Bolsa"),loop(Per).
loopOp(4,Per) :- writeln("Bau"),loop(Per).
loopOp(5,Per) :- writeln("Creditos"),loop(Per).
loopOp(6,Per) :- writeln("Sair"),!.
loopOp(_,Per) :- writeln("Opcao Invalida"),loop(Per).

main :-
    print:inicioJogo(Nome),
    entidades:personagem(Per,Nome),
    loop(Per).