#include <bits/stdc++.h>

using namespace std;

int getChoice(){
    // system("clear");
    printf("fases (1)\n");
    printf("loja (2)\n");
    printf("bolsa (3)\n");
    printf("inventário (4)\n");
    printf("creditos (5)\n");
    printf("sair (6)\n");
    int opcao;
    printf("\ndigite sua opcao: ");
    scanf("%d",&opcao);
    return opcao;
}


int escolhasDaBolsa(){
    printf("[1] -> vizualizar poções\n");
    printf("[2] -> usar uma poção\n");
    printf("[3] -> jogar uma poção fora\n");
    printf("[4] -> voltar a uma batalha\n");
    printf("\nEscolha o que quer fazer com a poção... ");
    int opcao;
    scanf("%d", &opcao);
    return opcao;
}
