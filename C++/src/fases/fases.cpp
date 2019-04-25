#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../entidades/entidades.h"
#include "../print/print.h"
#include "../batalha/batalha.h"
#include "../inventario/inventario.h"

#include "fases.h"

using namespace std;

int selectRandomEnemyGroup(int quantidadeDeGrupos) {
    srand((unsigned)time(0));
    return (rand()%quantidadeDeGrupos);
}

void mapa(Fase &f, Personagem &p) {
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
                bagBatalha(p);
                break;
            case 3:     // opcao: voltar para o lobby
                return ;   // volta pra funcao anterior
            default:
                printf("O que você pensa que está fazendo??\n\n");
        }
    }
}


int selecaoDeFase(Personagem &p, Fase fases[]) {
    bool keepGoing = true;

    while (keepGoing) {
        printf("    # SELEÇÃO DE MAPAS #    \n\n");

        printf("Com grandes escolhas vem grande responsabilidades.\nEscolha sabiamente.\n\n\n");

        switch (interfaceFases()) {
            case 1:{
                system("clear");
                // manguezal
                mapa(fases[0], p);
                keepGoing = false;
                break;
            }case 2:
                system("clear");
                // casa
                mapa(fases[1], p);
                keepGoing = false;
                break;
            case 3:
                system("clear");
                // jogoses Voraz
                mapa(fases[2], p);
                keepGoing = false;
                break;
            case 4:
                system("clear");
                // piloto
                mapa(fases[3], p);
                keepGoing = false;
                break;
            case 5:
                system("clear");
                // barquinho
                mapa(fases[4], p);
                keepGoing = false;
                break;
            case 6:
                system("clear");
                // printf("BOSSSSS\n");
                // BOSSS
                mapa(fases[5], p);
                keepGoing = false;
                break;
            case 7:
                system("clear");
                printf("Não escolhestes sabiamente!\n\n");
                keepGoing = false;
                break;
            default:
                printf("Você não escolheu sabiamente.\n\n");
        }

        digite();
        system("clear");
    }
    return 0;
}
