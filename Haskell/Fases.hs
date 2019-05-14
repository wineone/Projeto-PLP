module Fases where

import Estruturas

fases :: Personagem -> IO Personagem
fases per = do
            let a = unsafePerformIO (printaFases per) 
            if(a == 1) then do
                lobby per --função que chama o manguezal
            else if (a == 2) then do
                lobby per -- função que chama a casa
            else if (a == 3) then do
                lobby per -- função que chama o jogoses Voraz
            else if (a == 4) then do
                lobby per -- função que cham o piloto
            else if (a == 5) then do
                lobby per -- função que chama a Area 51
            else if (a == 6) then do 
                lobby per -- função qeu chama o BOSS
            else if (a == 7) then do
                lobby per -- função que sai
            else
                fases per
            