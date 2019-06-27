:- module(bau,[]).

:- use_module(entidades).
:- use_module(print).
:- use_module(util).

/* Funcao que adiciona elementos na Bolsa*/
addPocao(Bolsa,Pocao) :- Bolsa = [Pocao|X, _, _].
addArmadura(Bolsa,Armadura) :- Bolsa = [_, Armadura|Y, _].
addArma(Bolsa,Arma) :- Bolsa = [_, _, Arma|Z].

/* Funcoes que retornam apenas um array da bolsa */
pegaPocao(Per,Pocao) :- Per = [_, _, _,_, _, _, _, _, _, _, [Pocao,_,_]].
pegaArmadura(Per,Armadura) :- Per =[_, _, _,_, _, _, _, _, _, _, [_,Armadura,_]].
pegaArma(Per,Arma) :- Per = [_, _, _,_, _, _, _, _, _, _, [_,_,Arma]].

/* funcao para pegar tamanho de algum array length(Pocao, Retorno)*/

removeItem(X, [X|T], T).
removeItem(X, [H|T], [H|T1]):- removeItem(X,T,T1).


/* REMOVE ELEMENTO DE UM ARRAY*/
removePocao(Element, [Element|Resto], Resto).
removePocao(Element, [H|Resto], [H|Saida]):- removePocao(Element,Resto,Saida).

/* ALTERA O ARRAY DE POCAO DO PERSONAGEM */
% Heroi = [Nome, VidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, [PocaoOld,Armadura,Arma]]

renovaPocaoPersonagem([N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [PocaoOld,Armadura,Arma]],Pocao,NovaPer) :-
                                        NovaPer = [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura,Arma]].

usaPocao([_,_,_,VidaPocao], [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, Bolsa],NewPer) :-
                                                     NewVida is  V + VidaPocao,((NewVida > Vi) -> NovaVIDA  is Vi;NovaVIDA is NewVida),
                                                NewPer = [N, NovaVIDA, Vi, D, De, F, A, Dinh, Ar, Arma1, Bolsa].
                                        
/* [(Nome, Descricao, _, Dano, Forca, Agilidade) |Teste] */
percorrePocao(Ind, []) :- write("").
percorrePocao(Ind, Pocao) :- print:pocoes(Ind, Pocao).

bolsaOp(1,Per,NewPer) :- pegaPocao(Per,Pocao),
                        percorrePocao(1,Pocao),
                        nl,
                        digite,
                        gerenciaBolsa(Per,NewPer).

bolsaOp(2,Per,NewPer) :-pegaPocao(Per,Pocao),
                        percorrePocao(1,Pocao),
                        lerNumero(Indice),
                        getElement(Pocao, Indice, Element),
                        usaPocao(Element,Per,NovoPer),
                        nl,
                        removePocao(Element,Pocao,Saida),
                        renovaPocaoPersonagem(NovoPer,Saida,NewNovoPer),
                        digite,
                        gerenciaBolsa(NewNovoPer,NewPer).

bolsaOp(3,Per,NewPer) :- pegaPocao(Per,Pocao), %funcao que retorna o array pocao do personagem
                        percorrePocao(1,Pocao),%Funcao que printa as pocoes
                        lerNumero(Indice),
                        getElement(Pocao, Indice, Element),%funcao que pega o elemento na posicao do indice
                        write("Voce eliminou essa Poçao: \n"),                       
                        print:pocoes(Indice, [Element]),nl,
                        removePocao(Element,Pocao,Saida), %funcao que remove a pocao do array principal
                        renovaPocaoPersonagem(Per,Saida,NovaPer),
                        digite,
                        gerenciaBolsa(NovaPer,NewPer).
                        
bolsaOp(4,Per,NewPer) :- NewPer = Per.

bolsaOp(_,Per,NewPer) :- write("NUMSEI\n\n"),gerenciaBolsa(Per,NewPer).

gerenciaBolsa(Per, NewPer) :- 
    print:opcoesRemoveBolsa(Opcao),
    bolsaOp(Opcao,Per,NewPer).








bauOp(1,Per,NewPer) :- write("Troque seu equipamento"),print:opcoesTrocaItens(Opcao),bau(Per,NewPer).
bauOp(2,Per,NewPer) :- write("Excluir item do Bau"),print:printRemoveItemBau(Opcao),bau(Per,NewPer).
bauOp(3,Per,NewPer) :- print:vizualizarEquipamento(Per),bau(Per,NewPer).
bauOp(4,Per,NewPer) :- gerenciaBolsa(Per,NewPer),bau(Per,NewPer).
bauOp(5,Per,NewPer) :- NewPer = Per.
bauOp(_,Per,NewPer) :- write("Ta dificil adivinhar o que voce quer..."),bau(Per,NewPer).

bau(Per, NewPer) :-
    print:opcoesBau(Opcao),
    bauOp(Opcao,Per,NewPer).
