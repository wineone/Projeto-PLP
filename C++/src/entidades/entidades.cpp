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

Inimigo nemesis() {
    Inimigo a = {"Nemesis", "Fei que doi", 100, 100, 15, 10, 10};
    return a;
}


GrupoDeInimigos gangueDosGemeos(){
    // Inimigo gp[] = {nemesis(), nemesis()};
    GrupoDeInimigos b = {{nemesis(), nemesis()},2,100};
    return b;
}

Fase piloto(){
    // GrupoDeInimigos gp[3] = {gangueDosGemeos(), gangueDosGemeos(), gangueDosGemeos()};
    Fase a = {"Piloto", 
                "fase de testes, cuidado senão ele te derruba",
                false,
                {gangueDosGemeos(), gangueDosGemeos(), gangueDosGemeos()}, 
                3};
    return a;
}
