:- module(entidades,[]).

/*personagem(Personagem, Nome) :- [Nome, vidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, Bolsa]*/
personagem(Personagem, Nome) :- 
    maos(Arma),
    roupas(Armadura),
    maos(A),lancaTris(B),tempes(C),mofi(D),pocaoRedbull(E),pocaoRedBullDupla(F), 
    Bolsa = [[E,F] ,[C,D],[A,B]],
    
    Personagem = [Nome,
                  10,
                  100,
                  10,
                  10,
                  10,
                  10,
                  100000,
                  Arma,
                  Armadura,
                  Bolsa]. 
                  

/* Bolsa :- [[Pocao], [Armadura], [Arma]]*/
bolsa(Bolsa) :- Bolsa = [[],[],[]].

/* Armas */

/*Arma :- [Nome, descrição, preço, dano, força, agilidade] */

maos(Arma) :- Arma = ["Suas mãos", "Estilo minecraft", 1, 10, 10, 10].


lancaTris(Arma) :- Arma = ["lança da tristeza", "mata seus inimigos de suicidio", 300, 20, 20, 20].


armaADura(Arma) :- Arma = ["Arma A dura", "dizem que essa arma é feita de rapadura", 500, 30, 20, 25].


adagasSile(Arma) :- Arma = ["Adagas Silenciosas", "Aqueles que gritam são seus inimigos", 800, 40, 30, 15].


donut(Arma) :- Arma = ["Um donut", "não tem piadinha, é só um donut muito gostoso", 1200, 40, 40, 40].


tridente(Arma) :- Arma = ["tridente banguela", "é... agora ele é um bidente", 1600, 50, 30, 30].


armaConfete(Arma) :- Arma = ["Arma de confete", "É carnaval meu povo", 2000, 50, 50, 50].


lazy(Arma) :- Arma = ["Lazy Evaluation", "Mata todo mundo de RAIVA", 2200, 60, 40, 50].


escudo(Arma) :- Arma = ["Escudo", "a melhor defesa é um ataque", 2500, 70, 40, 40].


metralha(Arma) :- Arma = ["Metralhadora de Golfinhos", "Vem dos confins do espaço...", 5000, 200, 200, 200].


/* Armaduras */

/* armadura :- [nome, descrição, preço, armadura, forca, agilidade, vida]*/

roupas(Armadura) :- Armadura = ["Roupas rasgadas", "Você chegou só com as roupas do corpo", 1, 1, 0, 0, 0].


mofi(Armadura) :- Armadura = ["Mofi-s vestments", "Nem precisa de descrição kk", 500, 10, 10, 10, 10].


barril(Armadura) :- Armadura = ["Um barril de madeira", "bixo, tu não tem dinheiro, vai ter que ser essa mesmo", 700, 15, 22, 20, 10].


couro(Armadura) :- Armadura = ["Armadura de couro", "por que tem sangue pingando?", 1000, 20, 25, 15, 20].


tempes(Armadura) :- Armadura = ["Armadura da Tempestade", "Tava chovendo nesse dia", 1200, 15, 15, 30, 30].


armaDoFim(Armadura) :- Armadura = ["Armadura do fim", "Eu só queria terminar isso logo", 1500, 40, 45, 30, 40].
    

gosmenta(Armadura) :- Armadura = ["Armadura de catarro", "~gorfa~", 2000, 60, 30, 30, 40].


tormenta(Armadura) :- Armadura = ["Fúria do Norte", "Essa armadura já viu o passar das eras", 2500, 70, 50, 50, 40].


eucli(Armadura) :- Armadura  = ["Armadura Não-Euclidiana", "Eu não sei nem por onde começar pra explicar", 3000, 70, 80, 60, 70].


divina(Armadura) :- Armadura = ["Armadura de Virgem", "Quem veste isso se torna o mais próximo possível de Deus.", 5000, 200, 200, 200, 200].


/* Fase 1 */

cururu(Inimigo) :- Inimigo = ["Sapo Cururu", "Imune ao frio", 10, 10, 5, 2, 3, 4].


