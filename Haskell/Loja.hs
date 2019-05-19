module Loja where

import Estruturas
import System.IO.Unsafe
import Print
import System.Random (randomRIO)
import System.IO.Unsafe
import Entidades
import Bau


floja :: Personagem -> Lojas-> IO Personagem
floja per loj = do
    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do -- função que chama arma
                
        listaArma((armas loj))

        --compraArma(per donut)
        --addArma(maos bols)
        lerOpcoes
        floja per loj
    else if (a == 2) then do

        listaArmadura((armaduras loj))-- função que chama armadura

        lerOpcoes
        floja per loj
    else if (a == 3) then do
        
        listaPocao(pocoes loj)-- função que chama pocao

        lerOpcoes
        floja per loj
    else if (a == 4) then do
        return per -- função que sai
    else do
        putStrLn "Opção invalida"
        floja per loj
        return per

-- compraArma :: Personagem -> Arma -> IO Personagem
-- compraArma person arminha = do
--         if ((personagemDinheiro person) > (armaPreco arminha)) then do
--             putStrLn "ddd"
--             compraArma person arminha
--             return person arminha
--         else do
--             putStrLn "Liso"
--             compraArma person arminha
--             return person arminha


-- compraArmadura :: Personagem -> IO Personagem
--compraArmadura

-- compraPocao :: Personagem -> IO Personagem
--compraPocao