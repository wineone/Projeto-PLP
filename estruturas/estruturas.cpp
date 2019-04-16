#include <bits/stdc++.h>

using namespace std;

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



struct personagem{
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
};

struct Inimigo{
    string nome;
    string descricao;

    int vida;  
    int dano;
    int forca;
    int agilidade;
};

struct Fase {
    string nome;
    string descricao;
    bool terminada;

    Inimigo enemies[200]; 
};

/* anotacoes sobre as fases
Depois que o player derrota X inimigos ele "derrota" uma fase, ele ganha um loot especial que é único
mas so ganha na primeira vez q derrota aquela fase, da segunda em diante nao tem mais loot especial.
*/

/*
anotacoes

vida: 100 + forca*0.5 + vidaArmadura
dano: 100 + 0.1*for
esquiva: (rand() 1 .. 100) < (rand() 1 .. 10 + 0.40%agi)
critico: (rand() 1 .. 100) < (rand() 1 .. 10 + 0.40%agi)
armadura: danoTomado 

*/