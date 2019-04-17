#include "bau.h"
#include "../entidades/entidade.h"
#include "../estruturas/estruturas.h"

void removeArmadura(Bau bau){
  listArmaduras(bau);
  if(bau.indArmaduras != 0){
    int remover;
    cout << "digite o indice da armadura a ser removida: ";
    cin >> remover;
    swap(bau.armaduras[remover], bau.armaduras[indArmaduras]);
    bau.indArmaduras--;
    cout << "A armadura foi removida com sucesso";
  }
}

void removeArma(Bau bau){
  listArmas(bau);
  if(bau.indArmas != 0){
    int remover;
    cout << "digite o indice da arma a ser removida: ";
    cin >> remover;
    swap(bau.armas[remover], bau.armas[bau.indArmas]);
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
void listArmaduras(Bau &bau){
    if(bau.indArmaduras == 0){
      cout << "você ainda nao possui armaduras, vá jogar para conseguir"
    }else {
      for(int i = 0; i < indArmaduras; i++){
        cout  << (i+1) << " - "<< bau.armaduras[i].nome << " (armadura: " << joga.armadura.defesa - bau.armaduras[i].defesa << ", força: " << joga.armadura.forca - bau.armaduras[i].forca << ", agilidade: " << (joga.armadura.agilidade - bau.armaduras[i].agilidade) << ", vida: " << (joga.armadura.vida - bau.armaduras[i].vida) << ")" << endl;
      }
    }
}


void listArmas(Bau bau){
  if(bau.indArmas == 0){
    cout << "você ainda nao possui armas, lute com suas mãos ate conseguir algo"
  } else {
    for(int j = 0; j < bau.indArmas; i++){
      printf("%i - %s (dano: %i , forca: %i, agilidade: %i)", (i+1), bau.armas[i].nome, (joga.arma.dano - bau.armas[i].dano), (joga.arma.forca - bau.armaduras[i].forca), (joga.arma.agilidade - bau.armaduras[i].agilidade));
    }
  }
}

void listPocoes(Bau bau){
  if(bau.indPocoes == 0){
    cout << "você ainda nao possui pocoes, vá tomar agua até la"
  } else {
    for(int k = 0 ; k < bau.indPocoes; k++){
      printf("%i - %s (%s) : forca +%i, agilidade +%i  vida + %i", (i+1), bau.pocoes[i].nome, bau.pocoes[i].descricao, bau.pocoes[i].forca, bau.pocoes[i].agilidade, bau.pocoes[i].vida);
    }
  }
}


int visualizarBau(Bau bau){
  int opcao;
  while(true){
    cin >> opcao;
      switch(opcao){
        case 1:
        cout << "remover armadura";
        removeArmadura();
        break;

        case 2:
        cout << "remover arma"
        removerArma(bau);
        break;

        case 3:
        cout << "remover pocoes";
        removerPocoes(bau);
        break;

        case 4:
        cout << "Somente listar as armaduras";
        listArmaduras(bau);
        break;

        case 5:
        cout << "Somente listar as armas";
        listArmas(bau);
        break;

        case 6:
        cout << "Somente listar as poções";
        listPocoes(bau);
        break;

        case 7: cout << "Está retornando ao menu inicial, be safe!"
        return 0;
      }

  }
}
