#include "../estruturas/estruturas.h"
#include "entidades.h"

using namespace std;

Inimigo nemesis() {
    Inimigo a = {"Nemesis", "Fei que doi", 100, 15, 10, 10};
    return a;
}


GrupoDeInimigos gangueDosGemeos(){
    Inimigo gp[] = {nemesis(), nemesis()};
    GrupoDeInimigos b = {gp,2,100};
    return b;
}

Fase piloto(){
    Fase a = {"Piloto", 
                "fase de testes, cuidado senão ele te derruba",
                false,
                gangueDosGemeos(),
                gangueDosGemeos(),
                gangueDosGemeos()};
    return a;
}