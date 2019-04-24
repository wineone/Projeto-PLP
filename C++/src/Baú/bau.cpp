#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include <bits/stdc++.h>
#include <string>

void removeArmadura(Bau &bau, Personagem &personagem){
  listArmaduras(bau, personagem);

  if(bau.indArmaduras != -1){
    string resposta;
    cout << "Deseja remover alguma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout << "Então digite o indice da armadura a ser removida" << endl;
      cin >> remover;
      if((remover-1) <= bau.indArmaduras){
        swap(bau.armaduras[remover-1], bau.armaduras[bau.indArmaduras]);
        bau.indArmaduras--;
      } else {
        cout << "Esse indice é inválido" << endl;
      }
    }
  }
}

void removeArma(Bau &bau, Personagem &personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != -1){
    string resposta;
    cout << "Deseja remover alguma arma? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout << "Então, digite o indice da arma a ser removida" << endl;
      cin >> remover;
      if((remover-1) <= bau.indArmas){
        swap(bau.arma[remover-1], bau.arma[bau.indArmas]);
        bau.indArmas -= 1;
      } else {
        cout << "Esse indice é invalido" << endl;
      }
    }
  }
}

void removePocaoPrivate(Bau &bau, int indice) {
	if (indice - 1 <= bau.indPocoes) {
		swap(bau.pocoes[indice - 1], bau.pocoes[bau.indPocoes]);
		bau.indPocoes--;
	}
}

void removePocao(Bau &bau){
  listPocoes(bau);
  if(bau.indPocoes != -1){
		int indice = removePocao(bau.indPocoes);
		removePocaoPrivate(bau, indice);
  } else {
		printf("Você não tem poções, vá jogar.\n");
	}
}

void trocarArmadura(Bau &bau, Personagem &personagem){
  listArmaduras(bau, personagem);
  if(bau.indArmaduras != -1){
    string resposta;
    cout << "Deseja equipar uma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int trocar;
      cout << "Então, digite o indice da armadura que deseja" << endl;
      cin >> trocar;
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
}

void trocarArma(Bau &bau, Personagem &personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != -1){
    string resposta;

    cout << "Deseja equipar uma arma? (s/n)" << endl;
    cin >> resposta;

    if(resposta == "s"){
      int trocar;
      cout << "Então, digite o indice da arma que deseja: " << endl;

      cin >> trocar;
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

      cout  << (i+1) << " - " << bau.armaduras[i].nome << " (armadura: " << avalia(armadura) << armadura << ", forca: " << avalia(forca) << forca << ", agilidade: " << avalia(agilidade) << agilidade << ", vida: " <<    avalia(vida) << vida << endl;
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

      cout << (j+1) << " - " << (bau.arma[j].nome) << " (dano: " << avalia(dano) << dano << ", força: " << avalia(forca) << forca << ", agilidade: " << avalia(agilidade) << agilidade << ")" << endl;
    }
  }
}

void listPocoes(Bau &bau){
  if(bau.indPocoes == -1){
    cout << "Você ainda nao possui poções, vá tomar água até la" << endl;

  } else {
    for(int k = 0 ; k <= bau.indPocoes; k++){
      cout << bau.pocoes[k].nome << " - " << bau.pocoes[k].descricao << "(forca: " << avalia(bau.pocoes[k].forca) << bau.pocoes[k].forca << " , agilidade: " << avalia(bau.pocoes[k].agilidade)<< bau.pocoes[k].agilidade << ", vida: " << avalia(bau.pocoes[k].vida) << bau.pocoes[k].vida << ")" << endl;
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

void visualizarEquips(Personagem personagem){
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

}

string avalia(int k){
  if(k > 0){
    return "+";
  } else {
    return "";
   }
}

void test(Bau &bau){
  Arma teste1 = {"espada", "corta pessoas", 2000, 10, 4, 3};
  Arma teste2 = {"lança", "fura pessoas", 1000, 50, 10, 2};
  Arma teste3 = {"arco", "lança pessoas", 3000, 30, 15, 10};

  Armadura teste4 = {"cavaleiro de bronze", "ATHENAAAAAAA", 100, 40, 10, 20, 30};
  Armadura teste5 = {"cavaleiro de prata", "ninguem lembra deles", 200, 50, 15, 25, 40};
  Armadura teste6 = {"cavaleiro de ouro", "kanon >> all", 500, 60, 20, 30, 50};

  Pocao teste7 = {"pocao de vida", "restaura sua vida", 100, 0, 0, 10};
  Pocao teste8 = {"pocao de forca", "aumenta sua forca temporariamente", 200, 10, 0, 0};
  Pocao teste9 = {"pocao de agilidade", "ficar naquele pique", 300, 0, 10, 0};

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
    string teste;
    cout << "deseja testar? (s/n)" << endl;
    cin >> teste;
    if(teste == "s"){
      test(bau);
    }

    printf("        # BAÚ #       \n\n");
      switch(escolhasDoBau()){
        case 1:
        printf("\n");
        trocarArmadura(bau, personagem);
        digite();
        break;

        case 2:
        printf("\n");
        trocarArma(bau, personagem);
        digite();
        break;

        case 3:
        printf("\n");
        removeArmadura(bau, personagem);
        digite();
        break;

        case 4:
        printf("\n");
        removeArma(bau, personagem);
        digite();
        break;

        case 5:
        printf("\n");
        removePocao(bau);
        digite();
        break;

        case 6:
        printf("\n");
        visualizarEquips(personagem);
        digite();
        break;

        case 7:
        printf("\n");
        organizarBolsa(bau ,personagem);
        digite();

        case 8:
        digite();
        return ;
      }
  }
}

void organizarBolsa(Bau &bau, Personagem &p) {
	while(true) {
			switch(opcoesBolsaBau()) {
				case 1:		// bau to bolsa
          printf("\n\n");
					listaPocoes(bau);
					int indice = escolhaUmaPocao(bau.indPocoes);
					Pocao pocao = bau.pocoes[indice];
					addItem(p, pocao);
					removePocaoPrivate(bau, indice);
          break;
				case 2:		// bolsa to bau
				printf("jaja eu faço isso\n");
        break;
				case 3:		// cancela
					return;
        
			}

	}
}
