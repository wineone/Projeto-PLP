module Entidades where

import Estruturas

-- ++++++++++++++++++++++++++ FASE 1 ++++++++++++++++++++++

cururu :: Inimigo
cururu = Inimigo "Sapo Cururu" "Imune ao frio" 10 10 5 2 3 4 

jacare :: Inimigo
jacare = Inimigo "Jacaré da UFCG" "Aparece de vez em nunca na lagoa para assustar os estudantes" 7 7 3 3 4 2 

slime :: Inimigo
slime = Inimigo "Slime de Lama" "Parece uma poça, cuidado para não pisar em cima" 4 4 3 3 4 3

pato :: Inimigo
pato = Inimigo "Pato no Tucupi" "ABC da Amazonia" 10 10 3 4 5 4


gru1Fase1 :: GrupoDeInimigos
gru1Fase1 = GrupoDeInimigos 3 120 [cururu,jacare,cururu]

gru2Fase1 :: GrupoDeInimigos
gru2Fase1 = GrupoDeInimigos 3 100 [pato,slime,slime]

gru3Fase1 :: GrupoDeInimigos
gru3Fase1 = GrupoDeInimigos 3 100 [pato,jacare,cururu]

manguezal :: Fase
manguezal = Fase "Manguezal" "Se não tiver usando botas, vai se sujar de lama" 3 [gru1Fase1,gru2Fase1,gru3Fase1]

-- ++++++++++++++++  FIM DA FASE 1 ++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++ FASE 2 +++++++++++++++++++++++++++++++++++++


meia :: Inimigo
meia = Inimigo "Meia Chulelenta" "Bem fedida mesmo" 20 20 5 5 2 2

bixo :: Inimigo
bixo = Inimigo "Bixo Papão" "De baixo da sua cama, é... sempre esteve" 55 55 12 10 8 2

parede :: Inimigo
parede = Inimigo "Parede Mofada" "Lança esporos que podem te deixar doidão rs" 40 40 8 5 5 3
 
ventila :: Inimigo 
ventila = Inimigo "Ventilador de Teto" "Ele vai cair em cima de você, eu sei que você já imaginou isso" 60 60 15 10 5 5

chao :: Inimigo
chao = Inimigo "Chão Movediço" "Quando você entrar o chão quase lhe engoliu" 35 35 7 7 7 5

louca :: Inimigo
louca = Inimigo "Louça Suja" "Ela passou tanto tempo na pia que criou vida" 50 50 10 10 10 7

gru1Fase2 :: GrupoDeInimigos
gru1Fase2 = GrupoDeInimigos 3 200 [meia,meia,meia]

gru2Fase2 :: GrupoDeInimigos
gru2Fase2 = GrupoDeInimigos 3 300 [meia,bixo,parede]

gru3Fase2 :: GrupoDeInimigos
gru3Fase2 = GrupoDeInimigos 3 400 [bixo,ventila,chao]

gru4Fase2 :: GrupoDeInimigos
gru4Fase2 = GrupoDeInimigos 4 400 [louca,chao,meia,meia]

gru5Fase2 :: GrupoDeInimigos
gru5Fase2 = GrupoDeInimigos 4 500 [meia,meia,louca,ventila]

casa :: Fase
casa = Fase "Casa da Mãe Joana" "Tem coisas aqui que os deixariam enojados" 5 [gru1Fase2,gru2Fase2,gru3Fase2,gru3Fase2,gru4Fase2,gru5Fase2]


-- +++++++++++++++++++++++++++ FIM DA FASE 2 +++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++ FASE 3 +++++++++++++++++++++++++++++++++++++++++++++++++++

seneca :: Inimigo
seneca = Inimigo "Seneca" "Não sou o Soneca, sou o Seneca" 70 70 8 8 7 8

reimite :: Inimigo
reimite = Inimigo "reimite" "Onde está a pinga" 100 100 10 15 8 14

pita :: Inimigo 
pita = Inimigo "Pita" "Perdeu as perna mas passa bem" 85 85 10 15 7 8

