#include <bits/stdc++.h>
#include "../inventario/inventario.h"
#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "../batalha/batalha.h"

#include "print.h"

using namespace std;

int interfaceFases() {
    printf("[1] -> Piloto\n");
    printf("[2] -> Barquinho\n");
    printf("[3] -> Not Found\n");
    printf("[4] -> NAN\n");
    printf("[5] -> siençia da computasao\n");
    printf("[6] -> sair");
    printf("\n\nEscolha sabiamente a fase desejada... ");

    int opcao;
    scanf("%d", &opcao);
    return opcao;
}


int interfaceMapa(Fase &f) {
    printf("Você está no mapa: \n");

    cout << endl << f.nome << endl << endl;
    cout <<  "    +-> " << f.descricao << endl;
    printf("\n\n\n\n\n");

    printf("[1] -> Entrar em uma batalha\n");
    printf("[2] -> Vasculhar sua bolsa\n");
    printf("[3] -> Pausa pro café\n");

    printf("\nQual a sua escolha?  ");

    int opcao;
    scanf("%d", &opcao);
    return opcao;
}

int escolhasDaBolsa(){
    printf("[1] -> Visualizar poções\n");
    printf("[2] -> Usar uma poção\n");
    printf("[3] -> Jogar uma poção fora\n");
    printf("[4] -> Voltar a uma batalha\n");
    printf("\nEscolha o que quer fazer com a poção... ");
    int opcao;
    scanf("%d", &opcao);
    return opcao;
}


void StatusHeroi(Personagem &heroi) {
    cout << endl << heroi.nome ;
    for(int i = 0; i < (30 - heroi.nome.size()); i++)
        cout << " ";
    cout << heroi.vidaAtual << "/" << heroi.vidaTotal << endl << endl;
}

int getChoice(Personagem &p){
    printf("\n\n\n");
    StatusHeroi(p);
    printf("[1] -> Fases\n");
    printf("[2] -> Loja\n");
    printf("[3] -> Bolsa\n");
    printf("[4] -> Baú\n");
    printf("[5] -> Créditos\n");
    printf("[6] -> Sair\n");
	int opcao;
    printf("\n\nDigite sua opcao: ");
    scanf("%d",&opcao);
    return opcao;
}


void HpCombate(Personagem &p, GrupoDeInimigos gp) {
    cout << endl;
    StatusHeroi(p);
    for (int i = 0; i < gp.quantidade; i++) {
        cout << gp.gangue[i].nome;
        for(int j = 0; j < (30 - gp.gangue[i].nome.size()); j++)
            cout << " ";
        cout  << gp.gangue[i].vidaAtual << "/" << gp.gangue[i].vidaTotal << endl;
    }
}

int opcoesAtaque() {
    int opcao;
    do{
        printf("\n\n\n\n\n");
        printf("Como você quer atacar?\n\n");
        printf("[1] -> Ataque Forte\n");
        printf("[2] -> Ataque Fraco\n");
        printf("\nDigite sua opção: ");

        scanf("%d", &opcao);

        switch (opcao) {
            case 1: {
                printf("\nVocê selecionou ataque FORTE\n");
                break;
            } case 2: {
                printf("\nVocê selecionou ataque FRACO\n");
                break;
            }
        }
    }while(opcao != 1 && opcao != 2);

    return opcao;
}


int ataqueInimigo(GrupoDeInimigos gp){
    int opcao;
    do{
        printf("\n\n\n\n");

        for(int i = 1; i <= gp.quantidade; i++){
            cout << "atacar: " << gp.gangue[i-1].nome << " [" << i << "]" << " ";

            if (gp.gangue[i - 1].vidaAtual <= 0) {
                cout << "MORTO\n\n";
            } else {
                cout << gp.gangue[i - 1].vidaAtual << "/" << gp.gangue[i - 1].vidaTotal << "\n\n";
            }
        }
        printf("Digite quem você quer atacar: ");
        scanf("%d",&opcao);

    }while(opcao < 1 || opcao > gp.quantidade);
}

void wonBattle(Personagem &p, GrupoDeInimigos gp) {
    cout << "Parabéns " << p.nome << "." << endl;
    printf("Você ganhou %d moedas.\n\n", gp.dinheiroLoot);
}

void lostBattle(GrupoDeInimigos gp) {
    printf("Oxe doido tu perdeu feião visse ;(\n");
    cout << "Você perdeu " << gp.dinheiroLoot * 0.1 << " moedas.\n\n";
}

void digite(){
    setbuf(stdin,NULL);
    printf("\nDigite enter para continuar...");
    getchar();
}

void enter() {
    setbuf(stdin,NULL);
    getchar();
}

void inicioDoJogo() {
    printf("Tecle enter para prosseguir\n\n");
    enter();

    printf("Você acorda em um local que você nunca viu antes,");
    enter();
    printf("somente com as roupas do seu corpo.");
    enter();
    printf("Você não sabe onde está...");
    enter();
    printf("Tudo o que você sabe é o que você leu no bilhete que estava na sua mão quando acordou...");
    enter();
    printf("Para escapar desse mundo, você deve derrotar o temível *insira o nome aqui*.\n");
    enter();

    printf("Você lembra do seu nome?...  ");
}

void divisorias() {
    printf("////////////////////////////////////////////////////////////////////////////////\n");
}

int escolhasDoBau(){
  printf("[1] -> trocar armadura atual\n");
  printf("[2] -> trocar  arma atual\n");
  printf("[3] -> excluir uma armadura\n");
  printf("[4] -> excluir uma arma\n");
  printf("[5] -> excluir uma poção\n");
  printf("[6] -> voltar ao menu principal\n");
}

void printInimigos(GrupoDeInimigos &gp){
    system("clear");
    printf("Conheça seus inimigos:\n\n");
    for(int i = 0; i < gp.quantidade; i++){
        Inimigo ini = gp.gangue[i];
        cout << ini.nome << " " << ini.vidaAtual << "/" << ini.vidaTotal << endl;
        cout << "    +-> " << ini.descricao << "\n\n";
    }
    digite();
}

void estrelinhas(){
    printf("*****************************\n");
}