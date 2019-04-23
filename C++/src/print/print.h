#pragma once

//funcao que imprime o menu do lobby na tela
int getChoice(Personagem &p);

// funcao que imprime o menu de escolha de fases
int interfaceFases();

// função que imprime o menu de escolha dentro de uma fase (i.e., o mapa da fase)
int interfaceMapa(Fase &f);

//funçao que imprime o menu de escolha de uso das poções
int escolhasDaBolsa();

//funçao que imprime o menu de escolha de uso das poções dentro da batalha
int escolhasDaBolsaBatalha();

// funcao que imprime na tela o nome e a vida do heroi
void StatusHeroi(Personagem &heroi);

// funcao que imprime a vida atual do personagem e dos inimigos
void HpCombate(Personagem &p, GrupoDeInimigos gp);

// funcao que recebe o tipo de ataque que o jogador quer executar
int opcoesAtaque();

//escolher qual inimigo vai ser atacado
int ataqueInimigo(GrupoDeInimigos gp);

// imprime mensagem de vitória
void wonBattle(Personagem &p, GrupoDeInimigos gp);

// imprime mensagem de derrota
void lostBattle(GrupoDeInimigos gp);

// personagem digitar enter pra que passe pra proxima tela (com mensagem de aviso ao usuário)
void digite();

//o jogador deve apertar enter para prosseguir
void enter();

// funcao para imprimir a historia do inicio do jogo
void inicioDoJogo();

// imprime barras para divisorias
void divisorias();

// função que demonstra as opções do Bau
int escolhasDoBau();

// Imprime os inimigos de um grupo e seus respectivos status e descrições
void printInimigos(GrupoDeInimigos &gp);


void estrelinhas();

//interface basica da loja
int printLoja();

//lista as armas a serem compradas
int listaArma(Loja &l);

int listaArmadura(Loja &l);

int listaPocoes(Loja &l);
