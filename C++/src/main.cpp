#include <bits/stdc++.h>
#include "inventario/inventario.h"
#include "estruturas/estruturas.h"
#include "print/print.h"
#include "fases/fases.h"
#include "Baú/bau.h"
#include "entidades/entidades.h"
#include "loja/loja.h"


using namespace std;


void inicializaEstruturas(string nome, Personagem &personagem, Fase fases[], Bau &bau, Loja &loja) {
    personagem = {nome,100,100,10,10,5,5,10,maos(),roupas(), bolsa()}; 				// tem q mudar isso aqui
    bau = Bau();
    fases[0] = piloto();
    fases[1] = barquinho();

    //loja
    loja.armas[0] = maos();
    loja.armas[1] = maos();
    loja.armas[2] = maos();
    loja.armas[3] = maos();
    loja.quantArmas = 4;
}

int main(){
    srand((unsigned)time(0));
    system("clear");

    inicioDoJogo();
    string nome;
    getline(cin,nome);

    printf("\n\n\n");

    // declaração das estruturas
    Personagem personagem;
    Fase fases[2];
    Bau bau;
    Loja venda;

    inicializaEstruturas(nome, personagem, fases, bau, venda);

    // loop do jogo
    while(true){
        printf("    # LOBBY #    \n");

        switch(getChoice(personagem)){
            case(1):
                system("clear");
                selecaoDeFase(personagem, fases);
                break;
            case(2):
                system("clear");
                loja(venda);
                printf("loja foi chamada\n");
                break;
            case(3):
                system("clear");
                bag();
                break;
            case(4):
                system("clear");
                visualizarBau(bau, personagem);
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
