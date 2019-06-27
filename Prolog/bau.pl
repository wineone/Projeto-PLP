:- module(bau,[]).

:- use_module(entidades).
:- use_module(print).
:- use_module(util).

insereInicio(Element, Lista, [Element|Lista]):- !.

insereFim(Elem, [Element], ListaSaida):- insereInicio(Element,[Elem],ListaSaida), !.
insereFim(NewElement, [Element|Lista], ListaSaida):- insereFim(NewElement,Lista,X), insereInicio(Element, X, ListaSaida).

/* Funcao que adiciona elementos na Bolsa*/
addPocao(Bolsa,Pocao) :- Bolsa = [Pocao|X, _, _].
addArmadura(Bolsa,Armadura) :- Bolsa = [_, Armadura|Y, _].
%addArma(Bolsa,Arma) :- Bolsa = [_, _, Arma|Z].
addArma(Arma,[_,_,[ListaArma]],[Arma|ListaArma]) :- !.

/* Funcoes que retornam apenas um array da bolsa */
pegaPocao(Per,Pocao) :- Per = [_, _, _,_, _, _, _, _, _, _, [Pocao,_,_]].
pegaArmadura(Per,Armadura) :- Per =[_, _, _,_, _, _, _, _, _, _, [_,Armadura,_]].
pegaArma(Per,Arma) :- Per = [_, _, _,_, _, _, _, _, _, _, [_,_,Arma]].

/* funcao para pegar tamanho de algum array length(Pocao, Retorno)*/

/* REMOVE ELEMENTO DE UM ARRAY DE ARMADURA*/
removeArmadura(Element, [Element|Resto], Resto).
removeArmadura(Element, [H|Resto], [H|Saida]):- removeArmadura(Element,Resto,Saida).

/* REMOVE ELEMENTO DE UM ARRAY DE ARMA*/
removeArma(Element, [Element|Resto], Resto).
removeArma(Element, [H|Resto], [H|Saida]):- removeArma(Element,Resto,Saida).

/* REMOVE ELEMENTO DE UM ARRAY DE POCAO*/
removePocao(Element, [Element|Resto], Resto).
removePocao(Element, [H|Resto], [H|Saida]):- removePocao(Element,Resto,Saida).

/* ALTERA O ARRAY DE POCAO DO PERSONAGEM */
% Heroi = [Nome, VidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, [PocaoOld,Armadura,Arma]]


renovaPocaoPersonagem([N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [PocaoOld,Armadura,Arma]],Pocao,NovaPer) :-
                                        NovaPer = [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura,Arma]].


renovaArmaduraPersonagem([N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura1,Arma]], Armadura, NovaPer) :-
                                        NovaPer = [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura,Arma]].


renovaArmaPersonagem([N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura,ArmaOld]], NewArma, NovaPer) :-
                                        NovaPer = [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, [Pocao,Armadura,NewArma]].



usaPocao([_,_,_,VidaPocao], [N, V, Vi, D, De, F, A, Dinh, Ar, Arma1, Bolsa],NewPer) :-
                                                     NewVida is  V + VidaPocao,((NewVida > Vi) -> NovaVIDA  is Vi;NovaVIDA is NewVida),
                                                NewPer = [N, NovaVIDA, Vi, D, De, F, A, Dinh, Ar, Arma1, Bolsa].
    
/* [(Nome, Descricao, _, Dano, Forca, Agilidade) |Teste] */
percorrePocao(Ind, []) :- write("").
percorrePocao(Ind, Pocao) :- print:pocoes(Ind, Pocao).

percorreArmadura(Ind, []) :- write("").
percorreArmadura(Ind, Armadura) :- print:armaduras(Ind, Armadura).

percorreArma(Ind, []) :- write("").
percorreArma(Ind, Arma) :- print:armas(Ind, Arma).



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

%exclui armadura
gerenciaExclusaoOp(1,Per,NewPer) :- pegaArmadura(Per,Armadura),
                                    percorreArmadura(1,Armadura),
                                    write("Digite o indice da armadura que voce deseja excluir:"),   
                                    lerNumero(Indice),
                                    getElement(Armadura, Indice, Element),
                                    write("\n\nVoce eliminou essa Armadura: \n"),   
                                    print:armaduras(Indice, [Element]),nl,
                                    removeArmadura(Element,Armadura,Saida),
                                    renovaArmaduraPersonagem(Per,Saida,NovaPer),
                                    digite,
                                    gerenciaExclusao(NovaPer,NewPer).

%exclui arma
gerenciaExclusaoOp(2,Per,NewPer) :- pegaArma(Per,Arma),
                                    percorreArma(1,Arma),
                                    write("Digite o indice da arma que voce deseja excluir:"),   
                                    lerNumero(Indice),
                                    getElement(Arma,Indice,Element),
                                    write("\n\nVoce eliminou essa Arma: \n"),   
                                    print:armas(Indice, [Element]),nl,
                                    removeArma(Element,Arma,Saida),
                                    renovaArmaPersonagem(Per,Saida,NovaPer),
                                    digite,
                                    gerenciaExclusao(NovaPer,NewPer).

gerenciaExclusaoOp(3,Per,NewPer) :- NewPer = Per.

gerenciaExclusaoOp(_,Per,NewPer) :- write("Errrrrou\n\n"),gerenciaExclusao(Per,NewPer).

gerenciaExclusao(Per,NewPer) :-
    print:printRemoveItemBau(Opcao),
    gerenciaExclusaoOp(Opcao,Per,NewPer).


bauOp(1,Per,NewPer) :- write("Troque seu equipamento"),print:opcoesTrocaItens(Opcao),bau(Per,NewPer).
bauOp(2,Per,NewPer) :- gerenciaExclusao(Per,NewPer),bau(Per,NewPer).
bauOp(3,Per,NewPer) :- print:vizualizarEquipamento(Per),bau(Per,NewPer).
bauOp(4,Per,NewPer) :- gerenciaBolsa(Per,NewPer),bau(Per,NewPer).
bauOp(5,Per,NewPer) :- NewPer = Per.
bauOp(_,Per,NewPer) :- write("Ta dificil adivinhar o que voce quer..."),bau(Per,NewPer).

bau(Per, NewPer) :-
    print:opcoesBau(Opcao),
    bauOp(Opcao,Per,NewPer).
