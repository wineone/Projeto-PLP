module Loja where

import Estruturas
import System.IO.Unsafe
import Print


floja :: Personagem -> IO Personagem
floja per = do
    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do
        return per -- função que chama arma
        --return (unsafePerformIO ())
    else if (a == 2) then do
        return per -- função que chama armadura
    else if (a == 3) then do
        return per -- função que chama pocao
    else if (a == 4) then do
        return per -- função que sai
    else do
        putStrLn "Opção invalida"
        floja per

-- compraArma :: Personagem -> Lojas -> IO Personagem
-- compraArma per = do
    --if((personagemDinheiro per) > ())
