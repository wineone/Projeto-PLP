#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "loja.h"

using namespace std;


void loja(Loja &loja){
    while(true){
        switch(printLoja()){
            case 1:
                compraArma(loja);
                break;
            case 2:
                printf("comprar armadura\n");
                break;
            case 3:
                printf("comprar uma poção\n");
                break;
            case 4:
                printf("#     quereu sair      #\n");
                digite();
                return;
        }
        digite();
    }
}

void compraArma(Loja &loja){
    listaArma(loja);
}

void compraArmadura(Loja &loja){

}

void compraPocao(Loja &loja){

}


