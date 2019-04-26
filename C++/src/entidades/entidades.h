#pragma once

// ---------------- atributos iniciais do herói ------------------

//arma inicial do jogador
Arma maos();

// armadura inicial


//lança triste
Arma lancaTris();

//arma a dura
Arma armaADura();

Arma adagasSile();

Arma donut();

Arma tridente();
//-------------------------Poções vendidadas na loja ------------------------

Pocao pocaoRestauraVida();

Pocao pocaoBebada();

Pocao pocaoNinja();

Pocao pocaoAjudaAosDogs();

Pocao pocaoStronda();

Pocao pocaoTransformice();

Pocao pocaoTranquila();

Pocao pocaoApelona();

Pocao pocaoCapitao();

Pocao pocaoRedbull();

Pocao pocaoRedBullDupla();

Pocao pocaoCafeComGuarana();

Arma armaConfete();

Arma escudo();

// pocao de atributos null
Pocao pocaoNull();

Bolsa bolsa();


//armaduras do personagem

Armadura roupas();

Armadura mofi();

Armadura barril();

Armadura couro();

Armadura tempes();

Armadura armaDoFim();



// ------------- estruturas do jogo ---------------------

// FASES

//primeira fase BETA
Fase piloto();

// primeira fase(realmente)
Fase manguezal();

// segunda fase BETA
Fase barquinho();

// nivel 2
Fase casa();

// nivel 3
Fase jogosVoraz();

//boss
Fase fBoss();

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

Inimigo louca();

Inimigo chao();

Inimigo parede();

Inimigo meia();

Inimigo ventila();

Inimigo bixo();

Inimigo katenisse();

Inimigo pita();

Inimigo finique();

Inimigo gueiou();

Inimigo esnou();

Inimigo reimite();

Inimigo seneca();

Inimigo cururu();

Inimigo jacare();

Inimigo pato();

Inimigo slime();
//bossssssssssss
Inimigo boss();

Inimigo etBilu();

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

// 3 meias
GrupoDeInimigos gru1();

// meia, bixo, parede
GrupoDeInimigos gru2();

// bixo, ventila, chao
GrupoDeInimigos gru3();

// louca, chao, 2 meia
GrupoDeInimigos gru4();

// 2 meia, louca, ventila
GrupoDeInimigos gru5();

// seneca, reimite
GrupoDeInimigos tributos1fase3();

// pita, katenisse
GrupoDeInimigos tributos2fase3();

// pita, ketenisse, gueiou
GrupoDeInimigos tributos3fase3();

// esnou, katenisse, finique
GrupoDeInimigos tributos4fase3();

// sapo, jacare, sapo
GrupoDeInimigos grup1Fase1();

// pato, slime, slime
GrupoDeInimigos grup2Fase1();

// pato, jacare, sapo
GrupoDeInimigos grup3Fase1();


//grupo do boss
GrupoDeInimigos gBoss();

GrupoDeInimigos gp7();