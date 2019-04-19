#pragma once

//funcao que imprime o menu do lobby na tela
int getChoice();

// funcao que imprime o menu de escolha de fases
int interfaceFases();

// função que imprime o menu de escolha dentro de uma fase (i.e., o mapa da fase)
int interfaceMapa(Fase f);

//funçao que imprime o menu de escolha de uso das poções
int escolhasDaBolsa();

// funcao que imprime na tela o nome e a vida do heroi
void StatusHeroi(Personagem heroi);

// função que demonstra as opções do Bau
int escolhasDoBau();