katenisse :: Inimigo
katenisse = Inimigo "Katenisse" "Ela é o tordo, visse" 90 90 12 11 12 13

gueiou :: Inimigo
gueiou = Inimigo "Gueiou" "Eu estou apaixonado por Katenisse" 80 80 9 12 7 10

esnou :: Inimigo
esnou = Inimigo "Esnou" "Sou o presidente, talkei" 80 80 16 8 8 15

finique :: Inimigo 
finique = Inimigo "Finique" "Perdeu a cabeça, algo compreesível" 95 95 13 15 12 11


gru1Fase3 :: GrupoDeInimigos
gru1Fase3 = GrupoDeInimigos 2 600 [seneca,reimite]

gru2Fase3 :: GrupoDeInimigos
gru2Fase3 = GrupoDeInimigos 2 600 [pita,katenisse]

gru3Fase3 :: GrupoDeInimigos
gru3Fase3 = GrupoDeInimigos 3 600 [pita,katenisse, gueiou]

gru4Fase3 :: GrupoDeInimigos
gru4Fase3 = GrupoDeInimigos 3 600 [esnou,katenisse,finique]


jogosVoraz :: Fase
jogosVoraz = Fase "Jogoses Voraz" "Tributos contra os zinimigos" 4 [gru1Fase3,gru2Fase3,gru3Fase3,gru4Fase3]

-- ++++++++++++++++++++++++ FIM DA FASE 3 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++ COMEÇO DA FASE 4 +++++++++++++++++++++++++++++++++++++++++++++++++

papaco :: Inimigo
papaco = Inimigo "Papaco" "Um pistoleiro chamado Papaco" 100 100 15 15 15 15

pauloGuedes :: Inimigo 
pauloGuedes = Inimigo "Paulo Guedes" "Eu vo privatiza ese jogo" 110 110 20 20 20 20

nemesis :: Inimigo
nemesis = Inimigo "Nemesis" "Fei que doi" 150 150 25 25 25 25

conexaoRuim :: Inimigo
conexaoRuim = Inimigo "Conexão Ruim" "Seu maior inimigo em dias de jogar ou de enviar o trabalho de última hora" 150 150 20 15 10 15 

oCaraAlho :: Inimigo
oCaraAlho = Inimigo "O Cara Alho" "Só um cara com mal hálito" 125 125 25 10 15 25

pinky :: Inimigo
pinky = Inimigo "Pinky" "Irmão Do Cérebro" 150 150 20 25 10 20

cerebro :: Inimigo
cerebro = Inimigo "Cérebro" "Irmão do Pinky" 150 150 20 20 25 10

gru1Fase4 :: GrupoDeInimigos
gru1Fase4 = GrupoDeInimigos 3 700 [papaco,papaco,pauloGuedes]

gru2Fase4 :: GrupoDeInimigos
gru2Fase4 = GrupoDeInimigos 2 800 [nemesis,pauloGuedes]

gru3Fase4 :: GrupoDeInimigos
gru3Fase4  = GrupoDeInimigos 3 900 [nemesis,nemesis]

gru4Fase4 :: GrupoDeInimigos
gru4Fase4 = GrupoDeInimigos 3 800 [pinky,cerebro,conexaoRuim]

gru5Fase4 :: GrupoDeInimigos
gru5Fase4 = GrupoDeInimigos 3 900 [conexaoRuim,oCaraAlho,cerebro]

piloto :: Fase
piloto = Fase "Piloto" "Fase de testes, cuidado senão ela ele te derruba" 5 [gru1Fase4,gru2Fase4,gru3Fase4,gru4Fase4,gru5Fase4]

-- +++++++++++++++++++++++++++++++++++++++++ FIM DA FASE 4 +++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++ INICIO DA FASE 5 +++++++++++++++++++++++++++++++

gravida :: Inimigo 
gravida = Inimigo "Grávida de Taubaté" "Grávida (quase)." 250 250 30 30 25 30

