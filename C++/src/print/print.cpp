#include <bits/stdc++.h>
#include "../inventario/inventario.h"
#include "../estruturas/estruturas.h"
#include "../fases/fases.h"
#include "../batalha/batalha.h"

#include "print.h"

using namespace std;

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

int interfaceFases() {
    printf("[1] -> Manguezal\n");
    printf("[2] -> Casa\n");
    printf("[3] -> Jogoses Voraz\n");
    printf("[4] -> Piloto\n");
    printf("[5] -> Barquinho\n");
    printf("[6] -> BOSS\n");
    printf("[7] -> sair");
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
    printf("\n");
    return opcao;
}

int escolhasDaBolsa(){
    printf("[1] -> Visualizar poções\n");
    printf("[2] -> Usar uma poção\n");
    printf("[3] -> Jogar uma poção fora\n");
    printf("[4] -> Voltar a batalhar\n");
    printf("\nO que você quer fazer?... ");
    int opcao;
    scanf("%d", &opcao);
    return opcao;
}

void StatusHeroi(Personagem &heroi) {
    cout << heroi.nome;
    for(int i = 0; i < (30 - heroi.nome.size()); i++)
        cout << " ";
    cout << heroi.vidaAtual << "/" << heroi.vidaTotal << endl << endl;
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
  printf("[1] -> Troque seu equipamento\n");
  printf("[2] -> Excluir um item do Baú\n");
  printf("[3] -> Visualizar equipamento\n");
  printf("[4] -> Vasculhar sua bolsa\n");
  printf("[5] -> Organizar sua bolsa\n");
  printf("[6] -> Voltar ao menu inicial\n");
  int opcao;
  printf("\nO que você vai querer hoje? ");
  scanf("%d", &opcao);
  return opcao;
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
    printf("*****************************");
}


int printLoja(Personagem &p){
    system("clear");
    setbuf(stdin,NULL);
    cout << "Você tem : " << p.dinheiro << " de dinheiro" << endl;
    int opcao;
    do{
        printf("#       LOJA      #\n\n");
        printf("[1] -> Comprar uma arma\n");
        printf("[2] -> Comprar uma armadura\n");
        printf("[3] -> Comprar uma poção\n");
        printf("[4] -> sair\n\n");
        printf("Digite sua opção: ");
        scanf("%d",&opcao);
    }while(opcao < 0 || opcao > 4);
    return opcao;
}

int listaArma(Loja &l){
    int opcao;
    setbuf(stdin,NULL);
    do{
        for(int i = 1; i <= l.quantArmas; i++){
            Arma a = l.armas[i-1];
            cout << "["<<  i << "] -> nome: " << a.nome << endl;
            cout << "       descrição: " << a.descricao << endl;
            cout << "       (dano: " << a.dano << "/ força: " << a.forca << "/ agilidade: " << a.agilidade << ")\n";
            cout << "       preço: " << a.preco << endl;
        }
        printf("digite sua opcao: ");
        scanf("%d",&opcao);
    }while(opcao < 1 || opcao > l.quantArmas);
    return opcao;
}


int listaArmadura(Loja &l){
    int opcao;
    setbuf(stdin,NULL);
    do{
        for(int i = 1; i <= l.quantArmaduras; i++){
            Armadura a = l.armaduras[i-1];
            cout << "["<<  i << "] -> nome: " << a.nome << endl;
            cout << "       descrição: " << a.descricao << endl;
            cout << "       ( armadura: " << a.armadura << "/ força: " << a.forca << "/ agilidade: " << a.agilidade << "/ vida: " << a.vida <<")\n";
            cout << "       preço: " << a.preco << endl;
        }
        printf("digite sua opcao: ");
        scanf("%d",&opcao);
    }while(opcao < 1 || opcao > l.quantArmaduras);
    return opcao;
}

