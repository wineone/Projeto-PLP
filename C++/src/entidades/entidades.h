#pragma once

// atributos iniciais do herói

//arma inicial do jogador
Arma maos();

// armadura inicial
Armadura roupas();

Bolsa bolsa();

// estruturas do jogo

// segunda fase
Fase barquinho();

//primeira fase
Fase piloto();

Inimigo nemesis();

Inimigo pauloGuedes();

Inimigo papaco();

Inimigo conexaoRuim();

Inimigo oCaraAlho();

Inimigo pinky();

Inimigo cerebro();

// Inimigos: pinky e cerebro
GrupoDeInimigos pinkyEcerebro();

// Inimigos: 2 papaco, paulo guedes
GrupoDeInimigos gp1();

// Inimigos: nemesis, paulo guedes
GrupoDeInimigos gp2();

// Inimigos: 2 nemesis
GrupoDeInimigos gp3();

// Inimigos: conexao ruim, o cara alho, cerebro
GrupoDeInimigos gp4();

// Inimigos: conexao Ruim
GrupoDeInimigos gp5();