jacare(Inimigo) :- Inimigo = ["Jacaré da UFCG", "Aparece de vez em nunca na lagoa para assustar os estudantes", 7, 7, 3, 3, 4, 2].


slime(Inimigo) :- Inimigo = ["Slime de Lama", "Parece uma poça, cuidado para não pisar em cima", 4, 4, 3, 3, 4, 3].


pato(Inimigo) :- Inimigo = ["Pato no Tucupi", "ABC da Amazonia", 10, 10, 3, 4, 5, 4].


gru1Fase1(GrupoDeInimigos) :- cururu(X),jacare(Y),cururu(Z),GrupoDeInimigos = [3, 120, [X,Y,Z]].


gru2Fase1(GrupoDeInimigos) :- pato(X),slime(Y),slime(Z),GrupoDeInimigos = [3, 100, [X,Y,Z]].


gru3Fase1(GrupoDeInimigos) :- pato(X),jacare(Y),cururu(Z),GrupoDeInimigos = [3, 100, [X,Y,Z]].


manguezal(Fase) :- gru1Fase1(X),gru2Fase1(Y),gru3Fase1(Z), Fase = ["Manguezal", "Se não tiver usando botas, vai se sujar de lama", 3, [X,Y,Z]].

/* Fase 2 */


meia(Inimigo) :- Inimigo = ["Meia Chulelenta", "Bem fedida mesmo", 20, 20, 5, 5, 2, 2].


bixo(Inimigo) :- Inimigo = ["Bixo Papão", "De baixo da sua cama, é... sempre esteve", 55, 55, 12, 10, 8, 2].


parede(Inimigo) :- Inimigo = ["Parede Mofada", "Lança esporos que podem te deixar doidão rs", 40, 40, 8, 5, 5, 3].


ventila(Inimigo) :- Inimigo = ["Ventilador de Teto", "Ele vai cair em cima de você, eu sei que você já imaginou isso", 60, 60, 15, 10, 5, 5].


chao(Inimigo) :- Inimigo = ["Chão Movediço", "Quando você entrar o chão quase lhe engoliu", 35, 35, 7, 7, 7, 5].


louca(Inimigo) :- Inimigo = ["Louça Suja", "Ela passou tanto tempo na pia que criou vida", 50, 50, 10, 10, 10, 7].


gru1Fase2(GrupoDeInimigos) :- meia(C),meia(B),meia(A),GrupoDeInimigos = [3, 200, [A,B,C]].


gru2Fase2(GrupoDeInimigos) :- meia(C),bixo(B),parede(A),GrupoDeInimigos = [3, 300, [A,B,C]].


gru3Fase2(GrupoDeInimigos) :- bixo(A),ventila(B),chao(C),GrupoDeInimigos = [3, 400, [A,B,C]].


gru4Fase2(GrupoDeInimigos) :- louca(D),chao(C),meia(B),meia(A),GrupoDeInimigos = [4, 400, [A,B,C,D]].


gru5Fase2(GrupoDeInimigos) :- meia(D),meia(C),louca(B),ventila(A),GrupoDeInimigos = [4, 500, [A,B,C,D]].


casa(Fase) :- gru1Fase2(A),gru2Fase2(B),gru3Fase2(C),gru4Fase2(D),gru5Fase2(E), Fase = ["Casa da Mãe Joana", "Tem coisas aqui que os deixariam enojados", 5, [A,B,C,D,E]].

/* Fase 3 */

seneca(Inimigo) :- Inimigo = ["Seneca", "Não sou o Soneca, sou o Seneca", 70, 70, 8, 8, 7, 8].


reimite(Inimigo) :- Inimigo = ["reimite", "Onde está a pinga", 100, 100, 10, 15, 8, 14].


pita(Inimigo) :- Inimigo = ["Pita", "Perdeu as perna mas passa bem", 85, 85, 10, 15, 7, 8].


katenisse(Inimigo) :- Inimigo = ["Katenisse", "Ela é o tordo, visse", 90, 90, 12, 11, 12, 13].


gueiou(Inimigo) :- Inimigo = ["Gueiou", "Eu estou apaixonado por Katenisse", 80, 80, 9, 12, 7, 10].


