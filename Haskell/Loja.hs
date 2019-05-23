module Loja where

import Estruturas
import System.IO.Unsafe
import Print
import System.Random (randomRIO)
import System.IO.Unsafe
import Entidades
import Bau
import System.Process
import System.IO


floja :: Personagem -> Lojas -> IO Personagem
floja per loj = do
    system "clear"
    putStr "Dinheiro em caixa: "
    print (personagemDinheiro per)
    putStrLn ""
    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do -- função que chama arma
                
        let op = unsafePerformIO (listaArma(armas loj) per)
        fazNada op
        let poiva = armaPreco (armas lojao !! op)
        let novaBolsa = addArma ((armas loj) !! op) (bolsa per)

        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) ((personagemDinheiro per) - poiva) (personagemArma per) (personagemArmadura per) (novaBolsa))
    else if (a == 2) then do

        let op = unsafePerformIO (listaArmadura(armaduras loj) per)
        fazNada op
        let poiva = armaduraPreco (armaduras lojao !! op)
        let novaBolsa = addArmadura ((armaduras loj) !! op) (bolsa per)

        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) ((personagemDinheiro per) - poiva) (personagemArma per) (personagemArmadura per) (novaBolsa))

    else if (a == 3) then do
        
        let op = unsafePerformIO (listaPocao(pocoes loj) per)
        fazNada op
        let poiva = pocaoPreco (pocoes lojao !! op)
        let novaBolsa = addPocao ((pocoes loj) !! op) (bolsa per)

        return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) ((personagemDinheiro per) - poiva) (personagemArma per) (personagemArmadura per) (novaBolsa))


    else if (a == 4) then do
        return per -- função que sai
    else do
        putStrLn "Opção invalida"
        floja per loj
        return per

