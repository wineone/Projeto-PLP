#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include <bits/stdc++.h>

void removeArmadura(Bau &bau, Personagem &personagem){
  listArmaduras(bau, personagem);
  
  if(bau.indArmaduras != -1){
    string resposta;
    cout << "Deseja remover alguma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout << "então digite o indice da armadura a ser removida" << endl;
      cin >> remover;
      if((remover-1) <= bau.indArmaduras){
        swap(bau.armaduras[remover-1], bau.armaduras[bau.indArmaduras]);
        bau.indArmaduras--;
      } else {
        cout << "esse indice é invalido";
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
      cout << "então, digite o indice da arma a ser removida" << endl;
      cin >> remover;
      if((remover-1) <= bau.indArmas){
        swap(bau.arma[remover-1], bau.arma[bau.indArmas]);
        bau.indArmas -= 1;
      } else {
        cout << "esse indice é invalido" << endl;
      }
    }
  }
}

void removePocao(Bau &bau){
  listPocoes(bau);
  if(bau.indPocoes != -1){
    string resposta;
    cout << "deseja remover uma poção? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout <<"então, digite o indice da poção a ser removida" << endl;
      cin >> remover;
      if((remover-1) <= bau.indPocoes){
        swap(bau.pocoes[remover-1], bau.pocoes[bau.indPocoes]);
        bau.indPocoes--;
      } else {
        cout << "esse é um indice invalido" << endl;
      }
    }
  }
}

void trocarArmadura(Bau &bau, Personagem &personagem){
  listArmaduras(bau, personagem);
  if(bau.indArmaduras != -1){
    string resposta;
    cout << "deseja equipar uma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int trocar;
      cout << "então, digite o indice da armadura que deseja" << endl;
      cin >> trocar;
      if((trocar-1) <= bau.indArmaduras){
        Armadura aux = bau.armaduras[trocar];
        bau.armaduras[trocar-1] = personagem.armadura;
        personagem.armadura = aux;
      } else {
        cout << "indice invalido" << endl;
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
        cout << "arma equipada com sucesso" << endl;
      } else {
        cout << "indice inválido" << endl;
      }
    }
  }
}

void listArmaduras(Bau &bau, Personagem &personagem){
    if(bau.indArmaduras == -1){
      cout << "Você ainda não possui armaduras, vá jogar para conseguir." << endl;
    } else {
      for(int i = 0; i <= bau.indArmaduras; i++){
      cout  << (i+1) << " - " << bau.armaduras[i].nome << " (armadura: " << (bau.armaduras[i].armadura - personagem.armadura.armadura) << ", forca: " << (bau.armaduras[i].forca - personagem.armadura.forca) << ", agilidade: " << (bau.armaduras[i].agilidade - personagem.armadura.agilidade) << ", vida: " << (bau.armaduras[i].vida - personagem.armadura.vida) << endl;
      }
    }
}


void listArmas(Bau &bau, Personagem &personagem){
  if(bau.indArmas == -1){
    cout << "Você ainda não possui armas, lute com suas mãos até conseguir algo." << endl;
  } else {
    for(int j = 0; j <= bau.indArmas; j++){
      cout << (j+1) << " - " << (bau.arma[j].nome) << " (dano: " << (bau.arma[j].dano -personagem.arma.dano) << ", força: " << (bau.arma[j].forca - personagem.arma.forca) << ", agilidade: " << (bau.arma[j].agilidade - personagem.arma.agilidade) << ")" << endl;
    }
  }
}

void listPocoes(Bau &bau){
  if(bau.indPocoes == -1){
    cout << "Você ainda nao possui pocoes, vá tomar agua até la" << endl;
  } else {
    for(int k = 0 ; k <= bau.indPocoes; k++){
      cout << bau.pocoes[k].nome << " - " << bau.pocoes[k].descricao << "(forca: +" << bau.pocoes[k].forca << " , agilidade: +" << bau.pocoes[k].agilidade << ", vida: +" << bau.pocoes[k].vida << ")" << endl;
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
    cout << "você não tem mais espaço para armaduras, exclua alguma";
  } else {
    bau.indPocoes += 1;
    bau.pocoes[bau.indPocoes] = pocao;
  }
};

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

int visualizarBau(Bau &bau, Personagem &personagem){
  int opcao;
  while(true){
    escolhasDoBau();
    cin >> opcao;
    system("clear");
      switch(opcao){
        case 1:
        trocarArmadura(bau, personagem);
        break;

        case 2:
        trocarArma(bau, personagem);
        break;

        case 3:
        removeArmadura(bau, personagem);
        break;

        case 4:
        removeArma(bau, personagem);
        break;

        case 5:
        removePocao(bau);
        break;

        case 6:
        return 0;
      }
  }
}
