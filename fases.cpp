#include <bits/stdc++.h>

using namespace std;

Fase faseAtual;

void selecaoDeFase() {
    int opcao;

    while (true) {
        opcao = interfaceFases();
        switch (opcao) {
            case 1:
                printf("vai pra mata atlantica\n");
                break;
            case 2:
                printf("vai pra usina hidreletrica\n");
                break;
            case 3:
                printf("vai pra casa da mãe joana\n");
                break;
            case 4:
                printf("vai pra o meu quarto\n");
                break;
            case 5:
                printf("vai pra siençia da computasao\n");
                break;
            case(6):
                //sair();
                printf("quereu sair\n");
                return ;
            default:
                printf("voce nao escolheu sabiamente >:c\n");
                
        }
    }

    //faseAtual = ...;
}

void mapaDaFase() {
    int opcao = mapaInterface(faseAtual);
}