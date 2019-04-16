#pragma once
// #ifndef ENTIDADES_H
// #define ENTIDADES_H

#include "../estruturas/estruturas.h"

using namespace std;

Inimigo nemesis = {"Nemesis", "Fei que doi", 100, 15, 10, 10};

Inimigo gp[] = {nemesis,nemesis};

GrupoDeInimigos gangueDosGemeos = {gp,2,100};

Fase piloto = {"Piloto", 
               "fase de testes, cuidado senão ele te derruba",
               false,
               gangueDosGemeos,
               gangueDosGemeos,
               gangueDosGemeos};

// #endif