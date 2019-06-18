:- module(print, []).

inicioJogo(Nome) :-
    shell(clear),
    writeln("Você acorda em um local que você nunca viu antes,"),
    writeln("somente com as roupas do seu corpo."),
    writeln("Você não sabe onde está..."),
    writeln("Tudo o que você sabe é o que você \nleu no bilhete que estava na sua mão quando acordou..."),
    writeln("Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE.\n"),
    writeln("Você lembra do seu nome?... "), 
    read(Nome).

printLobby(Opcao) :-
    writeln("           #   LOBBY   #\n\n\n"),
    writeln("[1] -> Fases"),
    writeln("[2] -> Loja"),
    writeln("[3] -> Bolsa"),
    writeln("[4] -> Baú"),
    writeln("[5] -> Créditos"),
    writeln("[6] -> Sair"),
    writeln("\nDigite sua opção:  "),
    read(Opcao).

