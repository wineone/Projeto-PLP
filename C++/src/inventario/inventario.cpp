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
            if(p.bolsa.pocoes[i].nome != "")
                cout << i + 1 << ") " <<p.bolsa.pocoes[i].nome << " +-> " << p.bolsa.pocoes[i].descricao << endl;
        }
        cout << endl;
    }

    return 0;
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
                printf("Você quer usar uma poção\n"); 
                // usaPocao(p);
                break;
            case 3 :
                printf("Você quer lançar uma poção no limbo \n"); 
                listBag(p);
                break;
            case 4 :
                printf("Você quer voltar para uma batalha muito empolgante \n"); 
                return 0;
            default :
                printf("você não suportou a responsabilidade de escolha \n");
        }
    }
}




