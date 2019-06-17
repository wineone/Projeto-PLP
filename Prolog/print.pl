:- module(print, [inicio_jogo/1,helloWorld/0]).

inicio_jogo(X) :-
    shell(clear),
    writeln("Você acorda em um local que você nunca viu antes,"),
    writeln("somente com as roupas do seu corpo."),
    writeln("Você não sabe onde está..."),
    writeln("Tudo o que você sabe é o que você \nleu no bilhete que estava na sua mão quando acordou..."),
    writeln("Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE.\n"),
    writeln("Você lembra do seu nome?... "), 
    read(X).

helloWorld :- shell(clear), writeln("Hello World!").