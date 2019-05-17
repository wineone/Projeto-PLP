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
percorreArma indArma (x:xs)
           | null xs = armaNome x            
           | otherwise = show (indArma) ++ " - " ++ armaNome x ++ armaDescricao x ++ "\n" ++ percorreArma (indArma + 1) xs 

percorreArmadura :: Int -> [Armadura] -> String
percorreArmadura indArmadura (x:xs)
            | null xs = armaduraNome x            
            | otherwise = show (indArmadura) ++ " - " ++ armaduraNome x ++ armaduraDescricao x ++ "\n" ++ percorreArmadura (indArmadura + 1) xs

percorrePocao :: Int -> [Pocao] -> String
percorrePocao indPocao (x:xs)
           | null xs = pocaoNome x            
           | otherwise = show (indPocao) ++ " - " ++ pocaoNome x ++ pocaoDescricao x ++ "\n" ++ percorrePocao (indPocao + 1) xs

-- +++++++++++++++++++++++++++++ lê entrada e executa as funções do bau +++++++++++++++++++++++++++++


bau :: Personagem -> IO Personagem 
bau p =
    return p