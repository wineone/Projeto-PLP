module Fases where

import Estruturas
import System.IO.Unsafe
import Print
import Entidades
-- import System.Random (randomRIO)
import Batalha


fases :: Personagem -> IO Personagem
fases per = do
            let a = unsafePerformIO (printaFases per) 
            if(a == 1) then do
                return (unsafePerformIO (mapa per manguezal))
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


mapa :: Personagem -> Fase -> IO Personagem
mapa heroi fase = do
    descrMapa fase
    let op = unsafePerformIO printMapa

    if (op == 1) then do
        -- let num = (unsafePerformIO $ randomRIO (0,((faseQtdGrupos fase) - 1) :: Int) )
        let num = 0
        let grup = ((faseGrupo fase) !! num)
        let perso = (unsafePerformIO (batalha heroi  grup) )
        printaVida perso
        mapa perso fase
    else if (op == 2) then do
        putStrLn "função bolsa"
        return heroi
    else if (op == 3) then do
        putStrLn "quereu sair"
        return heroi
    else do
        putStrLn "O que você pensa que está fazendo??\n\n"
        mapa heroi fase
        return heroi