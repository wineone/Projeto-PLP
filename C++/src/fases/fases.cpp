#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../entidades/entidades.h"
#include "../print/print.h"
#include "../batalha/batalha.h"

#include "fases.h"

using namespace std;

int selectRandomEnemyGroup(int quantidadeDeGrupos) {
    srand((unsigned)time(0));
    return (rand()%quantidadeDeGrupos);
}

int mapa(Fase f, Personagem p) {
    int opcao;

    while (true) {
        opcao = interfaceMapa(f);

        switch (opcao) {

            case 1: {
                printf("Você acaba de entrar em uma batalha!!\n\n");
                digite();
                
                int grupoAleatorio = selectRandomEnemyGroup(f.qtdDeInimigos);
                batalhar(p, f.grupo[grupoAleatorio]);
                break;

            }case 2:
                // bolsa()
                break;
            case 3:     // opcao: voltar para o lobby
                return 0;   // volta pra funcao anterior
            default:
                printf("O que você pensa que está fazendo??\n\n");
        }
    }
}


int selecaoDeFase(Personagem p) {
    bool keepGoing = true;
    
    while (keepGoing) {
        printf("    # SELEÇÃO DE MAPAS #    \n\n");

        switch (interfaceFases()) {            
            case 1:{
                system("clear");
                mapa(piloto(), p);
                keepGoing = false;
                break;
            }case 2:
                system("clear");
                // mapa(agua);
                printf("mapa(agua)\n\n");
                keepGoing = false;
                break;
            case 3:
                system("clear");
                printf("mapa(fogo)\n\n");
                keepGoing = false;
                break;
            case 4:
                system("clear");
                // mapa(maeJoana);
                printf("mapa(maeJoana)\n\n");
                keepGoing = false;
                break;
            case 5:
                system("clear");
                // mapa(siencia);
                printf("mapa(siencia)\n\n");
                keepGoing = false;
                break;
            case 6:
                system("clear");
                printf("Não escolhestes sabiamente!\n\n");
                keepGoing = false;
                break;
            default:
                printf("Você não sabe o que está fazendo.\n\n");
        }

        digite();
        system("clear");
    }    
    return 0;
}