#pragma once


bool acabou(Personagem &p, GrupoDeInimigos gp);

bool esquiva(int a);

bool critico(int a);

int heroiAtaca(Personagem &p, int bd);

int inimigoAtaca(Inimigo i);

void heroiRecebeDano(Personagem &p, int danoinimigo);

void inimigoRecebeDano(Inimigo &i, int be, int dano);

// funcao que executa a batalha entre o jogador e um grupo de inimigos

void batalhar(Personagem &p, GrupoDeInimigos gp);