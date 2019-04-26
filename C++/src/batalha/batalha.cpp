#include <bits/stdc++.h>
#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "batalha.h"

using namespace std;

bool acabou(Personagem &p, GrupoDeInimigos gp){

    if(p.vidaAtual <= 0) return true;

    for(int i = 0; i < gp.quantidade; i++){
        if(gp.gangue[i].vidaAtual > 0)
            return false;
    }
    return true;
}

bool esquiva(int a){
    srand((unsigned)time(0));
    return ((rand()%(100) + 1) < ((rand()%10 + 1) + a*0.4));
}

bool critico(int a){
    srand((unsigned)time(0));
    return ((rand()%(100) + 1) < ((rand()%10 + 1) + a*0.4));
}

int heroiAtaca(Personagem &p, int bd){
    // heroi ataca inimigos
    
    int dano = p.dano + p.forca * 0.10 + (p.dano * bd);

    printf("\n");
    divisorias();

    // ataque critico
    if(critico(p.agilidade)){
        dano *= 2;
        cout << "ataque critico! ";
    }
    cout << p.nome << " deu " << dano << " de dano" << endl;
    return dano;
}


int inimigoAtaca(Inimigo i){
    //ataque do inimigo
    int dano = i.dano + i.forca * 0.10;

    //ataque critico
    if(critico(i.agilidade)){
            dano *= 2;
            cout << "ataque critico! ";
    }
    cout << i.nome << " deu " << dano << " de dano" << endl;
    return dano;
}

void heroiRecebeDano(Personagem &p, int danoinimigo){
    if(!esquiva(p.agilidade)){
        int danoMenosArma = (danoinimigo - (danoinimigo * p.defesa)/100);

        cout << p.nome << " recebeu " << danoMenosArma << " de dano" << endl;
        p.vidaAtual -= danoMenosArma;

        // conserta vida negativa do heroi
        p.vidaAtual = max(p.vidaAtual, 0);

    }else{
        cout << p.nome << " se esquivou " << endl;
    }
}

void inimigoRecebeDano(Inimigo &i, int be, int dano){
    if(!esquiva(i.agilidade + (i.agilidade * be))){

        // verifica se o player tenta atacar inimigo morto.
        if (i.vidaAtual > 0) {
            int danoMenosArma = (dano - (dano * i.defesa)/100);
            cout << i.nome << " recebeu " << danoMenosArma << " de dano" << endl;
            i.vidaAtual -= danoMenosArma;
        } else {
            cout << "Você tá chutando cachorro morto...\n";
        }

        // conserta vida negativa do inimigo
        i.vidaAtual = max(i.vidaAtual, 0);

    } else {
        cout << i.nome << " se esquivou do ataque" << endl;
    }
}

// tem q ajeitar;;;;;
void batalhar(Personagem &p, GrupoDeInimigos gp) {
    printInimigos(gp);

    while(!acabou(p,gp)){
        system("clear");
        float bd = 0;         // bonus de dano
        float be = 0;         // bonus de esquiva

        printf("    # BATALHA #    ");
        HpCombate(p, gp);

        if(opcoesAtaque() == 1){
            bd = 0.5;
            be = 0.4;
        }
        int inimigo = ataqueInimigo(gp) - 1;

        inimigoRecebeDano(gp.gangue[inimigo],be,heroiAtaca(p, bd));

        //inimigo ataca heroi
        for(int enemy = 0; enemy < gp.quantidade; enemy++){
            if (gp.gangue[enemy].vidaAtual > 0) {
                heroiRecebeDano(p, inimigoAtaca(gp.gangue[enemy]));
            }
        }
        divisorias();
        printf("\n\n");
        //ate aqui
        digite();
    }

    estrelinhas();
    printf("\n");
    // verifica quem ganhou e assimila o premio ou perda do jogador
    if(p.vidaAtual > 0) {
        wonBattle(p, gp);
        p.dinheiro += gp.dinheiroLoot;

        if (gp.gangue[0].nome == "Light Theme IDE") {
            fimDoJogo(p);
        }
    } else {
        lostBattle(gp);
        p.dinheiro -= (gp.dinheiroLoot * 0.2);
        p.dinheiro = max(p.dinheiro, 0);    // evita que a carteira do jogador fique negativa
    }
    estrelinhas();
    printf("\n");

    digite();
    system("clear");
}
