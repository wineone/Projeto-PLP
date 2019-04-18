#include "bau.h"
#include "../entidades/entidades.h"
#include "../estruturas/estruturas.h"
#include "../print/print.h"

void removeArmadura(Bau bau, Personagem personagem){
  listArmaduras(bau, personagem);
  if(bau.indArmaduras != 0){
    int remover;
    cout << "digite o indice da armadura a ser removida: " << endl;
    cin >> remover;
    swap(bau.armaduras[remover], bau.armaduras[bau.indArmaduras]);
    bau.indArmaduras--;
    cout << "A armadura foi removida com sucesso" << endl;
  }
}

void removeArma(Bau bau, Personagem personagem){
  listArmas(bau, personagem);
  if(bau.indArmas != 0){
    int remover;
    cout << "digite o indice da arma a ser removida: " << endl;
    cin >> remover;
    swap(bau.arma[remover], bau.arma[bau.indArmas]);
    bau.indArmas--;
    cout << "A arma removida com sucesso" << endl;
  }
}

void removePocao(Bau bau){
  listPocoes(bau);
  if(bau.indPocoes != 0){
    int remover;
    cout << "digite o indice da poção a ser removida: " << endl;
    cin >> remover;
    swap(bau.pocoes[remover], bau.pocoes[bau.indPocoes]);
    bau.indPocoes--;
    cout << "A poção foi removida com sucesso" << endl;
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
      switch(opcao){
        case 1:
        removeArmadura(bau, personagem);
        break;

        case 2:
        removeArma(bau, personagem);
        break;

        case 3:
        removePocao(bau);
        break;

        case 4:
        listArmaduras(bau, personagem);
        break;

        case 5:
        listArmas(bau, personagem);
        break;

        case 6:
        listPocoes(bau);
        break;

        case 7:
        return 0;
      }

  }
}
