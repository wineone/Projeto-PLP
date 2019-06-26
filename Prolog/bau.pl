:- module(bau,[]).

:- use_module(entidades).
:- use_module(print).
:- use_module(util).

/* Funcao que adiciona elementos na Bolsa*/
addPocao(Bolsa,Pocao) :- Bolsa = [Pocao|X, _, _].
addArmadura(Bolsa,Armadura) :- Bolsa = [_, Armadura|Y, _].
addArma(Bolsa,Arma) :- Bolsa = [_, _, Arma|Z].


pegaPocao(Per,Pocao) :- Per =[_, _, _,_, _, _, _, _, _, _, [Pocao,_,_]].
pegaArmadura(Per,Armadura) :- Per =[_, _, _,_, _, _, _, _, _, _, [_,Armadura,_]].
pegaArma(Per,Arma) :- Per = [_, _, _,_, _, _, _, _, _, _, [_,_,Arma]].


/* [(Nome, Descricao, _, Dano, Forca, Agilidade) |Teste] */
percorrePocao(Ind, []) :- write("").
percorrePocao(Ind, Pocao) :- print:pocoes(Ind, Pocao).

bolsaOp(1,Per,NewPer) :- write("Vizualizar Uma Pocao"),pegaPocao(Per,Pocao),percorrePocao(1,Pocao),nl,gerenciaBolsa(Per,NewPer).
bolsaOp(2,Per,NewPer) :- write("Usar uma Pocao"),gerenciaBolsa(Per,NewPer).
bolsaOp(3,Per,NewPer) :- write("Jogar uma pocao fora"),gerenciaBolsa(Per,NewPer).
bolsaOp(4,Per,NewPer) :- NewPer = Per.
bolsaOp(_,Per,NewPer) :- write("NUMSEI\n\n"),gerenciaBolsa(Per,NewPer).
/* [_, _, _,_, _, _, _, _, _, _, [Pocao,Armadura,Arma]] */

gerenciaBolsa(Per, NewPer) :- 
    print:opcoesRemoveBolsa(Opcao),
    bolsaOp(Opcao,Per,N).


bauOp(1,Per,NewPer) :- write("Troque seu equipamento"),bau(Per,NewPer).
bauOp(2,Per,NewPer) :- write("Excluir item do Bau"),bau(Per,NewPer).
bauOp(3,Per,NewPer) :- write("Vizualizar Equipamento"),bau(Per,NewPer).
bauOp(4,Per,NewPer) :- write("Vasculhar sua bolsa"),bau(Per,NewPer).
bauOp(5,Per,NewPer) :- NewPer = Per.
bauOp(_,Per,NewPer) :- write("Ta dificil adivinhar o que voce quer..."),bau(Per,NewPer).

bau(Per, NewPer) :-
    print:opcoesBau(Opcao),
    bauOp(Opcao,Per,NewPer).
