:- module(entidades,[]).

/*personagem(Personagem, Nome) :- [Nome, vidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, Bolsa]*/
personagem(Personagem, Nome) :- 
    maos(Arma),
    roupas(Armadura),
    bolsa(Bolsa),
    Personagem = [Nome,
                  100,
                  100,
                  10,
                  10,
                  10,
                  10,
                  100000,
                  Arma,
                  Armadura,
                  Bolsa]. 
                  

/* Bolsa */
bolsa(Bolsa) :- Bolsa = [[],[],[]].

/* Armas */

maos(Arma) :- Arma = ["Suas mãos", "Estilo minecraft", 1, 10, 10, 10].



/* Armaduras */

roupas(Armadura) :- Armadura = ["Roupas rasgadas", "Você chegou só com as roupas do corpo", 1, 1, 0, 0, 0].