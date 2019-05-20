module Bau where

import Estruturas
import System.IO.Unsafe
import Print
-- +++++++++++++++++++++++++++++ Funcões que adicionam itens no arrays ++++++++++++++++++++
addArmadura :: Armadura -> Bolsa -> Bolsa
addArmadura armadura bol = Bolsa (bolsaPocao (bol)) (armadura : bolsaArmadura (bol)) (bolsaArma(bol))

addArma :: Arma -> Bolsa -> Bolsa
addArma arma bol = Bolsa (bolsaPocao (bol)) (bolsaArmadura (bol)) (arma : bolsaArma(bol))

addPocao :: Pocao -> Bolsa -> Bolsa
addPocao pocao bol = Bolsa (pocao : bolsaPocao (bol)) (bolsaArmadura (bol)) (bolsaArma(bol))

-- +++++++++++++++++++++++++++++ Funcões que retornam novas bolsas ++++++++++++++++++++++++
retornaArmadura :: Int -> Armadura -> Bolsa -> Bolsa
retornaArmadura indArmadura armadura bol = Bolsa (bolsaPocao (bol)) (removeArmadura indArmadura 0 (bolsaArmadura (bol))) (bolsaArma(bol))

retornaArma :: Int -> Arma -> Bolsa -> Bolsa
retornaArma indArma arma bol = Bolsa (bolsaPocao (bol)) (bolsaArmadura (bol)) (removeArma indArma 0 (bolsaArma (bol)))

retornaPocao :: Int -> Pocao -> Bolsa -> Bolsa
retornaPocao indPocao pocao bol = Bolsa (removePocao indPocao 0 (bolsaPocao (bol))) (bolsaArmadura (bol)) (bolsaArma(bol))

-- +++++++++++++++++++++++++++++ Funções que removem itens do array +++++++++++++++++++++++
removeArmadura :: Int -> Int -> [Armadura] -> [Armadura]
removeArmadura indArmaduraSair indArmaduraAtual [] = []
removeArmadura indArmaduraSair indArmaduraAtual (x:xs)
            | (indArmaduraSair == indArmaduraAtual) = removeArmadura indArmaduraSair (indArmaduraAtual + 1) xs
            | otherwise =  x : (removeArmadura indArmaduraSair (indArmaduraAtual + 1) xs)


removeArma :: Int -> Int -> [Arma] -> [Arma]
removeArma indArmaSair indArmaAtual [] = []
removeArma indArmaSair indArmaAtual (x:xs)
        | (indArmaSair == indArmaAtual) = removeArma indArmaSair (indArmaAtual + 1) xs
        | otherwise =  x : (removeArma indArmaSair (indArmaAtual + 1) xs)

removePocao :: Int -> Int -> [Pocao] -> [Pocao]
removePocao indPocaoSair indPocaoAtual [] = []
removePocao indPocaoSair indPocaoAtual (x:xs)
                | (indPocaoSair == indPocaoAtual) = removePocao indPocaoSair (indPocaoAtual + 1) xs
                | otherwise =  x : (removePocao indPocaoSair (indPocaoAtual + 1) xs)

-- +++++++++++++++++++++++++++++ Funcões que percorrem arrays +++++++++++++++++++++++++++++
percorreArma :: Int -> [Arma] -> String
percorreArma indArma (x:[]) = show (indArma) ++ " - " ++ armaNome x ++ " " ++ armaDescricao x ++ "\n" ++ (percorreArma (indArma + 1) [])
percorreArma indArma [] = ""
percorreArma indArma (x:xs) = show (indArma) ++ " - " ++ armaNome x ++ " " ++ armaDescricao x ++ "\n" ++ percorreArma (indArma + 1) xs

percorreArmadura :: Int -> [Armadura] -> String
percorreArmadura indArmadura (x:[]) = show (indArmadura) ++ " - " ++ (armaduraNome x) ++ " " ++ (armaduraDescricao x) ++ "\n" ++ (percorreArmadura (indArmadura + 1) [])
percorreArmadura indArmadura [] = ""
percorreArmadura indArmadura (x:xs) =  show (indArmadura) ++ " - " ++ (armaduraNome x) ++ " " ++ (armaduraDescricao x) ++ "\n" ++ percorreArmadura (indArmadura + 1) xs

percorrePocao :: Int -> [Pocao] -> String
percorrePocao indPocao (x:[]) = show (indPocao) ++ " - " ++ pocaoNome x ++ " " ++ pocaoDescricao x ++ "\n" ++ ( percorrePocao (indPocao + 1) [])
percorrePocao indPocao [] = ""
percorrePocao indPocao (x:xs) = show (indPocao) ++ " - " ++ pocaoNome x ++ " " ++ pocaoDescricao x ++ "\n" ++ percorrePocao (indPocao + 1) xs

-- +++++++++++++++++++++++++++++ lê entrada e executa as funções do bau +++++++++++++++++++++++++++++

remove :: Bolsa -> IO Bolsa
remove bol = do
            op2 <- opcoesRemove -- remover iten do bau
            if(op2 == 1) then do
                putStrLn (percorreArmadura 0 (bolsaArmadura bol))
                putStrLn "digite qual armadura deseja remover"
                remover <- readLn :: IO Int

                return (Bolsa (bolsaPocao bol) (removeArmadura remover 0 (bolsaArmadura bol)) (bolsaArma bol))
            else if(op2 == 2) then do
                putStrLn (percorreArma 0 (bolsaArma bol))
                putStrLn "digite qual arma deseja remover"
                remover <- readLn :: IO Int

                return (Bolsa (bolsaPocao bol) (bolsaArmadura bol) (removeArma remover 0 (bolsaArma bol)))
            else
                return bol

bau :: Personagem -> IO Personagem
bau per = do
        op <- opcoesBau
        let bol = bolsa per
        if (op == 1) then do
            return per
        else if(op == 2) then do
            newBolsa <- remove bol
            return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) newBolsa)
        else if(op == 3) then
            return per
        else if(op == 4) then
            return per
        else
            return per
