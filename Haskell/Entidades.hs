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



