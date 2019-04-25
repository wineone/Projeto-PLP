#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "../inventario/inventario.h"
#include <bits/stdc++.h>
#include <string>

void removeArmadura(Bau &bau, Personagem &personagem){
  listArmaduras(bau, personagem);

  if(bau.indArmaduras != -1){
    int remover;
    cout << "Digite o indice da armadura a ser removida.. ";
    cin >> remover;

    if((remover-1) <= bau.indArmaduras){
      Armadura a = bau.armaduras[remover - 1];
      bau.armaduras[remover - 1] = bau.armaduras[bau.indArmaduras];
      bau.armaduras[bau.indArmaduras] = a;
      bau.indArmaduras--;

      cout << a.nome << " foi removido.\n";
    } else {
      cout << "Esse indice é inválido" << endl;
    }
  }
}

void removeArma(Bau &bau, Personagem &personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != -1) {
    int remover;
    cout << "Digite o indice da arma a ser removida.. ";
    cin >> remover;

    if((remover-1) <= bau.indArmas){
      Arma a = bau.arma[remover - 1];
      bau.arma[remover - 1] = bau.arma[bau.indArmas];
      bau.arma[bau.indArmas] = a;
      bau.indArmas--;

      cout << a.nome << " foi removido.\n";
    } else {
      cout << "Esse indice é inválido" << endl;
    }
  }
}

void removePocaoPrivate(Bau &bau, int indice) {
	if (indice <= bau.indPocoes && indice >= 0) {
    Pocao aux = bau.pocoes[indice];
    bau.pocoes[indice] = bau.pocoes[bau.indPocoes];
    bau.pocoes[bau.indPocoes] = aux;

		bau.indPocoes--;
	}
}

void removePocao(Bau &bau){
  listPocoes(bau);
  if(bau.indPocoes != -1){  // bau nao esta vazio
		int indice = removePocao(bau.indPocoes);
    if (indice == -1)
      return ;
		removePocaoPrivate(bau, indice);
  } else {
		printf("Você não tem poções, vá jogar.\n");
	}
}

void trocarArmadura(Bau &bau, Personagem &personagem){
  if (bau.indArmaduras > -1)
    printf("[0] -> Sair\n");
  listArmaduras(bau, personagem);

  if(bau.indArmaduras != -1){
    int trocar;

    cout << "Digite o indice da armadura que deseja" << endl;
    cin >> trocar;

    if (trocar == 0)  // cancela
      return;

    if((trocar-1) <= bau.indArmaduras){
      Armadura aux = bau.armaduras[trocar-1];
      bau.armaduras[trocar-1] = personagem.armadura;
      personagem.armadura = aux;

      personagem.forca -= bau.armaduras[trocar-1].forca;
      personagem.forca += aux.forca;

      personagem.vidaTotal -= (bau.armaduras[trocar-1].forca / 2);
      personagem.vidaTotal += (aux.forca/2);
      personagem.vidaTotal -= (bau.armaduras[trocar-1].vida);
      personagem.vidaTotal += aux.vida;

      personagem.agilidade -= bau.armaduras[trocar-1].agilidade;
      personagem.agilidade += aux.agilidade;
    } else {
      cout << "Índice inválido" << endl;
    }
  }
}


void trocarArma(Bau &bau, Personagem &personagem){
  if (bau.indArmas > -1)
    printf("[0] -> Sair\n");
  listArmas(bau, personagem);

  if(bau.indArmas != -1){
    int trocar;
    cout << "Então, digite o indice da arma que deseja: " << endl;

    cin >> trocar;
    if (trocar == 0)  //cancela
      return;

    if((trocar-1) <= bau.indArmas){
      Arma aux = bau.arma[trocar-1];
      bau.arma[trocar-1] = personagem.arma;
      personagem.arma = aux;

      personagem.dano -= bau.arma[trocar-1].dano;
      personagem.dano += aux.dano;

      personagem.vidaTotal -= (bau.arma[trocar-1].forca/2);
      personagem.vidaTotal += (aux.forca/2);

      personagem.forca -= (bau.arma[trocar-1].forca);
      personagem.forca += (aux.forca);

      personagem.agilidade -= (bau.arma[trocar-1].agilidade);
      personagem.agilidade += aux.agilidade;
      cout << "Arma equipada com sucesso" << endl;
    } else {
      cout << "Índice inválido" << endl;
    }
  }
}

