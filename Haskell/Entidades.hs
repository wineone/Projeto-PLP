module Entidades where

import Estruturas

-- ++++++++++++++++++++    INIMIGOS    ++++++++++++++++++++

-- inimigoNull ????

nemesis :: Inimigo
    nemesis = Inimigo "Nemesis" "Fei que dói" 50 50 5 5 5 5

pauloGuedes :: Inimigo
    pauloGuedes = Inimigo "Paulo Guedes" "Eu vo privatiza ese jogu" 17 17 3 3 3 3

-- ++++++++++++++++++++    GRUPOS    ++++++++++++++++++++

gp1 :: GrupoDeInimigos
    gp1 = GrupoDeInimigos 2 50 [nemesis, pauloGuedes]

-- ++++++++++++++++++++    FASES    ++++++++++++++++++++ 

teste :: Fase
    teste = Fase "Teste"