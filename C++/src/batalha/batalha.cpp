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

void batalhar(Personagem &p, GrupoDeInimigos gp) {

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

        // heroi ataca inimigos
        int inimigo = ataqueInimigo(gp) - 1;
        int dano = p.dano + p.forca * 0.10 + (p.dano * bd);

        printf("\n");
        divisorias();

        // ataque critico
        if(critico(p.agilidade)){
            dano *= 2;
            cout << "ataque critico! ";
        }
        cout << p.nome << " deu " << dano << " de dano" << endl;


        //esquiva do inimigo
        if(!esquiva(gp.gangue[inimigo].agilidade + (gp.gangue[inimigo].agilidade * be))){

            // verifica se o player tenta atacar inimigo morto.
            if (gp.gangue[inimigo].vidaAtual > 0) {
                int danoMenosArma = (dano - (dano * gp.gangue[inimigo].defesa)/100);
                cout << gp.gangue[inimigo].nome << " recebeu " << danoMenosArma << " de dano" << endl;
                gp.gangue[inimigo].vidaAtual -= danoMenosArma;
            } else {
                cout << "Você tá chutando cachorro morto...\n";
            }

            // conserta vida negativa do inimigo
            gp.gangue[inimigo].vidaAtual = max(gp.gangue[inimigo].vidaAtual, 0);

        } else {
            cout << gp.gangue[inimigo].nome << " se esquivou do ataque" << endl;
        }
        //ate aqui


        //inimigo ataca heroi
        for(int enemy = 0; enemy < gp.quantidade; enemy++){
            if (gp.gangue[enemy].vidaAtual > 0) {

                //ataque do inimigo
                int dano = gp.gangue[enemy].dano + gp.gangue[enemy].forca * 0.10;

                //ataque critico
                if(critico(p.agilidade)){
                        dano *= 2;
                        cout << "ataque critico! ";
                }
                cout << gp.gangue[enemy].nome << " deu " << dano << " de dano" << endl;

                //esquiva do inimigo
                if(!esquiva(p.agilidade)){
                    int danoMenosArma = (dano - (dano * p.defesa)/100);

                    cout << p.nome << " recebeu " << danoMenosArma << " de dano" << endl;
                    p.vidaAtual -= danoMenosArma;

                    // conserta vida negativa do heroi
                    p.vidaAtual = max(p.vidaAtual, 0);

                }else{
                    cout << p.nome << " se esquivou " << endl;
                }

            }
        }
        divisorias();
        printf("\n\n");
        //ate aqui
        digite();
    }

    printf("*****************************\n");
    // verifica quem ganhou e assimila o premio ou perda do jogador
    if(p.vidaAtual > 0) {
        wonBattle(p, gp);
        p.dinheiro += gp.dinheiroLoot;
    } else {
        lostBattle(gp);
        p.dinheiro -= (gp.dinheiroLoot * 0.2);
        p.dinheiro = max(p.dinheiro, 0);    // evita que a carteira do jogador fique negativa
    }
    printf("*****************************\n");

    digite();
    system("clear");
}
