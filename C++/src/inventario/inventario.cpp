#include <bits/stdc++.h>
#include "inventario.h"

#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "../print/print.h"
#include "../entidades/entidades.h"

using namespace std;

int listBag(Personagem &p){
    
    if(p.bolsa.quantidade == 0)
       cout << "Sua Bolsa está vazia" << endl;
    else{
        for(int i = 0 ; i < p.bolsa.max ; i++){
            if(p.bolsa.pocoes[i].nome != ""){
                cout << "[" << i + 1 << "] -> " << p.bolsa.pocoes[i].nome << "\n    +-> " << p.bolsa.pocoes[i].descricao << endl;
                if(p.bolsa.pocoes[i].vida != 0)
                    cout << "       Vida ->" << p.bolsa.pocoes[i].vida << endl;
                if(p.bolsa.pocoes[i].forca != 0)
                    cout << "       Forca ->" << p.bolsa.pocoes[i].forca << endl;
                if(p.bolsa.pocoes[i].agilidade != 0)
                    cout << "       Agilidade ->" << p.bolsa.pocoes[i].agilidade << endl;
            }
        }
        cout << endl;
    }

    return 0;
}

// int removePocao(int indice, Personagem &p) {

// }

int jogaPocao(Personagem &p){
    listBag(p);
    int indice;
    cout << "Que poção voce quer jogar?" << endl;
    cin >> indice;
    if(indice <= p.bolsa.quantidade){
        p.bolsa.pocoes[indice-1] = {"", "", 0,0,0,0};
        swap(p.bolsa.pocoes[indice-1],p.bolsa.pocoes[p.bolsa.quantidade-1]);
    }
    return 0;
}

int usaPocao(Personagem &p){
    tomaPocao(p);
    
    if(indice < p.bolsa.quantidade){
        p.vidaAtual += p.bolsa.pocoes[indice-1].vida;
        p.forca += p.bolsa.pocoes[indice-1].forca;
        p.agilidade += p.bolsa.pocoes[indice-1].agilidade;
    }

    swap(p.bolsa.pocoes[indice-1],p.bolsa.pocoes[p.bolsa.quantidade-1]);

}


int bag(Personagem &p){

    while(true){
        printf("        # INVENTÁRIO #      \n\n\n");

        switch(escolhasDaBolsa()){
            case 1:
                printf("Você quer vizualizar as poções que esta carregando\n");
                listBag(p);
                break;
            case 2 :
                printf("Você quer lançar uma poção no limbo \n"); 
                jogaPocao(p);
                break;
            case 3 :
                printf("Você quer voltar para uma batalha muito empolgante \n"); 
                return 0;
            default :
                printf("você não suportou a responsabilidade de escolha \n");
        }
    }
}

int bagBatalha(Personagem &p){

    while(true){
        printf("        # INVENTÁRIO #      \n\n\n");

        bool usouPocao = false;

        switch(escolhasDaBolsaBatalha()){
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
                return 0;
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
        cout << pocao.nome << " adicionada\n\n";
    }
}