:- module(print, []).

:- use_module(util).


printVida([Nome,VidaAtu,VidaMax,_,_,_,_,_,_,_,_]) :-
    write(Nome),
    write("           "),
    write(VidaAtu),
    write("/"),
    write(VidaMax),
    write("\n\n").


inicioJogo(Nome) :-
    shell(clear),
    writeln("Você acorda em um local que você nunca viu antes,"),
    writeln("somente com as roupas do seu corpo."),
    writeln("Você não sabe onde está..."),
    writeln("Tudo o que você sabe é o que você \nleu no bilhete que estava na sua mão quando acordou..."),
    writeln("Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE.\n"),
    writeln("Você lembra do seu nome?... "), 
    lerString(Nome).

printLobby(Opcao,Per) :-
    writeln("           #   LOBBY   #\n\n\n"),
    printVida(Per),
    writeln("[1] -> Fases"),
    writeln("[2] -> Loja"),
    writeln("[3] -> Bolsa"),
    writeln("[4] -> Baú"),
    writeln("[5] -> Créditos"),
    writeln("[6] -> Sair"),
    writeln("\nDigite sua opção:  "),
    lerNumero(Opcao).

printFases(Opcao,Per) :-
    shell(clear),
    writeln("              #   MAPAS   #\n\n"),

    printVida(Per),

    writeln("Com grandes escolhas vem grande responsabilidades.\nEscolha sabiamente.\n"),
    writeln("[1] -> Manguezal"),
    writeln("[2] -> Casa"),
    writeln("[3] -> Jogoses Voraz"),
    writeln("[4] -> Piloto"),
    writeln("[5] -> Área 51"),
    writeln("[6] -> BOSS"),
    writeln("[7] -> sair"),
    writeln("\nEscolha sabiamente a fase desejada... "),
    lerNumero(Opcao).

printLoja(Opcao, Per) :-
    shell(clear),
    writeln("              #       LOJA      #\n\n"),
    writeln("[1] -> Comprar uma arma"),
    writeln("[2] -> Comprar uma armadura"),
    writeln("[3] -> Comprar uma poção"),
    writeln("[4] -> sair\n\n"),
    writeln("Digite sua escolha: "),
    lerNumero(Opcao).

descrMapa([Nome, Descricao, _, _]) :-
    shell(clear),
    writeln("Você está no mapa:\n"),
    writeln(Nome),
    string_concat("\n    +-> ", Descricao, Texto),
    writeln(Texto),
    write("\n\n\n\n").

leOpMapa(Op) :-
    lerNumero(X),
    (X > 0, X < 4) -> Op is X;
    leOpMapa(Op).

printMapa(Opcao) :-
    write("\n"),
    writeln("[1] -> Entrar em uma batalha"),
    writeln("[2] -> Vasculhar sua bolsa"),
    writeln("[3] -> Pausa para o café"),
    writeln("\nQual a sua escolha? "),
    leOpMapa(Opcao).

estrelinhas :- 
    writeln("****************************************\n").

divisorias :-
    writeln("////////////////////////////////////////////////////////////////////////////////\n").

atkCritico :-
    writeln("Ataque Crítico!  ").

printHeroiAtaca(Nome, Dano) :-
    write("\n"),
    write(Nome),
    write(" deu "),
    write(Dano),
    write(" de dano."), nl.

printInimigoAtaca([Nome,_,_,_,_,_,_,_], Dano) :-
    write(Nome),
    write(" deu "),
    write(Dano),
    write(" de dano."), nl.

printEsquiva(Nome) :-
    write(Nome),
    write(" se esquivou.\n").

printInimigoTomaDano([Nome,_,VidaAtu,_,_,_,_,_], Dano) :-
    VidaAtu =< 0,
    writeln("Você tá chutando cachorro morto...").

printInimigoTomaDano([Nome,_,VidaAtu,_,_,_,_,_], Dano) :-
    VidaAtu > 0,
    write(Nome),
    write(" recebeu "),
    write(Dano),
    write(" de dano."), nl.

printHeroiTomaDano(Nome, Dano) :-
    write(Nome),
    write(" recebeu "),
    write(Dano),
    write(" de dano."), nl.

lostBattle(Perda) :-
    write("\n\n"),
    estrelinhas,
    write("Oxe doido tu perdeu feião visse ;(\n"),
    write("Você perdeu "),
    write(Perda),
    write(" moedas.\n\n"),
    estrelinhas,
    digite.

