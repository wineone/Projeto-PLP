#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../entidades/entidades.h"
#include "../print/print.h"
#include "fases.h"

using namespace std;

int mapa(Fase f, Personagem p) {
    int opcao;

    while (true) {
        opcao = interfaceMapa(f);

        switch (opcao) {
            case 1:
                // batalha()
                break;
            case 2:
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
        switch (interfaceFases()) {
            case 1:
                mapa(piloto(), p);
                printf("mapa(floresta)\n\n");
                keepGoing = false;
                break;
            case 2:
                // mapa(agua);
                printf("mapa(agua)\n\n");
                keepGoing = false;
                break;
            case 3:
                // mapa(fogo);
                printf("mapa(fogo)\n\n");
                keepGoing = false;
                break;
            case 4:
                // mapa(maeJoana);
                printf("mapa(maeJoana)\n\n");
                keepGoing = false;
                break;
            case 5:
                // mapa(siencia);
                printf("mapa(siencia)\n\n");
                keepGoing = false;
                break;
            case 6:
                printf("Não escolhestes sabiamente!\n\n");
                keepGoing = false;
                break;
            default:
                printf("Você não sabe o que está fazendo.\n\n");
        }
    }
    return 0;
}
