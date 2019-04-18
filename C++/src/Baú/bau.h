#pragma once

#include "../estruturas/estruturas.h"

// permite interagir com  as opcoes disponiveis na interface do bau
int visualizarBau(Bau bau, Personagem joga);
// lista todas as poções armazenadas no bau
void listPocoes(Bau bau);
// lista todas as armaduras armazenadas no bau
void listArmaduras(Bau bau, Personagem joga);
// lista todas as armas armazenadas no bau
void listArmas(Bau bau, Personagem joga);

void removeArmadura(Bau bau, Personagem joga);

void removeArma(Bau bau, Personagem joga);

void removePocao(Bau bau);