esnou(Inimigo) :- Inimigo = ["Esnou", "Sou o presidente, talkei", 80, 80, 16, 8, 8, 15].


finique(Inimigo) :- Inimigo = ["Finique", "Perdeu a cabeça, algo compreesível", 95, 95, 13, 15, 12, 11].


gru1Fase3(GrupoDeInimigos) :- seneca(A),reimite(B),GrupoDeInimigos =  [2, 600, [A,B]].


gru2Fase3(GrupoDeInimigos) :- pita(A),katenisse(B),GrupoDeInimigos = [2, 600, [A,B]].


gru3Fase3(GrupoDeInimigos) :- pita(A),katenisse(B), gueiou(C),GrupoDeInimigos = [3, 600, [A,B,C]].


gru4Fase3(GrupoDeInimigos) :- esnou(A),katenisse(B),finique(C),GrupoDeInimigos = [3, 600, [A,B,C]].


jogosVoraz(Fase) :- gru1Fase3(A),gru2Fase3(B),gru3Fase3(C),gru4Fase3(D),Fase = ["Jogoses Voraz", "Tributos contra os zinimigos", 4, [A,B,C,D]].

/* Fase 4*/

papaco(Inimigo) :- Inimigo = ["Papaco", "Um pistoleiro chamado Papaco", 100, 100, 15, 15, 15, 15].


pauloGuedes(Inimigo) :- Inimigo = ["Paulo Guedes", "Eu vo privatiza ese jogo", 110, 110, 20, 20, 20, 20].


nemesis(Inimigo) :- Inimigo = ["Nemesis", "Fei que doi", 150, 150, 25, 25, 25, 25].


conexaoRuim(Inimigo) :- Inimigo = ["Conexão Ruim", "Seu maior inimigo em dias de jogar ou de enviar o trabalho de última hora", 150, 150, 20, 15, 10, 15].


oCaraAlho(Inimigo) :- Inimigo = ["O Cara Alho", "Só um cara com mal hálito", 125, 125, 25, 10, 15, 25].


pinky(Inimigo) :- Inimigo = ["Pinky", "Irmão Do Cérebro", 150, 150, 20, 25, 10, 20].


cerebro(Inimigo) :- Inimigo = ["Cérebro", "Irmão do Pinky", 150, 150, 20, 20, 25, 10].


gru1Fase4(GrupoDeInimigos) :- papaco(A),papaco(B),pauloGuedes(C),GrupoDeInimigos = [3, 700, [A,B,C]].


gru2Fase4(GrupoDeInimigos) :- nemesis(A),pauloGuedes(B),GrupoDeInimigos = [2, 800, [A,B]].


gru3Fase4(GrupoDeInimigos) :- nemesis(A),nemesis(B),GrupoDeInimigos = [3, 900, [A,B]].


gru4Fase4(GrupoDeInimigos) :- pinky(A),cerebro(B),conexaoRuim(C),GrupoDeInimigos = [3, 800, [A,B,C]].


gru5Fase4(GrupoDeInimigos) :- conexaoRuim(A),oCaraAlho(B),cerebro(C),GrupoDeInimigos = [3, 900, [A,B,C]].


piloto(Fase) :- gru1Fase4(A),gru2Fase4(B),gru3Fase4(C),gru4Fase4(D),gru5Fase4(E),Fase = ["Piloto", "Fase de testes, cuidado senão ela ele te derruba", 5, [A,B,C,D,E]].

/* Fase 5 */


gravida(Inimigo) :- Inimigo = ["Grávida de Taubaté", "Grávida (quase).", 250, 250, 30, 30, 25, 30].


filho(Inimigo) :- Inimigo = ["Filho da Grávida", "Filho de mentirinha", 100, 100, 15, 15, 10, 15].


etBilu(Inimigo) :- Inimigo = ["Et Bilu", "Busquem conhecimento", 150, 150, 25, 25, 35, 20].


jovem(Inimigo) :- Inimigo = ["Jovem", "Ninguém gosta de Jovem", 270, 270, 30, 30, 35, 25].


