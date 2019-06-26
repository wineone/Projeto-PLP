:- module(bau,[]).

:- use_module(entidades).
:- use_module(print).
:- use_module(util).

/* Funcao que adiciona elementos na Bolsa*/
addPocao(Bolsa,Pocao) :- Bolsa = [Pocao|X, _, _].
addArmadura(Bolsa,Armadura) :- Bolsa = [_, Armadura|Y, _].
addArma(Bolsa,Arma) :- Bolsa = [_, _, Arma|Z].

/* Funcoes que retornam apenas um array da bolsa */
pegaPocao(Per,Pocao) :- Per =[_, _, _,_, _, _, _, _, _, _, [Pocao,_,_]].
pegaArmadura(Per,Armadura) :- Per =[_, _, _,_, _, _, _, _, _, _, [_,Armadura,_]].
pegaArma(Per,Arma) :- Per = [_, _, _,_, _, _, _, _, _, _, [_,_,Arma]].

/* funcao para pegar tamanho de algum array length(Pocao, Retorno)*/

/* REMOVE ELEMENTO DE UM ARRAY*/
removePocao(Element, [Element|Resto], Resto).
removePocao(Element, [H|Resto], [H|Saida]):- removePocao(Element,Resto,Saida).

/* ALTERA O ARRAY DE POCAO DO PERSONAGEM */
renovaPocaoPersonagem(Per,Pocao,NewPer) :- NewPer = Per ,NewPer = [_, _, _,_, _, _, _, _, _, _, [Pocao,_,_]].

/* [(Nome, Descricao, _, Dano, Forca, Agilidade) |Teste] */
percorrePocao(Ind, []) :- write("").
percorrePocao(Ind, Pocao) :- print:pocoes(Ind, Pocao).

bolsaOp(1,Per,NewPer) :- pegaPocao(Per,Pocao),
                        percorrePocao(1,Pocao),
                        nl,
                        digite,
                        gerenciaBolsa(Per,NewPer).


bolsaOp(2,Per,NewPer) :- pegaPocao(Per,Pocao),
                        percorrePocao(1,Pocao),

                        write("Usar uma Pocao"),gerenciaBolsa(Per,NewPer).

bolsaOp(3,Per,NewPer) :- pegaPocao(Per,Pocao), %funcao que retorna o array pocao do personagem
                        percorrePocao(1,Pocao),%Funcao que printa as pocoes
                        lerNumero(Indice),
                        getElement(Pocao, Indice, Element),%funcao que pega o elemento na posicao do indice
                        removePocao(Element,Pocao,Saida), %funcao que remove a pocao do array principal
                        write("Essa pocao e a antiga\n\n"),
                        write(Saida),%ate aqui funcionas
                        write("\n1\n\n"),
                        /*renovaPocaoPersonagem(Per,Saida,Testa),
                        pegaPocao(Testa,NewPocao),
                        write("\n\nEssa pocao e do novo per\n\n"),
                        write(NewPocao),*/
                        digite,
                        gerenciaBolsa(Per,Testa).
                        
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
