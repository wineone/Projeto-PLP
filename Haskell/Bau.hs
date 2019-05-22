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
percorreArma indArma (x:[]) = show (indArma) ++ " - " ++ armaNome x ++ "\n            +-> " ++ armaDescricao x ++ "\n" ++ (percorreArma (indArma + 1) [])
percorreArma indArma [] = ""
percorreArma indArma (x:xs) = show (indArma) ++ " - " ++ armaNome x ++ "\n            +-> " ++ armaDescricao x ++ "\n" ++ percorreArma (indArma + 1) xs

percorreArmadura :: Int -> [Armadura] -> String
percorreArmadura indArmadura (x:[]) = show (indArmadura) ++ " - " ++ (armaduraNome x) ++ "\n            +-> " ++ (armaduraDescricao x) ++ "\n" ++ (percorreArmadura (indArmadura + 1) [])
percorreArmadura indArmadura [] = ""
percorreArmadura indArmadura (x:xs) =  show (indArmadura) ++ " - " ++ (armaduraNome x) ++ "\n            +-> " ++ (armaduraDescricao x) ++ "\n" ++ percorreArmadura (indArmadura + 1) xs

percorrePocao :: Int -> [Pocao] -> String
percorrePocao indPocao (x:[]) = show (indPocao) ++ " - " ++ pocaoNome x ++ "\n            +-> " ++ pocaoDescricao x ++ "\n" ++ ( percorrePocao (indPocao + 1) [])
percorrePocao indPocao [] = ""
percorrePocao indPocao (x:xs) = show (indPocao) ++ " - " ++ pocaoNome x ++ "\n            +-> " ++ pocaoDescricao x ++ "\n" ++ percorrePocao (indPocao + 1) xs

-- +++++++++++++++++++++++++++++ retorna os valores necessarios para uso de itens +++++++++++++++++++++++++++++
usaArmadura :: Int -> Int -> [Armadura] -> Armadura
--usaArmadura indArmaduraSair indArmaduraAtual [] = []
usaArmadura indArmaduraSair indArmaduraAtual (x:xs)
            | (indArmaduraSair == indArmaduraAtual) = x 
            | otherwise =(usaArmadura indArmaduraSair (indArmaduraAtual + 1) xs)

usaArma :: Int -> Int -> [Arma] -> Arma
--usaArma indArmaSair indArmaAtual [] = []
usaArma indArmaSair indArmaAtual (x:xs)
        | (indArmaSair == indArmaAtual) = x 
        | otherwise = (usaArma indArmaSair (indArmaAtual + 1) xs)

usaPocao :: Int -> Int -> [Pocao] -> Pocao
-- usaPocao indPocaoSair indPocaoAtual [] = Pocao ("","",0,0)
usaPocao indPocaoSair indPocaoAtual (x:xs)
                | (indPocaoSair == indPocaoAtual) = x
                | otherwise = (usaPocao indPocaoSair (indPocaoAtual + 1) xs)

-- +++++++++++++++++++++++++++++ retorna tamanho do array +++++++++++++++++++++++++++++

tamanhoPocao :: [Pocao] -> Int
tamanhoPocao [] = 0
tamanhoPocao (x:[]) = 1
tamanhoPocao (x:xs) = 1 + tamanhoPocao (xs)


tamanhoArmadura :: [Armadura] -> Int
tamanhoArmadura [] = 0
tamanhoArmadura (x:[]) = 1
tamanhoArmadura (x:xs) = 1 + tamanhoArmadura (xs)



tamanhoArma :: [Arma] -> Int
tamanhoArma [] = 0
tamanhoArma (x:[]) = 1
tamanhoArma (x:xs) = 1 + tamanhoArma (xs)


-- +++++++++++++++++++++++++++++ lê entrada e executa as funções do bau +++++++++++++++++++++++++++++

remove :: Bolsa -> IO Bolsa
remove bol = do -- remover item do bau
            op2 <- opcoesRemove 
            if(op2 == 1) then do
                putStrLn (percorreArmadura 0 (bolsaArmadura bol))
                putStrLn "digite qual armadura deseja remover"
                remover <- readLn :: IO Int
                if(remover <= (tamanhoArmadura (bolsaArmadura bol))) then
                    return (Bolsa (bolsaPocao bol) (removeArmadura remover 0 (bolsaArmadura bol)) (bolsaArma bol))
                else do
                    putStrLn "Indice Invalido, doido"
                    digite
                    return (unsafePerformIO(remove  bol))
            else if(op2 == 2) then do
                putStrLn (percorreArma 0 (bolsaArma bol))
                putStrLn "digite qual arma deseja remover"
                remover <- readLn :: IO Int
                if(remover <= (tamanhoArma (bolsaArma bol))) then
                    return (Bolsa (bolsaPocao bol) (bolsaArmadura bol) (removeArma remover 0 (bolsaArma bol)))
                else do
                    putStrLn "Indice Inválido,bicho"
                    digite
                    return (unsafePerformIO(remove  bol))
            else
                return bol


gerenciaBolsa :: Personagem -> IO Personagem
gerenciaBolsa per = do 
        op <- opcoesRemoveBolsa
        let bol = bolsa per
        if(op == 1) then do --listar poçoes
            putStrLn (percorrePocao 0 (bolsaPocao bol))
            digite
            return (unsafePerformIO (gerenciaBolsa ((Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) bol) )))
        
        else if (op == 2) then do -- usar poçoes
            putStrLn (percorrePocao 0 (bolsaPocao bol))
            putStr "Digite qual pocao deseja usar  "
            usar <- readLn :: IO Int 
            let x = usaPocao usar 0 (bolsaPocao bol)                
            putStrLn ("Voce usou essa poção: " ++ (pocaoNome x))
            digite
            let newBolsa =  Bolsa (removePocao usar 0 (bolsaPocao bol)) (bolsaArmadura bol) (bolsaArma bol)
            
            return (unsafePerformIO (gerenciaBolsa (Personagem (personagemNome per) ( min (personagemVidaMax per) ((personagemVidaAtual per) + pocaoVida x)   )  (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) newBolsa) ))
        
        else if (op == 3) then do -- remover poçoes
            putStrLn (percorrePocao 0 (bolsaPocao bol))
            putStr "Digite qual pocao deseja jogar fora  "
            remover <- readLn :: IO Int
            putStrLn ("Você jogou isso: " ++ (pocaoNome ((bolsaPocao bol) !! remover)))
            digite
            let newBolsa =  Bolsa (removePocao remover 0 (bolsaPocao bol)) (bolsaArmadura bol) (bolsaArma bol)
            return (unsafePerformIO(gerenciaBolsa ( Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) newBolsa)))
        else
            return (per)

bau :: Personagem -> IO Personagem
bau per = do
        op <- opcoesBau
        let bol = bolsa per 
        if (op == 1) then do --trocar equipamento
            return per
        else if(op == 2) then do --excluir item do bau
            newBolsa <- remove bol
            return (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) newBolsa)
        else if(op == 3) then do --vizualizar equipamento
            vizualizarEquipamento per
            return per
        else if(op == 4) then   -- vasculhar sua bolsa
            return (unsafePerformIO (gerenciaBolsa per))
            
        else
            return per
