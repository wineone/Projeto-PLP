#include <bits/stdc++.h>
#include "estruturas/estruturas.h"
#include "print/print.h"
#include "fases/fases.h"
#include "inventarios/inventario.h"

using namespace std;

personagem joga;

int main(){
    system("clear");
    string nome;
    cout << "digite seu nome: ";
    cin >> nome;
    getchar();

    while(true){
        switch(getChoice()){
            case(1):
                selecaoDeFase();
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