wonBattle(Nome, Loot) :-
    write("\n\n"),
    estrelinhas,
    write("Parabéns "),
    write(Nome),
    write(".\n"),
    write("Você ganhou "),
    write(Loot),
    write(" moedas.\n\n"),
    estrelinhas,
    digite.

interfaceAtk([]) :- write("\n\n"),!.

interfaceAtk([[Nome,_,VidaAtu,VidaMax,_,_,_,_]|Inimigos]) :-
    write(Nome),
    write("                    "),     % 20 espaços
    write(VidaAtu),
    write("/"),
    write(VidaMax), nl,
    interfaceAtk(Inimigos).

escolhaTipoAtk(Heroi, GrupoInimigos, Opcao) :-
    % digite
    shell(clear),


    % CRIA A INTERFACE DA BATALHA
    writeln("              #   BATALHA    #\n"),

    printVida(Heroi),
    interfaceAtk(GrupoInimigos),

    writeln("\nComo você quer atacar?\n"),
    writeln("[1] -> Ataque Forte"),
    writeln("[2] -> Ataque Fraco"),
    writeln("\nDigite sua opção: "),
    lerOpcaoAtk(Opcao),
    auxEscolheTipoAtk(Opcao).

lerOpcaoAtk(Opcao) :-
    lerNumero(Ler), verifica(Opcao, Ler).

verifica(Opcao, 1) :- 
    Opcao is 1.

verifica(Opcao, 2) :- 
    Opcao is 2.

verifica(Opcao,_) :- 
    lerOpcaoAtk(Opcao).

auxEscolheTipoAtk(1) :-
    writeln("Você selecionou ataque FORTE.\n"),!.

auxEscolheTipoAtk(2) :-
    writeln("Você selecionou ataque FRACO.\n"),!.

auxAtkInim(1) :- write("\n").
auxAtkInim(Ind) :- write("").

printAtkInimigo(Ind, []) :- write("").

printAtkInimigo(Ind, [ [Nome,_,VidaAtu,VidaMax,_,_,_,_] |Inimigos ]) :-
    auxAtkInim(Ind),
    write("Atacar: ["),
    write(Ind),
    write("] "),
    write(Nome),
    write(" "),
    write(VidaAtu),
    write("/"),
    writeln(VidaMax),
    Novo is (Ind + 1),
    printAtkInimigo(Novo, Inimigos).

lerEscolhaInimigo(Opcao, Qtd) :-
    lerNumero(X),
    (X > 0, X =< Qtd) -> Opcao is X;
    lerEscolhaInimigo(Opcao,Qtd).

escolheInimigo(Opcao, [Qtd,_,Inimigos]) :-
    printAtkInimigo(1, Inimigos),
    writeln("\nDigite quem você quer atacar: "),
    lerEscolhaInimigo(Opcao, Qtd).

conhecaInimigos([]) :-
    write("").

conhecaInimigos([ [Nome,Descr,VidaAtu,VidaMax,_,_,_,_] | Inimigos ]) :-
    write(Nome),
    write(" "),
    write(VidaAtu),
    write("/"),
    writeln(VidaMax),
    write("    +-> "),
    write(Descr),
    write("\n\n"),
    conhecaInimigos(Inimigos).

entraBatalha(Inimigos) :-
    shell(clear),
    writeln("Você acaba de entrar em uma batalha!!\n"),
    writeln("Conheça seus inimigos:\n"),
    conhecaInimigos(Inimigos).

leOpBau(Op) :-
    lerNumero(X),
    (X > 0, X < 6) -> Op is X;
    leOpBau(Op).


opcoesBau(Opcao) :-
    shell(clear),
    write("              #   BAU    #\n"),
    write ("[1] -> Troque seu equipamento\n"),
    write ("[2] -> Excluir item da Bau\n"),
    write ("[3] -> Visualizar Equipamento\n"),
    write ("[4] -> Vasculhar sua Bolsa\n"),
    write ("[5] -> Voltar ao menu inicial\n"),
    write ("\nO que voce quer fazer?... "),
    leOpBau(Opcao). 


leOpRemoveBolsa(Op) :-
    lerNumero(X),
    (X > 0, X < 5) -> Op is X;
    leOpRemoveBolsa(Op).

opcoesRemoveBolsa(Opcao) :-
    shell(clear),
    write( "              #   BOLSA    #\n\n"),
    write ("[1] -> Visualizar poções\n"),
    write ("[2] -> Usar uma poção\n"),
    write ("[3] -> Jogar uma poção fora\n"),
    write ("[4] -> Voltar a batalhar\n"),
    write ("\n O que voce quer fazer?..."),
    leOpRemoveBolsa(Opcao).