cowboy(Inimigo) :- Inimigo = ["Cowboy do Espaço", "See you Space Cowboy", 100, 100, 15, 15, 15, 15].


gru1Fase5(GrupoDeInimigos) :- gravida(A),filho(B),GrupoDeInimigos = [1000, 2, [A,B]].


gru2Fase5(GrupoDeInimigos) :- etBilu(A),jovem(B),GrupoDeInimigos = [1100, 2, [A,B]].


gru3Fase5(GrupoDeInimigos) :- cowboy(A),GrupoDeInimigos = [1000, 1, [A]].


gru4Fase5(GrupoDeInimigos) :- gravida(A),jovem(B),etBilu(C),GrupoDeInimigos = [1200, 3, [A,B,C]].


area51(Fase) :- gru1Fase5(A),gru2Fase5(B),gru3Fase5(C),gru4Fase5(D),Fase = ["Área 51", "Ninguém sabe o que tem aí dentro", 4, [A,B,C,D]].

/* Boss */


boss(Inimigo) :- Inimigo = ["Light Theme IDE", "Fiquei ceguin", 500, 500, 50, 50, 50, 50].


gBoss(GrupoDeInimigos) :- boss(A),GrupoDeInimigos = [1, 50000000, [A]].


faseBoss(Fase) :- gBoss(A),Fase = ["Última fase do jogo", "Se ligue não", 1, [A]].


/* Pocoes */


pocaoRestauraVida(Pocao) :- Pocao = ["Liquido Filosofal", "a pedra derreteu", 400, 1000].
    


pocaoBebada(Pocao) :- Pocao = ["Agua que passarinho nao bebe", "vamos tomar uma", 30, 10].
    


pocaoNinja(Pocao) :- Pocao = ["Uma liquido dos ninjas", "em pleno ar se condensa em Lion Man...",  60, 20].
    

  
pocaoAjudaAosDogs(Pocao) :- Pocao = ["Ajude-nos na iniciativa DOGadores", "essas poção não te melhora em nada, mas o dinheiro ira ajudar os animais de rua", 500, 0].
    


pocaoStronda(Pocao) :- Pocao = ["Líquido Stronda", "o monstro chegou!", 40, 25].
    


pocaoTransformice(Pocao) :- Pocao = ["Transformice", "um rato em busca do seu queijo", 10, 10].
    


pocaoTranquila(Pocao) :- Pocao = ["Líquido tranquilo", "não fala do meu pai", 80, 10].
    


pocaoApelona(Pocao) :- Pocao = ["um hack", "não deixe o dono do jogo saber dela", 99, 69].



pocaoCapitao(Pocao) :- Pocao = ["Soro do Super Soldado", "te deixará forte por pouco tempo", 120, 40].



pocaoRedbull(Pocao) :- Pocao = ["RedBull", "te dará asas", 44, 10].
    

pocaoRedBullDupla(Pocao) :- Pocao = ["RedBull com Café", "te dará 4 asas", 88, 20].
    

pocaoCafeComGuarana(Pocao) :- Pocao = ["Cafe com Guarana", "Te despertará de um jeito...", 100, -35].


/* Loja */


lojao(Loja) :- 
    maos(A),lancaTris(B),armaADura(C),adagasSile(D),donut(E),tridente(F),armaConfete(G),escudo(H),lazy(I),metralha(J),
    roupas(A1),mofi(A2),barril(A3),couro(A4),tempes(A5),armaDoFim(A6),gosmenta(A7),tormenta(A8),eucli(A9),divina(A10),
    pocaoRestauraVida(B1),pocaoBebada(B2),pocaoNinja(B3),pocaoAjudaAosDogs(B4),pocaoStronda(B5),pocaoTransformice(B6),pocaoTranquila(B7),pocaoApelona(B8),pocaoCapitao(B9),pocaoRedbull(B10),pocaoRedBullDupla(B11),pocaoCafeComGuarana(B12),
     Loja =  [10, [A,B,C,D,E,F,G,H,I,J], 
    10, [A1,A2,A3,A4,A5,A6,A7,A8,A9,A10], 
    12, [B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12]].
