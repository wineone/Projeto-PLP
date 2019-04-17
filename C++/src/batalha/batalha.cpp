#include "../estruturas/estruturas.h"
#include "../print/print.h"
#include "batalha.h"

void batalhar(Personagem p, Fase f) {
    cout << "batalha: " << endl;
    
    for(int i = 0; i < f.qtdDeInimigos; i++) {
        cout << &(f.grupo[i]) << endl;
        cout << f.grupo[i].quantidade << " ";
        cout  << f.grupo[i].dinheiroLoot << endl;
    }
    // interfaceDeBatalha(p, gp[0]);

}