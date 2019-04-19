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

Bolsa bolsaInicial() {
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
