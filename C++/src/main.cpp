#include <bits/stdc++.h>
#include "inventario/inventario.h"
#include "estruturas/estruturas.h"
#include "print/print.h"
#include "fases/fases.h"
#include "entidades/entidades.h"


using namespace std;


int main(){
    srand((unsigned)time(0));
    system("clear");

    inicioDoJogo();
    string nome;
    cin >> nome;
    getchar();
    printf("\n\n\n");

    Personagem personagem = {nome,98,98,10,10,5,5,10,maos(),roupas(), bolsaInicial()};

    while(true){
        printf("    # LOBBY #    ");

        switch(getChoice(personagem)){
            case(1):
                system("clear");
                selecaoDeFase(personagem);
                printf("fases foi chamada\n");
                break;
            case(2):
                system("clear");
                //loja();
                printf("loja foi chamada\n");
                break;
            case(3):
                system("clear");
                bag();
                printf("bolsa foi chamada\n");
                break;
            case(4):
                system("clear");
                //inventario();
                printf("baú foi chamado\n");
                break;
            case(5):
                system("clear");
                //creditos();
                printf("creditos foi chamado\n");
                break;
            case(6):        // sair do jogo
                system("clear");
                printf("quereu sair\n");
                return 0;
            default:
                printf("opcão invalida\n");
        }
    }
    return 0;
}
