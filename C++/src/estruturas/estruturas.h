#pragma once

#include <bits/stdc++.h>

using namespace std;

typedef struct Arma{
    string nome;
    string descricao;
    int preco;
    int dano;//100
    int forca;//5
    int agilidade;//0
} Arma;

typedef struct Armadura{
    string nome;
    string descricao;
    int preco;
    int armadura;//10
    int forca;//5
    int agilidade;//0
    int vida;//5
} Armadura;

typedef struct Pocao{
    string nome;
    string descricao;
    int preco;
    int forca;//5
    int agilidade;//0
    int vida;//0
} Pocao;

typedef struct Bolsa{
    int quantidade;     // quantidade de itens dentro da bolsa
    int max;            // máximo de itens que cabem na bolsa
    Pocao pocoes[20];


} Bolsa;



typedef struct Personagem{
    string nome;

    int vidaAtual;
    int vidaTotal;

    int dano ;
    int defesa;
    int forca;
    int agilidade;

    int dinheiro;


    Arma arma;
    Armadura armadura;


    Bolsa bolsa;

} Personagem;

typedef struct Inimigo{
    string nome;
    string descricao;

    int vidaAtual;
    int vidaTotal;

    int dano;
    int forca;
    int agilidade;
    int defesa;
} Inimigo;


typedef struct GrupoDeInimigos {
    Inimigo gangue[6];

    int quantidade;
    int dinheiroLoot;
} GrupoDeInimigos;


typedef struct Fase {
    string nome;
    string descricao;
    bool terminada;

    GrupoDeInimigos grupo[6];
    int qtdDeInimigos;
} Fase;

typedef struct Bau{
  Armadura armaduras[50];
  Arma arma[50];
  Pocao pocoes[50];

  int indArmas;
  int indArmaduras;
  int indPocoes;

  
 Bau() {
    indArmas = -1;
    indArmaduras = -1;
    indPocoes = -1;
  }

} Bau;