:- initialization main, halt.
% main do jogo

:- use_module(print).
:- use_module(entidades).


mudaVida([A,B,C,D,E], Vida, Sai) :- Nova is B - Vida, Sai = [A,Nova,C,D,E].

loop(Per) :- print:printLobby(Op),
             loopOp(Op,Per).

loopOp(1,Per) :- writeln("Fases"),mudaVida(Per,10,Novo),writeln(Novo),loop(Novo).
loopOp(2,Per) :- writeln("Loja"),loop(Per).
loopOp(3,Per) :- writeln("Bolsa"),loop(Per).
loopOp(4,Per) :- writeln("Bau"),loop(Per).
loopOp(5,Per) :- writeln("Creditos"),loop(Per).
loopOp(6,Per) :- writeln("Sair"),!.
loopOp(_,Per) :- writeln("Opcao Invalida"),loop(Per).

main :-
    print:inicioJogo(Nome),
    entidades:personagem(Per,Nome),
    loop(Per).