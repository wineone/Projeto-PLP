#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "batalha.h"

void batalhar(Personagem p, GrupoDeInimigos gp) {
    // while (p.vidaAtual > 0 && gp.vidaInimigos > 0) {}
    
    HpCombate(p, gp);
    int op = opcoesAtaque();

    if (p.vidaAtual > 0) {
        wonBattle(p, gp);
        p.dinheiro += gp.dinheiroLoot;
    } else {
        lostBattle(gp);
        p.dinheiro -= (gp.dinheiroLoot * 0.1);
        // retorna para o lobby
    }
    // analisar valor da derrota 
}

// algoritmo ataque e critico
// tem que fazer um algoritmo para ataques fortes ou fracos!!