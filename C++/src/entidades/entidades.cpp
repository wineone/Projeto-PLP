#include "../estruturas/estruturas.h"
#include "entidades.h"

using namespace std;

Arma maos(){
    Arma a = {"Suas mãos", "Estilo minecraft", 1, 1, 0, 0};
    return a;
}

Armadura roupas() {
    Armadura a = {"Roupas rasgadas", "Você chegou só com as roupas do corpo",1,1,0,0,0};
    return a;
}

Bolsa bolsa() {
    Bolsa b = {0, 1};
    return b;
}

Inimigo inimigoNull() {
    Inimigo a = {"","",0,0,0,0,0,0};
    return a;
}

GrupoDeInimigos grupoNull() {
    GrupoDeInimigos gp = {inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()};
    return gp;
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

GrupoDeInimigos gp3(){
    GrupoDeInimigos b = {{nemesis(), nemesis(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()},
                        2,100};
    return b;
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

Fase piloto(){
    Fase a = {"Piloto",
            "fase de testes, cuidado senão ele te derruba",
            false,
            {gp1(), gp2(), gp3(), grupoNull(), grupoNull(), grupoNull()},
            3};

    return a;
}

Inimigo pinky() {
    Inimigo p = {"Pinky", "Irmão do Cérebro", 25, 25, 3, 2, 4, 2};
    return p;
}

Inimigo cerebro() {
    Inimigo c = {"Cérebro", "Irmão do Pinky", 20, 20, 2, 2, 4, 2};
    return c;
}

GrupoDeInimigos pinkyEcerebro() {
    GrupoDeInimigos g = {pinky(), cerebro(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(), 2, 20};
    return g;
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

Fase barquinho() {
    Fase b = { "Barquinho", "Cuidado pra não enjoar",
                false, 
                pinkyEcerebro(), gp4(), gp5(), grupoNull(), grupoNull(), grupoNull(),
                3};
    
    return b;                
}