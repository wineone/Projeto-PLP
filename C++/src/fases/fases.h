#pragma once

// o jogador seleciona a fase que quer jogar ou retorna ao lobby
int selecaoDeFase(Personagem &p, Fase fases[]);

// o jogador decide entre batalhar, olhar a bolsa ou voltar ao lobby.
void mapa(Fase &f, Personagem &p);

// seleciona um grupo de inimigos aleatorio para a batalha
int selectRandomEnemyGroup(int quantidadeDeGrupos);