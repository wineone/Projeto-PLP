:- module(bau,[]).

:- use_module(entidades).
:- use_module(print).
:- use_module(util).

/* Funcao que adiciona elementos na Bolsa*/
addPocao(Bolsa,Pocao) :- Bolsa = [Pocao|X, _, _].
addArmadura(Bolsa,Armadura) :- Bolsa = [_, Armadura|Y, _].
addArma(Bolsa,Arma) :- Bolsa = [_, _, Arma|Z].

getElee

/* [(Nome, Descricao, _, Dano, Forca, Agilidade) |Teste] */
percorrePocao(_,[]).
percorrePocao(Ind, Pocao) :- getElement(Pocao,1,Teste)

                                                                A is Ind+1,
                                                                 write(Ind),write(" "),
                                                                 write(Nome),write(" "),
                                                                 write(Descricao),
                                                                 nl,
                                                                 write("       +-> "),
                                                                 write(Dano), write(" "),
                                                                 write(Forca), write(" "),
                                                                 write(Agilidade), write(" "),
                                                                 percorrePocao(A,Teste).

bolsaOp(1,Per,NewPer) :- write("Vizualizar Uma Pocao"),gerenciaBolsa(Per,NewPer).
bolsaOp(2,Per,NewPer) :- write("Usar uma Pocao"),gerenciaBolsa(Per,NewPer).
bolsaOp(3,Per,NewPer) :- write("Jogar uma pocao fora"),gerenciaBolsa(Per,NewPer).
bolsaOp(4,Per,NewPer) :- NewPer = Per.
bolsaOp(_,Per,NewPer) :- write("NUMSEUMSEI"),gerenciaBolsa(Per,NewPer).

gerenciaBolsa([_, _, _,_, _, _, _, _, _, _, [Pocao,Armadura,Arma]], NewPer) :- 
    print:opcoesRemoveBolsa(Opcao),
    percorrePocao(1,Pocao),
    writeln(Opcao),
    write("VSF2\n"),
    writeln(Str),
    bolsaOp(Opcao,Per,Novo).


bauOp(1,Per,NewPer) :- write("Troque seu equipamento"),bau(Per,NewPer).
bauOp(2,Per,NewPer) :- write("Excluir item do Bau"),bau(Per,NewPer).
bauOp(3,Per,NewPer) :- write("Vizualizar Equipamento"),bau(Per,NewPer).
bauOp(4,Per,NewPer) :- write("Vasculhar sua bolsa"),bau(Per,NewPer).
bauOp(5,Per,NewPer) :- NewPer = Per.
bauOp(_,Per,NewPer) :- write("Ta dificil adivinhar o que voce quer..."),bau(Per,NewPer).

bau(Per, NewPer) :-
    print:opcoesBau(Opcao),
    bauOp(Opcao,Per,NewPer).
