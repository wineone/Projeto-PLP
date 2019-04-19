#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include <bits/stdc++.h>

void removeArmadura(Bau bau, Personagem personagem){
  listArmaduras(bau, personagem);
  if(bau.indArmaduras != 0){
    string resposta;
    cout << "Deseja remover alguma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout << "então digite o indice da armadura a ser removida" << endl;
      cin >> remover;
      if(remover < bau.indArmaduras){
        swap(bau.armaduras[remover], bau.armaduras[bau.indArmaduras]);
        bau.indArmaduras--;
      } else {
        cout << "esse indice é invalido";
      }
    }
  }
}

void removeArma(Bau bau, Personagem personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != 0){
    string resposta;
    cout << "Deseja remover alguma arma? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout << "então, digite o indice da arma a ser removida" << endl;
      cin >> remover;
      if(remover < bau.indArmas){
        swap(bau.arma[remover], bau.arma[bau.indArmas]);
        bau.indArmas--;
      } else {
        cout << "esse indice é invalido" << endl;
      }
    }
  }
}

void removePocao(Bau bau){
  listPocoes(bau);
  if(bau.indPocoes != 0){
    string resposta;
    cout << "deseja remover uma poção? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int remover;
      cout <<"então, digite o indice da poção a ser removida" << endl;
      cin >> remover;
      if(remover < bau.indPocoes){
        swap(bau.pocoes[remover], bau.pocoes[bau.indPocoes]);
        bau.indPocoes--;
      } else {
        cout << "esse é um indice invalido" << endl;
      }
    }
  }
}

void trocaArmadura(Bau bau, Personagem personagem){
  listArmaduras(bau, personagem);
  if(bau.indArmaduras != 0){
    string resposta;
    cout << "deseja equipar uma armadura? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int trocar;
      cout << "então, digite o dince da armadura que deseja" << endl;
      cin >> trocar;
      if(trocar < bau.indArmaduras){
        Armadura aux = bau.armaduras[trocar];
        bau.armaduras[trocar] = personagem.armadura;
        personagem.armadura = aux;
      } else {
        cout << "indice invalido" << endl;
      }
    }
  }
}

void trocaArma(Bau bau, Personagem personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != 0){
    string resposta;
    cout << "deseja equipar uma arma? (s/n)" << endl;
    cin >> resposta;
    if(resposta == "s"){
      int trocar;
      cout << "então, digite o dince da arma que deseja" << endl;
      cin >> trocar;
      if(trocar < bau.indArmas){
        Arma aux = bau.arma[trocar];
        bau.arma[trocar] = personagem.arma;
        personagem.arma = aux;
      } else {
        cout << "indice invalido" << endl;
      }
    }
  }
}

void listArmaduras(Bau bau, Personagem personagem){
    if(bau.indArmaduras == 0){
      cout << "você ainda nao possui armaduras, vá jogar para conseguir" << endl;
    } else {
      for(int i = 0; i < bau.indArmaduras; i++){
      cout  << (i+1) << " - " << bau.armaduras[i].nome << " (armadura: " << (personagem.armadura.armadura - bau.armaduras[i].armadura) << ", forca: " << (personagem.armadura.forca - bau.armaduras[i].forca) << ", agilidade: " << (personagem.armadura.agilidade - bau.armaduras[i].agilidade) << ", vida: " << (personagem.armadura.vida - bau.armaduras[i].vida) << endl;
      }
    }
}


void listArmas(Bau bau, Personagem personagem){
  if(bau.indArmas == 0){
    cout << "você ainda nao possui armas, lute com suas mãos ate conseguir algo" << endl;
  } else {
    for(int j = 0; j < bau.indArmas; j++){
      cout << (j+1) << " - " << (bau.arma[j].nome) << " (dano: " << (personagem.arma.dano - bau.arma[j].dano) << ", força: " << (personagem.arma.forca - bau.arma[j].forca) << ", agilidade: " << (personagem.arma.agilidade - bau.arma[j].agilidade) << endl;
    }
  }
}

void listPocoes(Bau bau){
  if(bau.indPocoes == 0){
    cout << "você ainda nao possui pocoes, vá tomar agua até la" << endl;
  } else {
    for(int k = 0 ; k < bau.indPocoes; k++){
      cout << bau.pocoes[k].nome << " - " << bau.pocoes[k].descricao << "(forca: +" << bau.pocoes[k].forca << " , agilidade: +" << bau.pocoes[k].agilidade << ", vida: +" << bau.pocoes[k].vida << ")" << endl;
    }
  }
}


int visualizarBau(Bau bau, Personagem personagem){
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
