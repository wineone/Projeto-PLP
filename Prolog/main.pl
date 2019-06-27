:- initialization main, halt.
% main do jogo

:- use_module(print).
:- use_module(entidades).
:- use_module(fases).
:- use_module(loja).
:- use_module(bau).

loop(Per) :-
			print:printLobby(Op,Per),	
            loopOp(Op,Per).

loopOp(1,Per) :- fases:fases(Per,Novo),loop(Novo).

loopOp(2,Per) :- writeln("Loja"),entidades:lojao(F),loja:loja(Per,F,N),loop(N).
loopOp(3,Per) :- writeln("Bolsa"),bau:gerenciaBolsa(Per,NewPer),loop(NewPer).
loopOp(4,Per) :- writeln("Bau"),bau:bau(Per, NewPer),loop(Per).
loopOp(5,Per) :- writeln("Creditos"),loop(Per).
loopOp(6,Per) :- writeln("Sair"),!.
loopOp(_,Per) :- writeln("Opcao Invalida"),loop(Per).

main :-
    print:inicioJogo(Nome),
    entidades:personagem(Per,Nome),
    loop(Per).