int listaPocoes(Loja &l){
    int opcao;
    setbuf(stdin,NULL);
    do{
        for(int i = 1; i <= l.quantPocoes; i++){
            Pocao a = l.pocoes[i-1];
            cout << "["<<  i << "] -> nome: " << a.nome << endl;
            cout << "       descrição: " << a.descricao << endl;
            cout << "       + Vida-> (" << a.vida <<")\n";
            cout << "       preço: " << a.preco << endl;

        }
        printf("Digite sua opçao");
        scanf("%d",&opcao);
    }while(opcao < 1 || opcao > l.quantPocoes);
    return opcao;
}

void listaPocoes(Bau &bau) {
	if (bau.indPocoes < 0) {
		printf("Você não tem poções! Vá tomar água enquanto isso.\n\n");
	} else {
		for (int i = 1; i <= bau.indPocoes + 1; i++) {
			Pocao p = bau.pocoes[i - 1];
			cout << "[" << i << "] -> nome: " << p.nome << endl;
			cout << "       descrição: " << p.descricao << endl;
			cout << "       (";
			verificaStatus(p.vida);
			cout << ")\n";
			cout << "       preço: " << p.preco << endl;
		}
	}
}

void verificaStatus(int status) {
	if (status >= 0)
		cout << "+" << status;
	else
		cout << status;
}

int opcoesBolsaBau() {
	int opcao;
	printf("Como você deseja organizar a sua bolsa?\n\n");
	printf("[1] -> Mover poção do Baú para a Bolsa\n");
	printf("[2] -> Mover poção da Bolsa para o Baú\n");
	printf("[3] -> Cancelar\n");

    printf("O que você quer fazer? ");
	scanf("%d", &opcao);
	return opcao;
}

int escolhaUmaPocao(int range) {
    int opcao = -1;

    do {
        printf("[0] -> Cancelar\n\n");
        printf("Digite o número da poção escolhida [1, %d] ", range + 1);
        scanf("%d", &opcao);

        if (opcao < 0 || opcao > range + 1) {
            printf("Esse número não fez sentido. Tente de novo\n");
        }
    } while (opcao < 0 || opcao > range + 1);

    return opcao - 1; // retorna como índice pronto para ser usado no array
}

int removePocao(int range) {
    int opcao = -1;

    do {
        printf("[0] -> Cancelar\n\n");
        printf("Digite o índice da poção que deseja remover: ");
        scanf("%d", &opcao);

        if (opcao < 0 || opcao > range + 1) {
            printf("Esse número não fez sentido. Tente de novo\n");
        }
    } while (opcao < 0 || opcao > range + 1);

    return opcao - 1;
}

int tomaPocao(Personagem &p) {
    int opcao = -1;

    do {
        printf("\n[0] -> Cancelar\n\n");
        listBag(p);
        printf("\nQual poção você quer usar?  \n");
        scanf("%d", &opcao);

        if (opcao > p.bolsa.quantidade || opcao < 0) {
            printf("Índice inválido. Tente de novo..");
        }
    } while (opcao > p.bolsa.quantidade || opcao < 0);

    return opcao - 1;
}

int excluirItem() {
    int opcao = -1;

    do {
        printf("[1] -> Excluir uma Armadura\n");
        printf("[2] -> Excluir uma Arma\n");
        printf("[3] -> Excluir uma Poção\n");
        printf("[4] -> Sair\n");
        printf("\nQual a sua opção? ");
        scanf("%d", &opcao);

        if (opcao < 1 || opcao > 4)
            printf("Opção inválida. Tente de novo\n");
    } while (opcao < 1 || opcao > 4);

    return opcao;
}

int trocarEquipamento() {
    int opcao = -1;

    do {
        printf("[1] -> Trocar uma Arma\n");
        printf("[2] -> Trocar uma Armadura\n");
        printf("[3] -> Sair\n");

        printf("\nQual a sua opção? ");
        scanf("%d", &opcao);

        if (opcao < 1 || opcao > 3)
            printf("Opção inválida. Tente de novo\n");
    } while (opcao < 1 || opcao > 3);

    return opcao;
}
