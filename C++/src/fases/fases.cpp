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

int mapa(Fase &f, Personagem &p) {
    int opcao;

    while (true) {
        opcao = interfaceMapa(f);

        switch (opcao) {

            case 1: {
                if(p.vidaAtual > 0){
                    printf("Você acaba de entrar em uma batalha!!\n\n");
                    digite();

                    int grupoAleatorio = selectRandomEnemyGroup(f.qtdDeInimigos);
                    batalhar(p, f.grupo[grupoAleatorio]);
                }else{
                    printf("\n");
                    divisorias();
                    printf("\nEi bixo, tais sem vida visse\n\n");
                    divisorias();
                    printf("\n");
                }
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


int selecaoDeFase(Personagem &p, Fase fases[]) {
    bool keepGoing = true;

    while (keepGoing) {
        printf("    # SELEÇÃO DE MAPAS #    \n\n");

        switch (interfaceFases()) {
            case 1:{
                system("clear");

                mapa(fases[0], p);
                keepGoing = false;
                break;
            }case 2:
                system("clear");
                
                mapa(fases[1], p);
                keepGoing = false;
                break;
            case 3:
                system("clear");
                // fases[2]
                printf("mapa(fogo)\n\n");
                keepGoing = false;
                break;
            case 4:
                system("clear");
                
                // fases[3]
                printf("mapa(maeJoana)\n\n");
                keepGoing = false;
                break;
            case 5:
                system("clear");

                // fases[4]
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
