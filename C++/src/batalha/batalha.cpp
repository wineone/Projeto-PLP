#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "batalha.h"

using namespace std;

bool acabou(Personagem p, GrupoDeInimigos gp){
    if(p.vidaAtual <= 0) return true;

    for(int i = 0; i < gp.quantidade; i++){
        if(gp.gangue[i].vidaAtual > 0)
            return false;
    }
    return true;
}

bool esquiva(int a){
    return ((rand()%(100) + 1) < ((rand()%10 + 1) + a*0.4));
}

bool critico(int a){
    return ((rand()%(100) + 1) < ((rand()%10 + 1) + a*0.4));
}

void batalhar(Personagem p, GrupoDeInimigos gp) {
    
    while(!acabou(p,gp)){
        system("clear");
        int bd = 0;
        int be = 0;
        HpCombate(p, gp);

        if(opcoesAtaque() == 1){
            bd = 10;
            be  = 15;
        }
        //heroi ataca inimigos
        int inimigo = ataqueInimigo(gp) - 1;
        int dano = p.dano + p.forca * 0.10 + bd;
        //ataque critico
        if(critico(p.agilidade)){
            dano *= 2;
            cout << "ataque critico! ";
        }
        cout << "o heroi deu " << dano << " de dano" << endl;
        //esquiva do inimigo
        if(!esquiva(gp.gangue[inimigo].agilidade + be)){
            int danoMenosArma = (dano - (dano * gp.gangue[inimigo].defesa)/100);
            cout << "o inimigo " << gp.gangue[inimigo].nome << " recebeu " << danoMenosArma << " de dano" << endl;
            gp.gangue[inimigo].vidaAtual -= danoMenosArma;
        }else
            cout << "o inimigo se esquivou do ataque" << endl;
        //ate aqui

        //inimigo ataca heroi
        for(int i = 0; i < gp.quantidade; i++){
            //ataque do inimigo
            int dano = gp.gangue[i].dano + gp.gangue[i].forca * 0.10;
            //ataque critico
            if(critico(p.agilidade)){
                    dano *= 2;
                    cout << "ataque critico! ";
            }
            cout << "o inimigo deu " << dano << " de dano" << endl;

            //esquiva do inimigo
            if(!esquiva(p.agilidade)){
                int danoMenosArma = (dano - (dano * p.defesa)/100);
                
                cout << "o heroi recebeu " << danoMenosArma << " de dano" << endl;
                p.vidaAtual -= danoMenosArma;
            }else{
                cout << "o heroi se esquivou " << endl;
            }
        }
        //ate aqui
        digite();
    }
    if(p.vidaAtual > 0)
        wonBattle(p, gp);
    else
        lostBattle(gp);
    

}








// algoritmo ataque e critico
// tem que fazer um algoritmo para ataques fortes ou fracos!!