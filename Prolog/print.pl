:- module(print, []).


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
    read(Nome).

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
    read(Opcao).

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
    read(Opcao).

