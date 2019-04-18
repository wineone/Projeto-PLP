// #pragma once

#include <bits/stdc++.h>
#include "../inventario/inventario.h"

#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "print.h"

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

int interfaceFases() {
    printf("[1] -> ambiente mata atlantica\n");
    printf("[2] -> usina hidreletrica de itaipu\n");
    printf("[3] -> casa da mãe joana\n");
    printf("[4] -> o meu quarto\n");
    printf("[5] -> siençia da computasao\n");
    printf("[6] -> sair");
    printf("\nEscolha sabiamente a fase desejada... ");
    int opcao;
    scanf("%d", &opcao);
    return opcao;
}

int interfaceMapa(Fase f) {
    // printf(f.descricao.c_str());
    cout << endl << f.nome << endl << endl;
    cout << f.descricao << endl;
    printf("\n\n\n\n\n");

    printf("[1] -> Entrar em uma batalha\n");
    printf("[2] -> Vasculhar sua bolsa\n");
    printf("[3] -> Pausa pro café\n");
    printf("Qual a sua escolha?  ");
    int opcao;
    scanf("%d", &opcao);
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

void StatusHeroi(Personagem heroi) {
    cout << endl << heroi.nome << "          " << heroi.vidaAtual << "/" << heroi.totalVida << endl << endl;
}