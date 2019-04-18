
#include <bits/stdc++.h>
#include "inventario.h"

#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "../print/print.h"
#include "../entidades/entidades.h"

using namespace std;

Bolsa bol;

void fillBag(){
        bol.pocoes[0] ={"Maconha","Da boa" , 1, -1, -1,10};
        bol.pocoes[1] ={"Cocaina","Branca fina" , 10, -10, -20,-100};
        bol.pocoes[2] ={"Crack","Onde é que eu to" , 50, -50, -34,100};
        bol.pocoes[3] ={"Montilla","Só desce com Coca" , 5, -9, -1,102};
       
}
void listBag(){
    for(int i = 0 ; i < 4 ; i++){
        if(bol.pocoes[i].nome != "")
            cout << bol.pocoes[i].nome << " " << bol.pocoes[i].descricao << endl;
    }
}

int bag(){
    int escolha;

    while(true){
        escolha = escolhasDaBolsa();

        switch(escolha){
            case 1:
                printf("Você quer vizualizar as poções que esta carregando\n");
                fillBag();
                listBag();
                break;
            case 2 :
                printf("Você quer usar uma poção\n"); 
                break;
            case 3 :
                printf("Você quer lançar uma poção no limbo \n"); 
                listBag();
                break;
            case 4 :
                printf("Você quer voltar para uma batalha muito empolgante \n"); 
                return 0;
            default :
                printf("você não suportou a responsabilidade de escolha \n");
        }
    }
}




