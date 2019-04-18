
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
    string nome;
    cout << "digite seu nome: ";
    cin >> nome;
    getchar();
    Personagem personagem = {nome,98,98,10,10,5,5,10,maos(),roupas(), bolsaInicial()};

    while(true){
        

        switch(getChoice(personagem)){
            case(1):
                selecaoDeFase(personagem);
                printf("fases foi chamada\n");
                break;
            case(2):
                //loja();
                printf("loja foi chamada\n");
                break;
            case(3):
                bag();
                printf("bolsa foi chamada\n");
                break;
            case(4):
                //inventario();
                printf("inventario foi chamado\n");
                break;
            case(5):
                //creditos();
                printf("creditos foi chamado\n");
                break;
            case(6):
                //sair();
                printf("quereu sair\n");
                return 0;
            default:
                printf("opcão invalida\n");
        }
    }
    return 0;
}
