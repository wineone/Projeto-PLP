
#include <bits/stdc++.h>
#include "inventario/inventario.h"
#include "estruturas/estruturas.h"
#include "print/print.h"
#include "fases/fases.h"
#include "Baú/bau.h"
#include "entidades/entidades.h"


using namespace std;


int main(){
    system("clear");
    string nome;
    cout << "digite seu nome: ";
    cin >> nome;
    getchar();
    Personagem personagem = {nome,98,98,1,1,5,5,10,maos(),roupas(), bolsaInicial()};
    Bau bau = Bau();

    while(true){
        switch(getChoice()){
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
                visualizarBau(bau, personagem);
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
