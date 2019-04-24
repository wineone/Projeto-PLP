#pragma once

// ---------------- atributos iniciais do herói ------------------

//arma inicial do jogador
Arma maos();

// armadura inicial
Armadura roupas();

//lança triste
Arma lancaTris();

//arma a dura
Arma armaADura();

Arma adagasSile();

Arma donut();

Arma tridente();

// pocao de atributos null
Pocao pocaoNull();

Bolsa bolsa();

// ------------- estruturas do jogo ---------------------

// FASES

// segunda fase
Fase barquinho();

//primeira fase
Fase piloto();


// INIMIGOS

// inimigo com atributos vazios
Inimigo inimigoNull();

Inimigo nemesis();

Inimigo pauloGuedes();

Inimigo papaco();

Inimigo conexaoRuim();

Inimigo oCaraAlho();

Inimigo pinky();

Inimigo cerebro();

Inimigo gravidaTaubate();

Inimigo filhoGravida();

// GRUPOS DE INIMIGOS

// grupo de inimigos de atributos vazios
GrupoDeInimigos grupoNull();

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

// Inimigos: gravida de taubate, 5 filhos
GrupoDeInimigos gravidaFilhos();