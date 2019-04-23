#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "../Baú/bau.h"
#include "loja.h"

using namespace std;


void loja(Loja &loja,Personagem &p,Bau &bau){
    while(true){
        switch(printLoja()){
            case 1:
                compraArma(loja,p,bau);
                break;
            case 2:
                compraArmadura(loja,p,bau);
                break;
            case 3:
                compraPocao(loja,p,bau);
                break;
            case 4:
                printf("#     quereu sair      #\n");
                digite();
                return;
        }
        digite();
    }
}

void compraArma(Loja &loja, Personagem &p, Bau &bau){
    int opcao = listaArma(loja) - 1;
    if(loja.armas[opcao].preco <= p.dinheiro){
        cout << loja.armas[opcao].nome << " foi comprado, va até o seu baú" << endl;
        p.dinheiro -= loja.armas[opcao].preco;
        addIten(bau,loja.armas[opcao]);
    }else{
        printf("\n#        dinheiro insuficiente        #");
    }
}

void compraArmadura(Loja &loja, Personagem &p, Bau &bau){
    int opcao = listaArmadura(loja) -1;
    if(loja.armaduras[opcao].preco <= p.dinheiro){
        Armadura a = loja.armaduras[opcao];
        cout << a.nome << " foi comprado, vá até o seu baú" << endl;
        p.dinheiro -= a.preco;
        addIten(bau,a);
    }else{
        printf("\n#        dinheiro insuficiente        #");
    }

}

void compraPocao(Loja &loja, Personagem &p, Bau &bau){
    int opcao = listaPocoes(loja) -1;
    if(loja.pocoes[opcao].preco <= p.dinheiro){
        Pocao a = loja.pocoes[opcao];
        cout << a.nome << " foi comprado, vá até o seu baú" << endl;
        p.dinheiro -= a.preco;
        addIten(bau,a);
    }else{
        printf("\n#        dinheiro insuficiente        #");
    }
}


