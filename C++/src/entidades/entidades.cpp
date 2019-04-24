#include "../estruturas/estruturas.h"
#include "entidades.h"

using namespace std;

// ----------------- Atributos do Herói --------------------
//-------------------------Armas vendidadas na loja ------------------------
Arma maos(){
    Arma a = {"Suas mãos", "Estilo minecraft", 1, 1, 0, 10};
    return a;
}

Arma lancaTris(){
    Arma a = {"lança da tristeza","mata seus inimigos de suicidio",300,10,2,3};
    return a;
}

Arma armaADura(){
    Arma a = {"Arma A dura", "dizem que essa arma é feita de rapadura",400,15,7,5};
    return a;
}

Arma adagasSile(){
    Arma a = {"Adagas Silenciosas","Aqueles que gritam são seus inimigos",500,15,5,15};
    return a;
}

Arma donut(){
    Arma a = {"Um donut","não tem piadinha, é só um donut muito gostoso",600,20,5,5};
    return a;
}

Arma tridente(){
    Arma a = {"tridente banguela","é... agora ele é um bidente",400,20,10,10};
    return a;

}

Arma armaConfete(){
    Arma a = {"Arma de confete","É carnaval meu povo",200,10,5,2};
    return a;
}

Arma escudo(){
    Arma a = {"Escudo","a melhor defesa é um ataque",400,15,15,15};
    return a;
}



// -------------------------------------- Armas até aqui --------------------------------------

//---------------------------- Armaduras começam aqui -------------------------------------
Armadura roupas() {
    Armadura a = {"Roupas rasgadas", "Você chegou só com as roupas do corpo",1,1,0,0,0};
    return a;
}

Armadura mofi(){
    Armadura a = {"Mofi vestments","Nem precisa de descrição kk",200,5,5,5,5};
    return a;
}

Armadura barril(){
    Armadura a = {"Um barril de madeira","bixo, tu não tem dinheiro, vai ter que ser essa mesmo",350,7,8,3,10};
    return a;
}

Armadura couro(){
    Armadura a = {"Armadura de couro", "por que tem sangue pingando?",400,8,10,3,10};
    return a;
}

Armadura tempes(){
    Armadura a = {"Armadura da Tempestade","Tava chovendo nesse dia",500,12,10,5,15};
    return a;
}

Armadura armaDoFim(){
    Armadura a = {"Armadura do fim","Eu só queria terminar isso logo",700,15,10,10,20};
    return a;
}


//------------------------------ Armaduras até aqui ---------------------------------

Pocao pocaoNull() {
    Pocao nula = {"", "", 0,0,0,0};
    return nula;
}

Bolsa bolsa() {
    Bolsa b = {2, 3,{{"Maconha", "da boa", 10,5,0,-10} ,{"Cocaina", "fica no cheirinho", 100,10,0,50},{"Poção de vida", "", 0,0,0,10},pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull(),pocaoNull()}};
    return b;
}



// ----------------- Estruturas do jogo ------------------

// Fases

Fase piloto(){
    Fase a = {"Piloto",
            "fase de testes, cuidado senão ele te derruba",
            false,
            {gp1(), gp2(), gp3(), grupoNull(), grupoNull(), grupoNull()},
            3};

    return a;
}

Fase barquinho() {
    Fase b = { "Barquinho", "Cuidado pra não enjoar",
                false, 
                pinkyEcerebro(), gp4(), gp5(), grupoNull(), grupoNull(), grupoNull(),
                3};
    
    return b;                
}


// Inimigos

Inimigo inimigoNull() {
    Inimigo a = {"","",0,0,0,0,0,0};
    return a;
}

Inimigo nemesis() {
    Inimigo a = {"Nemesis", "Fei que doi", 50, 50, 5, 5, 5, 5};
    return a;
}

Inimigo pauloGuedes() {
    Inimigo p = {"Paulo Guedes", "Eu vo privatiza ese jogo", 17, 17, 3, 3, 3, 3};
    return p;
}

Inimigo papaco() {
    Inimigo z = {"Papaco", "Pistoleiro", 20, 20, 4, 4, 4, 4};
    return z;
}

Inimigo pinky() {
    Inimigo p = {"Pinky", "Irmão do Cérebro", 25, 25, 3, 2, 4, 2};
    return p;
}

Inimigo cerebro() {
    Inimigo c = {"Cérebro", "Irmão do Pinky", 20, 20, 2, 2, 4, 2};
    return c;
}

Inimigo oCaraAlho() {
    Inimigo c = {"O Cara Alho", "Só um cara com mal hálito", 25, 25, 4,4,4,4};
    return c;
}

Inimigo conexaoRuim() {
    Inimigo c = {"Conexão Ruim", 
                "Seu maior inimigo em dias de jogar ou de enviar o trabalho de última hora",
                50, 50, 5, 6, 1, 2};
    return c;
}

Inimigo gravidaTaubate() {
    Inimigo a = {"Grávida de Taubaté",
                "Grávida (quase).",
                70,70, 7,7,1,2};
    return a;
}

Inimigo filhoGravida() {
    Inimigo a = {"Filho da Grávida",
                "Filho de mentirinha",
                10, 10, 2, 2, 2,2};
    return a;
}

// Grupos de Inimigos

GrupoDeInimigos grupoNull() {
    GrupoDeInimigos gp = {inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()};
    return gp;
}

GrupoDeInimigos gp1() {
    GrupoDeInimigos gp = {{papaco(), papaco(), pauloGuedes(),inimigoNull(),inimigoNull(),inimigoNull()},
                          3, 100};
    return gp;
}

GrupoDeInimigos gp2() {
    GrupoDeInimigos gp = {{nemesis(), pauloGuedes(), inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()}, 2, 100};
    return gp;
}

GrupoDeInimigos gp3(){
    GrupoDeInimigos b = {{nemesis(), nemesis(),inimigoNull(),inimigoNull(),inimigoNull(),inimigoNull()},
                        2,100};
    return b;
}

GrupoDeInimigos gp4() {
    GrupoDeInimigos g = {conexaoRuim(), oCaraAlho(), cerebro(), inimigoNull(), inimigoNull(), inimigoNull(),
                        3, 200};
    return g;                       
}

GrupoDeInimigos gp5() {
    GrupoDeInimigos g = {conexaoRuim(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(),
                        1, 50};
    return g;                    
}

GrupoDeInimigos pinkyEcerebro() {
    GrupoDeInimigos g = {pinky(), cerebro(), inimigoNull(), inimigoNull(), inimigoNull(), inimigoNull(), 2, 20};
    return g;
}

GrupoDeInimigos gravidaFilhos() {
    GrupoDeInimigos g = {{gravidaTaubate(), filhoGravida(),filhoGravida(),filhoGravida(),filhoGravida(),filhoGravida()},
                        6, 450};
    return g;
}