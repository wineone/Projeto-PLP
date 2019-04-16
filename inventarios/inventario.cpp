#include <bits/stdc++.h>

using namespace std;

Bolsa bol;

void fillBag(){
        bol.pocoes[0].nome = "Maconha";
        bol.pocoes[0].descricao = "Da boa"; 
        bol.pocoes[0].preco = 1; 
        bol.pocoes[0].forca = -1; 
        bol.pocoes[0].agilidade = -1; 
        bol.pocoes[0].vida = 10;

        bol.pocoes[1].nome = "Cocaina"; 
        bol.pocoes[1].descricao = "Branca fina"; 
        bol.pocoes[1].preco = 10; 
        bol.pocoes[1].forca = -10; 
        bol.pocoes[1].agilidade = -20; 
        bol.pocoes[1].vida = -100;
                      
        bol.pocoes[2].nome = "Crack";
        bol.pocoes[2].descricao = "Onde é que eu to"; 
        bol.pocoes[2].preco = 50; 
        bol.pocoes[2].forca = -50; 
        bol.pocoes[2].agilidade = -34; 
        bol.pocoes[2].vida = -1000;
        
        bol.pocoes[3].nome = "Montila"; 
        bol.pocoes[3].descricao = "Só desce com coca"; 
        bol.pocoes[3].preco = 5; 
        bol.pocoes[3].forca = -9; 
        bol.pocoes[3].agilidade = -1; 
        bol.pocoes[3].vida = +2;
        
}
void listBag(){
    for(int i = 0 ; i < 10 ; i++){
        if(bol.pocoes[i].nome != "")
            cout << bol.pocoes[i].nome << " " << bol.pocoes[i].descricao << endl;
    }
}

int bag(){
    int escolha;

    while(true){
        escolha = escolhasDaBolsa();

        switch(escolha){
            case 1:
                printf("Você quer vizualizar as poções que esta carregando\n");
                fillBag();
                listBag();
                break;
            case 2 :
                printf("Você quer usar uma poção\n"); 
                break;
            case 3 :
                printf("Você quer lançar uma poção no limbo \n"); 
                listBag();
                break;
            case 4 :
                printf("Você quer voltar para uma batalha muito empolgante \n"); 
                return 0;
            default :
                printf("você não suportou a responsabilidade de escolha \n");
        }
    }
}




