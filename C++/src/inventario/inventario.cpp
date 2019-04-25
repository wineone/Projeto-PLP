#include <bits/stdc++.h>
#include "inventario.h"

#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "../print/print.h"
#include "../entidades/entidades.h"

using namespace std;

void listBag(Personagem &p){
    
    if(p.bolsa.quantidade == 0)
       cout << "Sua Bolsa está vazia" << endl;
    else{
        for(int i = 0 ; i < p.bolsa.max ; i++){
            if(p.bolsa.pocoes[i].nome != ""){
                cout << "[" << i + 1 << "] -> " << p.bolsa.pocoes[i].nome << "\n    +-> " << p.bolsa.pocoes[i].descricao << endl;
                if(p.bolsa.pocoes[i].vida != 0)
                    cout << "       Vida ->" << p.bolsa.pocoes[i].vida << endl;
            }
        }
        cout << endl;
    }

    return ;
}

void removePocao(Personagem &p, int indice) {
    int qtd = p.bolsa.quantidade;

    if (indice >= 0 && indice < qtd) {
        Pocao aux = p.bolsa.pocoes[qtd - 1];
        p.bolsa.pocoes[indice] = aux;
        p.bolsa.pocoes[qtd - 1] = {"","",0,0}; 

        p.bolsa.quantidade--;
    }
}

void jogaPocao(Personagem &p){
    listBag(p);
    int indice = removePocao(p.bolsa.quantidade);
    
    if (indice == -1)
        return;
    else 
        removePocao(p, indice);
}

void usaPocao(Personagem &p){
    int indice = tomaPocao(p);
    
    if (indice == -1)
        return;
    else if (indice < p.bolsa.quantidade) {
        p.vidaAtual += p.bolsa.pocoes[indice].vida;
    }

    if (p.vidaAtual > p.vidaTotal)
        p.vidaAtual = p.vidaTotal;

    removePocao(p, indice);
}

void bagBatalha(Personagem &p){

    while(true){
        printf("        # INVENTÁRIO #      \n\n\n");

        StatusHeroi(p);
        printf("\n");

        switch(escolhasDaBolsa()){
            case 1:
                system("clear");
                digite();
                printf("                # SUAS POÇÕES #     \n\n\n");
                listBag(p);
                break;
            case 2 :
                printf("Você quer usar uma poção\n");
                usaPocao(p);
                break;
            case 3 :
                printf("Você quer lançar uma poção no limbo \n"); 
                jogaPocao(p);
                break;
            case 4 :
                printf("Você quer voltar para uma batalha muito empolgante \n"); 
                return ;
            default :
                printf("você não suportou a responsabilidade de escolha \n");
        }
    }
}

void addItem(Personagem &p, Pocao &pocao) {
    if (p.bolsa.quantidade + 1 == p.bolsa.max) {
        printf("Sua bolsa está cheia, jogue algo fora.\n\n");
    } else {
        int qtd = p.bolsa.quantidade;
        p.bolsa.pocoes[qtd - 1] = pocao;
        p.bolsa.quantidade++;
        cout << pocao.nome << " adicionada.\n\n";
    }
}