#pragma once
#include "../estruturas/estruturas.h"

//LISTA OS NEGOCIOS DA POÇAO
void listBag(Personagem &p);

// função que remove poção do array
void removePocao(Personagem &p, int indice);

void jogaPocao(Personagem &p);

void usaPocao(Personagem &p);

//bolsa carregavel
void bag(Personagem &p);

void bagBatalha(Personagem &p);

// integração com baú
void addItem(Personagem &p, Pocao &pocao);