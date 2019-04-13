#include <bits/stdc++.h>

using namespace std;

struct personagem{
    string nome;

    int dano = 0;
    int defesa = 0;
    int vida = 98;
    int forca = 5;
    int agilidade = 5;

    int dinheiro;

    Arma arma;
    Armadura armadura;

    Bolsa bolsa;
};


int getChoice(){
    // system("clear");
    printf("fases (1)\n");
    printf("loja (2)\n");
    printf("bolsa (3)\n");
    printf("inventário (4)\n");
    printf("creditos (5)\n");
    printf("sair (6)\n");
    int opcao;
    printf("\ndigite sua opcao: ");
    scanf("%d",&opcao);
    return opcao;
}

struct Arma{
    string nome;
    string descricao;
    int preco;
    int dano;//100
    int forca;//5
    int agilidade;//0
};

struct Armadura{
    string nome;
    string descricao;
    int preco;
    int armadura;//10
    int forca;//5
    int agilidade;//0
    int vida;//5
};

struct Pocao{
    string nome;
    string descricao;
    int preco;
    int forca;//5
    int agilidade;//0
    int vida;//0
};

struct Bolsa{
    int quantidade;
    int max;
    Pocao pocoes[200];
};

struct Inimigo{
    string nome;
    string descricao;

    int vida;  
    int dano
    int forca;
    int agilidade;
};

/*

vida: 100 + forca*0.5 + vidaArmadura
dano: 100 + 0.1*for
esquiva: (rand() 1 .. 100) < (rand() 1 .. 10 + 0.40%agi)
critico: (rand() 1 .. 100) < (rand() 1 .. 10 + 0.40%agi)
armadura: danoTomado 

500 -100 = 400
400 - 350 = 50

*/
