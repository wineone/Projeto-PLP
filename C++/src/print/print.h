#pragma once

//funcao que imprime o menu do lobby na tela
int getChoice(Personagem p);

// funcao que imprime o menu de escolha de fases
int interfaceFases();

// função que imprime o menu de escolha dentro de uma fase (i.e., o mapa da fase)
int interfaceMapa(Fase f);

//funçao que imprime o menu de escolha de uso das poções
int escolhasDaBolsa();

// funcao que imprime na tela o nome e a vida do heroi
void StatusHeroi(Personagem heroi);

// funcao que imprime a vida atual do personagem e dos inimigos
void HpCombate(Personagem p, GrupoDeInimigos gp);

// funcao que recebe o tipo de ataque que o jogador quer executar
int opcoesAtaque();

// imprime mensagem de vitória
void wonBattle(Personagem p, GrupoDeInimigos gp);

// imprime mensagem de derrota
void lostBattle(GrupoDeInimigos gp);
