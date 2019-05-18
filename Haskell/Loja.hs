module Loja where

import Estruturas
import System.IO.Unsafe
import Print
import System.Random (randomRIO)
import System.IO.Unsafe


floja :: Personagem -> IO Personagem
floja per = do

    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do -- função que chama armadura
        return per 
    else if (a == 2) then do
        return per -- função que chama armadura
    else if (a == 3) then do
        return per -- função que chama pocao
    else if (a == 4) then do
        return per -- função que sai
    else do
        putStrLn "Opção invalida"
        floja per
        return per

-- compraArma :: Personagem -> Lojas -> IO Personagem
-- compraArma per lojinha = do
--         listaArma(armas)
--         compraArma per lojinha 
 --   if((personagemDinheiro per) > (Lojas pocoes[]))

-- compraArmadura :: Personagem -> IO Personagem
--compraArmadura

-- compraPocao :: Personagem -> IO Personagem
--compraPocao