module Fases where

import Estruturas
import System.IO.Unsafe
import Print


fases :: Personagem -> IO Personagem
fases per = do
            let a = unsafePerformIO (printaFases per) 
            if(a == 1) then do
                return per --função que chama o manguezal
            else if (a == 2) then do
                return per -- função que chama a casa
            else if (a == 3) then do
                return per -- função que chama o jogoses Voraz
            else if (a == 4) then do
                return per -- função que cham o piloto
            else if (a == 5) then do
                return per -- função que chama a Area 51
            else if (a == 6) then do 
                return per -- função qeu chama o BOSS
            else if (a == 7) then do
                return per -- função que sai
            else do
                putStrLn "Opção invalida"
                fases per
            