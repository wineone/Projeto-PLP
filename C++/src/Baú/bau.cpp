#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"

void removeArmadura(Bau bau, Personagem joga){
  listArmaduras(bau, joga);
  if(bau.indArmaduras != 0){
    int remover;
    cout << "digite o indice da armadura a ser removida: ";
    cin >> remover;
    swap(bau.armaduras[remover], bau.armaduras[bau.indArmaduras]);
    bau.indArmaduras--;
    cout << "A armadura foi removida com sucesso";
  }
}

void removeArma(Bau bau, Personagem joga){
  listArmas(bau, joga);
  if(bau.indArmas != 0){
    int remover;
    cout << "digite o indice da arma a ser removida: ";
    cin >> remover;
    swap(bau.arma[remover], bau.arma[bau.indArmas]);
    bau.indArmas--;
    cout << "A arma removida com sucesso";
  }
}

void removePocao(Bau bau){
  listPocoes(bau);
  if(bau.indPocoes != 0){
    int remover;
    cout << "digite o indice da poção a ser removida: ";
    cin >> remover;
    swap(bau.pocoes[remover], bau.pocoes[bau.indPocoes]);
    bau.indPocoes--;
    cout << "A poção foi removida com sucesso";
  }
}
void listArmaduras(Bau bau, Personagem joga){
    if(bau.indArmaduras == 0){
      cout << "você ainda nao possui armaduras, vá jogar para conseguir";
    } else {
      for(int i = 0; i < bau.indArmaduras; i++){
      cout  << (i+1) << " - " << bau.armaduras[i].nome << " (armadura: " << (joga.armadura.armadura - bau.armaduras[i].armadura) << ", forca: " << (joga.armadura.forca - bau.armaduras[i].forca) << ", agilidade: " << (joga.armadura.agilidade - bau.armaduras[i].agilidade) << ", vida: " << (joga.armadura.vida - bau.armaduras[i].vida) << endl;
      }
    }
}


void listArmas(Bau bau, Personagem joga){
  if(bau.indArmas == 0){
    cout << "você ainda nao possui armas, lute com suas mãos ate conseguir algo";
  } else {
    for(int j = 0; j < bau.indArmas; j++){
      cout << (j+1) << " - " << (bau.arma[j].nome) << " (dano: " << (joga.arma.dano - bau.arma[j].dano) << ", força: " << (joga.arma.forca - bau.arma[j].forca) << ", agilidade: " << (joga.arma.agilidade - bau.arma[j].agilidade) << endl;
    }
  }
}

void listPocoes(Bau bau){
  if(bau.indPocoes == 0){
    cout << "você ainda nao possui pocoes, vá tomar agua até la";
  } else {
    for(int k = 0 ; k < bau.indPocoes; k++){
      cout << bau.pocoes[k].nome << " - " << bau.pocoes[k].descricao << "(forca: +" << bau.pocoes[k].forca << " , agilidade: +" << bau.pocoes[k].agilidade << ", vida: +" << bau.pocoes[k].vida << ")" << endl;
    }
  }
}


int visualizarBau(Bau bau, Personagem joga){
  int opcao;
  while(true){
    cin >> opcao;
      switch(opcao){
        case 1:
        cout << "remover armadura";
        removeArmadura(bau, joga);
        break;

        case 2:
        cout << "remover arma";
        removeArma(bau, joga);
        break;

        case 3:
        cout << "remover pocoes";
        removePocao(bau);
        break;

        case 4:
        cout << "Somente listar as armaduras";
        listArmaduras(bau, joga);
        break;

        case 5:
        cout << "Somente listar as armas";
        listArmas(bau, joga);
        break;

        case 6:
        cout << "Somente listar as poções";
        listPocoes(bau);
        break;

        case 7:
        cout << "Está retornando ao menu inicial, be safe!";
        return 0;
      }

  }
}