void listArmaduras(Bau &bau, Personagem &personagem){
    if(bau.indArmaduras == -1){
      cout << "Você ainda não possui armaduras, vá jogar para conseguir." << endl;
    } else {
      for(int i = 0; i <= bau.indArmaduras; i++){
        int armadura = (bau.armaduras[i].armadura - personagem.armadura.armadura);
        int forca = (bau.armaduras[i].forca - personagem.armadura.forca);
        int agilidade = (bau.armaduras[i].agilidade - personagem.armadura.agilidade);
        int vida = (bau.armaduras[i].vida - personagem.armadura.vida);

      cout  << "[" << (i+1) << "] -> " << bau.armaduras[i].nome << " (armadura: " << armadura << ", forca: " << forca << ", agilidade: " << agilidade << ", vida: " << vida << endl;
      }
    }
}


void listArmas(Bau &bau, Personagem &personagem){
  if(bau.indArmas == -1){
    cout << "Você ainda não possui armas, lute com suas mãos até conseguir algo." << endl;

  } else {
    for(int j = 0; j <= bau.indArmas; j++){
      int dano = (bau.arma[j].dano -personagem.arma.dano);
      int forca = (bau.arma[j].forca - personagem.arma.forca);
      int agilidade = (bau.arma[j].agilidade - personagem.arma.agilidade);

      cout << "[" << (j+1) << "] -> " << (bau.arma[j].nome) << " (dano: " << dano << ", força: " << forca << ", agilidade: " << agilidade << ")" << endl;
    }
  }
}

void listPocoes(Bau &bau){
  if(bau.indPocoes == -1){
    cout << "Você ainda nao possui poções, vá tomar água até la" << endl;

  } else {
    for(int k = 0 ; k <= bau.indPocoes; k++){
      cout << bau.pocoes[k].nome << " - " << bau.pocoes[k].descricao << ", vida: " << bau.pocoes[k].vida << ")" << endl;
    }
  }
}

void addIten(Bau &bau, Armadura armadura){
  if((bau.indArmaduras+1) > 50){
    cout << "Você não tem mais espaço para armaduras, jogue fora alguma";
  } else {
    bau.indArmaduras += 1;
    bau.armaduras[bau.indArmaduras] = armadura;
  }
};

void addIten(Bau &bau, Arma arma){
  if((bau.indArmas+1) > 50){
    cout << "Você não tem mais espaço para armas, jogue fora alguma";
  } else {
    bau.indArmas += 1;
    bau.arma[bau.indArmas] = arma;
  }
};

void addIten(Bau &bau, Pocao pocao){
  if((bau.indPocoes+1) > 50){
    cout << "você não tem mais espaço para poções, exclua alguma";
  } else {
    bau.indPocoes += 1;
    bau.pocoes[bau.indPocoes] = pocao;
  }
};

void visualizarEquips(Personagem &personagem){
  estrelinhas();
  estrelinhas();
  printf("\n");

  cout << "Nome do herói: " << personagem.nome << "\n\n";

  cout << "HP: " << personagem.vidaTotal << "\n";
  cout << "Dano: " << personagem.dano << "\n";
  cout << "Defesa: " << personagem.defesa << "\n";
  cout << "Força: " << personagem.forca << "\n";
  cout << "Agilidade: " << personagem.agilidade << "\n\n";

  cout << "Atualmente você está com a arma: " << personagem.arma.nome << endl;
  cout << "Descrição da arma: " << personagem.arma.descricao << endl;
  cout << "(dano: " << personagem.arma.dano << ", forca: " << personagem.arma.forca << ", agilidade: " << personagem.arma.agilidade << ", preço: " << personagem.arma.preco << ")\n\n";

  cout << "Atualmente você está com a armadura: " << personagem.armadura.nome << endl;
  cout << "Descrição da armadura: " << personagem.armadura.descricao << endl;
  cout << "(armadura: " << personagem.armadura.armadura << ", vida: " << personagem.armadura.vida << ", forca: " << personagem.armadura.forca << ", agilidade: " << personagem.armadura.agilidade << ", preço: " << personagem.armadura.preco << ")\n\n";

  estrelinhas();
  estrelinhas();
  printf("\n");
}