filho :: Inimigo
filho = Inimigo "Filho da Grávida" "Filho de mentirinha" 100 100 15 15 10 15

etBilu :: Inimigo
etBilu = Inimigo "Et Bilu" "Busquem conhecimento" 150 150 25 25 35 20

jovem :: Inimigo
jovem = Inimigo "Jovem" "Ninguém gosta de Jovem" 270 270 30 30 35 25

cowboy :: Inimigo 
cowboy = Inimigo "Cowboy do Espaço" "See you Space Cowboy" 100 100 15 15 15 15

gru1Fase5 :: GrupoDeInimigos
gru1Fase5 = GrupoDeInimigos 1000 2 [gravida,filho]

gru2Fase5 :: GrupoDeInimigos
gru2Fase5 = GrupoDeInimigos 1100 2 [etBilu,jovem]

gru3Fase5 :: GrupoDeInimigos
gru3Fase5 = GrupoDeInimigos 1000 1 [cowboy]

gru4Fase5 :: GrupoDeInimigos
gru4Fase5 = GrupoDeInimigos 1200 3 [gravida,jovem,etBilu]

area51 :: Fase
area51 = Fase "Área 51" "Ninguém sabe o que tem aí dentro" 4 [gru1Fase5,gru2Fase5,gru3Fase5,gru4Fase5]

-- ++++++++++++++++++++++++++++++++++++ FIM DA FASE 5 +++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++ COMEÇO DO BOSS ++++++++++++++++++++++++++++++++++++++


boss :: Inimigo
boss = Inimigo "Light Theme IDE" "Fiquei ceguin" 500 500 50 50 50 50

gBoss :: GrupoDeInimigos
gBoss = GrupoDeInimigos 1 50000000 [boss]

faseBoss :: Fase
faseBoss = Fase "Última fase do jogo" "Se ligue não" 1 [gBoss]

-- +++++++++++++++++++++++++++++++++ FIM DO BOSS ++++++++++++++++++++++++++++++++++++++++++++



-- +++++++++++++++++    ARMAS   ++++++++++++++++++
maos :: Arma
maos = Arma "Suas mãos" "Estilo minecraft" 1 10 10 10

lancaTris :: Arma
lancaTris = Arma "lança da tristeza" "mata seus inimigos de suicidio" 300 20 20 20

armaADura :: Arma
armaADura = Arma "Arma A dura" "dizem que essa arma é feita de rapadura" 500 30 20 25

adagasSile :: Arma
adagasSile = Arma "Adagas Silenciosas" "Aqueles que gritam são seus inimigos" 800 40 30 15

donut :: Arma
donut = Arma "Um donut" "não tem piadinha, é só um donut muito gostoso" 1200 40 40 40

tridente :: Arma
tridente = Arma "tridente banguela" "é... agora ele é um bidente" 1600 50 30 30

armaConfete :: Arma
armaConfete = Arma "Arma de confete" "É carnaval meu povo" 2000 50 50 50

lazy :: Arma
lazy = Arma "Lazy Evaluation" "Mata todo mundo de RAIVA" 2200 60 40 50

escudo :: Arma
escudo = Arma "Escudo" "a melhor defesa é um ataque" 2500 70 40 40




metralha :: Arma
metralha = Arma "Metralhadora de Golfinhos" "Vem dos confins do espaço..." 5000 200 200 200


-- +++++++++++++++++  FIM ARMAS   ++++++++++++++++++

-- +++++++++++++++++    POCOES   ++++++++++++++++++
pocaoRestauraVida :: Pocao 
pocaoRestauraVida = Pocao "Liquido Filosofal" "a pedra derreteu" 400 1000
    

pocaoBebada :: Pocao  
pocaoBebada = Pocao  "Agua que passarinho nao bebe" "vamos tomar uma" 30 10
    


pocaoNinja :: Pocao  
pocaoNinja = Pocao "Uma liquido dos ninjas" "em pleno ar se condensa em Lion Man..."  60 20
    


