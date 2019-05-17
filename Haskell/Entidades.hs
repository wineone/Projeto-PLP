module Entidades where

import Estruturas



-- ++++++++++++++++++++++++++ FASE 1 ++++++++++++++++++++++

cururu :: Inimigo
cururu = Inimigo "Sapo Cururu" "Imune ao frio" 40 40 7 5 6 6 

jacare :: Inimigo
jacare = Inimigo "Jacaré da UFCG" "Aparece de vez em nunca na lagoa para assustar os estudantes" 35 35 6 6 5 6 

slime :: Inimigo
slime = Inimigo "Slime de Lama" "Parece uma poça, cuidado para não pisar em cima" 30 30 5 5 5 5

pato :: Inimigo
pato = Inimigo "Pato no Tucupi" "ABC da Amazonia" 34 34 5 6 6 6


gru1Fase1 :: GrupoDeInimigos
gru1Fase1 = GrupoDeInimigos 3 120 [cururu,jacare,cururu]

gru2Fase1 :: GrupoDeInimigos
gru2Fase1 = GrupoDeInimigos 3 100 [pato,slime,slime]

gru3Fase1 :: GrupoDeInimigos
gru3Fase1 = GrupoDeInimigos 3 100 [pato,jacare,cururu]

manguezal :: Fase
manguezal = Fase "Manguezal" "Se não tiver usando botas, vai se sujar de lama" 3 [gru1Fase1,gru2Fase1,gru3Fase1]

-- ++++++++++++++++  FIM DA FASE 1 ++++++++++++++++++++++++++++


-- +++++++++++++++++    ARMAS   ++++++++++++++++++
maos :: Arma
maos = Arma "Suas mãos" "Estilo minecraft" 1 10 10 10

lancaTris :: Arma
lancaTris = Arma "lança da tristeza" "mata seus inimigos de suicidio" 300 10 2 3

armaADura :: Arma
armaADura = Arma "Arma A dura" "dizem que essa arma é feita de rapadura" 400 15 7 5

adagasSile :: Arma
adagasSile = Arma "Adagas Silenciosas" "Aqueles que gritam são seus inimigos" 500 15 5 15

donut :: Arma
donut = Arma "Um donut" "não tem piadinha, é só um donut muito gostoso" 600 20 5 5

tridente :: Arma
tridente = Arma "tridente banguela" "é... agora ele é um bidente" 400 20 10 10

armaConfete :: Arma
armaConfete = Arma "Arma de confete" "É carnaval meu povo" 200 10 5 2

escudo :: Arma
escudo = Arma "Escudo" "a melhor defesa é um ataque" 400 15 15 15

metralha :: Arma
metralha = Arma "Metralhadora de Golfinhos" "Vem dos confins do espaço..." 2000 200 200 200


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

