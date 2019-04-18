#pragma once

#include "../estruturas/estruturas.h"

// permite interagir com  as opcoes disponiveis na interface do bau
int visualizarBau(Bau bau, personagem joga);
// lista todas as poções armazenadas no bau
void listPocoes(Bau bau);
// lista todas as armaduras armazenadas no bau
void listArmaduras(Bau bau, personagem joga);
// lista todas as armas armazenadas no bau
void listArmas(Bau bau, personagem joga);

void removeArmadura(Bau bau, personagem joga);

void removeArma(Bau bau, personagem joga);

void removePocao(Bau bau);
