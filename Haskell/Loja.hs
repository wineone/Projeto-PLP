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
    print (personagemDinheiro per)
    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do -- função que chama arma
                
        let op = unsafePerformIO (listaArma((armas loj)))
        fazNada op
        let novaBolsa = addArma ((armas loj) !! op) (bolsa per)
        -- lerOpcoes
        -- floja per loj
        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) (novaBolsa))
    else if (a == 2) then do

        let op = unsafePerformIO (listaArmadura((armaduras loj)))
        fazNada op
        let novaBolsa = addArmadura ((armaduras loj) !! op) (bolsa per)
        -- lerOpcoes
        -- floja per loj
        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) (novaBolsa))

        --listaArmadura((armaduras loj))-- função que chama armadura
        --lerOpcoes
        --floja per loj
    else if (a == 3) then do
        
        let op = unsafePerformIO (listaPocao((pocoes loj)))
        fazNada op
        let novaBolsa = addPocao ((pocoes loj) !! op) (bolsa per)
        -- lerOpcoes
        -- floja per loj
        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) (novaBolsa))

        --listaPocao(pocoes loj)-- função que chama pocao
        --lerOpcoes
        --floja per loj
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