pocaoAjudaAosDogs :: Pocao  
pocaoAjudaAosDogs = Pocao "Ajude-nos na iniciativa DOGadores" "essas poção não te melhora em nada, mas o dinheiro ira ajudar os animais de rua" 500 0
    

pocaoStronda :: Pocao  
pocaoStronda = Pocao "Líquido Stronda" "o monstro chegou!" 40 25
    


pocaoTransformice :: Pocao  
pocaoTransformice = Pocao "Transformice" "um rato em busca do seu queijo" 10 10
    


pocaoTranquila :: Pocao  
pocaoTranquila = Pocao "Líquido tranquilo" "não fala do meu pai" 80 10
    


pocaoApelona :: Pocao  
pocaoApelona = Pocao "um hack" "não deixe o dono do jogo saber dela" 99 69



pocaoCapitao :: Pocao  
pocaoCapitao = Pocao "Soro do Super Soldado" "te deixará forte por pouco tempo" 120 40



pocaoRedbull :: Pocao  
pocaoRedbull = Pocao "RedBull" "te dará asas" 44 10
    


pocaoRedBullDupla :: Pocao  
pocaoRedBullDupla = Pocao "RedBull com Café" "te dará 4 asas" 88 20
    
pocaoCafeComGuarana :: Pocao  
pocaoCafeComGuarana = Pocao "Cafe com Guarana" "Te despertará de um jeito..." 100 (-35)
 
-- +++++++++++++++++  FIM POCAO   ++++++++++++++++++


-- +++++++++++++++++  ARMADURAS   ++++++++++++++++++
roupas :: Armadura
roupas = Armadura "Roupas rasgadas" "Você chegou só com as roupas do corpo" 1 1 0 0 0


mofi :: Armadura
mofi = Armadura "Mofi's vestments" "Nem precisa de descrição kk" 500 10 10 10 10


barril :: Armadura
barril = Armadura "Um barril de madeira""bixo, tu não tem dinheiro, vai ter que ser essa mesmo" 700 15 22 20 10

couro :: Armadura
couro = Armadura "Armadura de couro" "por que tem sangue pingando?" 1000 20 25 15 20


tempes :: Armadura
tempes = Armadura "Armadura da Tempestade" "Tava chovendo nesse dia" 1200 15 15 30 30

armaDoFim :: Armadura
armaDoFim = Armadura "Armadura do fim" "Eu só queria terminar isso logo" 1500 40 45 30 40
    
gosmenta :: Armadura 
gosmenta = Armadura "Armadura de catarro" "~gorfa~" 2000 60 30 30 40

tormenta :: Armadura
tormenta = Armadura "Fúria do Norte" "Essa armadura já viu o passar das eras" 2500 70 50 50 40

eucli :: Armadura
eucli = Armadura "Armadura Não-Euclidiana" "Eu não sei nem por onde começar pra explicar" 3000 70 80 60 70 

divina :: Armadura
divina = Armadura "Armadura de Virgem" "Quem veste isso se torna o mais próximo possível de Deus." 5000 200 200 200 200

-- +++++++++++++++++  FIM ARMADURAS   ++++++++++++++++++

-- +++++++++++++++++ LOJA ++++++++++++++++++

lojao :: Lojas
lojao = Lojas 10 [maos,lancaTris,armaADura,adagasSile,donut,tridente,armaConfete,escudo,lazy,metralha] 10 [roupas,mofi,barril,couro,tempes,armaDoFim,gosmenta,tormenta,eucli,divina] 12 [pocaoRestauraVida,pocaoBebada,pocaoNinja,pocaoAjudaAosDogs,pocaoStronda,pocaoTransformice,pocaoTranquila,pocaoApelona,pocaoCapitao,pocaoRedbull,pocaoRedBullDupla,pocaoCafeComGuarana]

--7 armaduras
--12 pocoes
--9 armas
-- +++++++++++++++++ FIM LOJA ++++++++++++++++++