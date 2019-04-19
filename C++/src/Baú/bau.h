#pragma once

#include "../estruturas/estruturas.h"


//todas as funções de remover e trocar fazem a listagem previamente dos itens com seus respectivos indices, para que o jogador possa se orientar na hora de realizar a remoção/troca

// demonstra a opção de excluir alguma armadura
void removeArmadura(Bau bau, Personagem personagem);
// demonstra a opção de excluir alguma arma
void removeArma(Bau bau, Personagem personagem);
// demonstra a opção de excluir alguma poção
void removePocao(Bau bau);
// demonstra a opção de trocar a armadura atual do personagem, por uma do bau
void trocarArmadura(Bau bau, Personagem personagem);
// demonstra a opção de trocar a arma atual do personagem, por uma do bau
void trocarArma(Bau bau, Personagem personagem);

// lista todas as poções armazenadas no bau
void listPocoes(Bau bau);

// lista todas as armaduras armazenadas no bau
void listArmaduras(Bau bau, Personagem personagem);

// lista todas as armas armazenadas no bau
void listArmas(Bau bau, Personagem personagem);

// permite interagir com  as opcoes disponiveis na interface do bau
int visualizarBau(Bau bau, Personagem personagem);