void test(Bau &bau){
  Arma teste1 = {"espada", "corta pessoas", 2000, 10, 4, 3};
  Arma teste2 = {"lança", "fura pessoas", 1000, 50, 10, 2};
  Arma teste3 = {"arco", "lança pessoas", 3000, 30, 15, 10};

  Armadura teste4 = {"cavaleiro de bronze", "ATHENAAAAAAA", 100, 40, 10, 20, 30};
  Armadura teste5 = {"cavaleiro de prata", "ninguem lembra deles", 200, 50, 15, 25, 40};
  Armadura teste6 = {"cavaleiro de ouro", "kanon >> all", 500, 60, 20, 30, 50};

  Pocao teste7 = {"pocao de vida", "restaura sua vida", 100, 10};
  Pocao teste8 = {"pocao de forca", "aumenta sua forca temporariamente", 200, 10};
  Pocao teste9 = {"pocao de agilidade", "ficar naquele pique", 300, 10};

  bau.arma[0] = teste1;
  bau.arma[1] = teste2;
  bau.arma[2] = teste3;
  bau.indArmas = 2;

  bau.armaduras[0] = teste4;
  bau.armaduras[1] = teste5;
  bau.armaduras[2] = teste6;
  bau.indArmaduras = 2;

  bau.pocoes[0] = teste7;
  bau.pocoes[1] = teste8;
  bau.pocoes[2] = teste9;
  bau.indPocoes = 2;
}

void visualizarBau(Bau &bau, Personagem &personagem){

  while(true){
    system("clear");
    string teste;
    // cout << "deseja testar? (s/n)" << endl;
    // cin >> teste;
    // if(teste == "s"){
    //   test(bau);
    // }

    printf("              # BAÚ #       \n\n");
    StatusHeroi(personagem);
    printf("\n\n");

      switch(escolhasDoBau()){
        case 1:
        printf("\n");
        trocaEquipamento(bau, personagem);
        break;

        case 2:
        printf("\n");
        excluirItemBau(bau, personagem);
        break;

        case 3:
        printf("\n");
        visualizarEquips(personagem);
        digite();
        break;

        case 4:
        printf("\n");
        bagBatalha(personagem);
        break;

        case 5:
        printf("\n");
        organizarBolsa(bau, personagem);
        break;

        case 6:
        digite();
        return ;
      }
  }
}

void excluirItemBau(Bau &bau, Personagem &p) {
  while (true) {

    switch(excluirItem()) {
      case 1:
        removeArmadura(bau, p);
        break;
      case 2:
        removeArma(bau, p);
        break;
      case 3:
        removePocao(bau);
        break;
      case 4:
        return;
    }
  }
}

void trocaEquipamento(Bau &bau, Personagem &p) {
  while (true) {

    switch(trocarEquipamento()) {
      case 1:
        trocarArma(bau, p);
        break;
      case 2:
        trocarArmadura(bau, p);
        break;
      case 3:
        return ;
    }
  }
  return;
}

void organizarBolsa(Bau &bau, Personagem &p) {
	while(true) {
			switch(opcoesBolsaBau()) {
        case 1: {		// bau to bolsa
          printf("\n\n");
					listaPocoes(bau);
          //verifica se o bau tem poções
          if (bau.indPocoes > -1) {
					  int indice = escolhaUmaPocao(bau.indPocoes);

            if (indice == -1)   // opção: cancelar
              break;

					  addItem(p, bau.pocoes[indice]);
					  removePocaoPrivate(bau, indice);
          }
          break;
        } case 2: {		// bolsa to bau
          printf("\n\n");
          listBag(p);

          if (p.bolsa.quantidade > 0) {    // bolsa está vazia
            int indice = escolhaUmaPocao(p.bolsa.quantidade - 1);
            
            if (indice == -1)
              break;
            
            addIten(bau, p.bolsa.pocoes[indice]);
            removePocao(p, indice);
          } 

          break;
        } case 3:		// cancela
					return;
        
			}

	}
}
