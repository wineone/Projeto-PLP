// #include "estruturas.cpp"

#pragma once
// #ifndef ESTRUTURAS_H
// #define ESTRUTURAS_H

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
    int quantidade;
    int max;
    Pocao pocoes[200];
} Bolsa;



typedef struct personagem{
    string nome;

    int dano ;
    int defesa;
    int vida;
    int forca;
    int agilidade;

    int dinheiro;


    Arma arma;
    Armadura armadura;


    Bolsa bolsa;

} personagem;

typedef struct Inimigo{
    string nome;
    string descricao;

    int vida;  
    int dano;
    int forca;
    int agilidade;
} Inimigo;

typedef struct GrupoDeInimigos {
    Inimigo* gangue;
    int quantidade;
    int dinheiroLoot;
} GrupoDeInimigos;

typedef struct Fase {
    string nome;
    string descricao;
    bool terminada;

    GrupoDeInimigos n1, n2, n3;
} Fase;


// #endif 