#include "../estruturas/estruturas.h"
#include "entidades.h"

using namespace std;

// Atributos do Herói

Arma maos(){
    Arma a = {"Suas mãos", "Estilo minecraft", 1, 1, 0, 0};
    return a;
}

Armadura roupas() {
    Armadura a = {"Roupas rasgadas", "Você chegou só com as roupas do corpo",1,1,0,0,0};
    return a;
}

Pocao pocaoNull() {
    Pocao nula = {"", "", 0,0,0,0};
    return nula;
}

Bolsa bolsa() {
    Bolsa b = {2, 3,{{"Maconha", "da boa", 10,1,1,1} ,{"Cocaina", "fica no cheirinho", 1,100,-1,0},pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull()}};
    return b;
}

// Estruturas do jogo

// Fases
Fase piloto(){
    Fase a = {"Piloto",
            "fase de testes, cuidado senão ele te derruba",
            false,
            {gp1(), gp2(), gp3(), grupoNull(), grupoNull(), grupoNull()},
            3};

    return a;
}

Fase barquinho() {
    Fase b = { "Barquinho", "Cuidado pra não enjoar",
                false, 
                pinkyEcerebro(), gp4(), gp5(), grupoNull(), grupoNull(), grupoNull(),
                3};
    
    return b;                
}


// Inimigos
Inimigo inimigoNull() {
    Inimigo a = {"","",0,0,0,0,0,0};
    return a;
}

Inimigo nemesis() {
    Inimigo a = {"Nemesis", "Fei que doi", 50, 50, 5, 5, 5, 5};
    return a;
}

Inimigo pauloGuedes() {
    Inimigo p = {"Paulo Guedes", "Eu vo privatiza ese jogo", 17, 17, 3, 3, 3, 3};
    return p;
}

Inimigo papaco() {
    Inimigo z = {"Papaco", "Pistoleiro", 20, 20, 4, 4, 4, 4};
    return z;
}

Inimigo pinky() {
    Inimigo p = {"Pinky", "Irmão do Cérebro", 25, 25, 3, 2, 4, 2};
    return p;
}

Inimigo cerebro() {
    Inimigo c = {"Cérebro", "Irmão do Pinky", 20, 20, 2, 2, 4, 2};
    return c;
}

Inimigo oCaraAlho() {
    Inimigo c = {"O Cara Alho", "Só um cara com mal hálito", 25, 25, 4,4,4,4};
    return c;
}

Inimigo conexaoRuim() {
    Inimigo c = {"Conexão Ruim", 
                "Seu maior inimigo em dias de jogar ou de enviar o trabalho de última hora",
                50, 50, 5, 6, 1, 2};
    return c;
}

// Grupos

GrupoDeInimigos grupoNull() {
    GrupoDeInimigos gp = {inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()};
    return gp;
}

GrupoDeInimigos gp1() {
    GrupoDeInimigos gp = {{papaco(), papaco(), pauloGuedes(),inimigoNull(),inimigoNull(),inimigoNull()},
                          3, 100};
    return gp;
}

GrupoDeInimigos gp2() {
    GrupoDeInimigos gp = {{nemesis(), pauloGuedes(), inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()}, 2, 100};
    return gp;
}

GrupoDeInimigos gp3(){
    GrupoDeInimigos b = {{nemesis(), nemesis(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()},
                        2,100};
    return b;
}

GrupoDeInimigos gp4() {
    GrupoDeInimigos g = {conexaoRuim(), oCaraAlho(), cerebro(), inimigoNull(), inimigoNull(), inimigoNull(),
                        3, 200};
    return g;                       
}

GrupoDeInimigos gp5() {
    GrupoDeInimigos g = {conexaoRuim(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(),
                        1, 50};
    return g;                    
}

GrupoDeInimigos pinkyEcerebro() {
    GrupoDeInimigos g = {pinky(), cerebro(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(), 2, 20};
    return g;
}