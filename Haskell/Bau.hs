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
percorreArma indArma (x:[]) = show (indArma) ++ " - " ++ armaNome x ++ "\n            +-> " ++ armaDescricao x  ++ "\n    dano: " ++ show(armaDano x) ++ "\n    força: " ++ show(armaForca x) ++ "\n    agilidade: " ++ show(armaAgilidade x) ++"\n\n" ++  (percorreArma (indArma + 1) [])
percorreArma indArma [] = ""
percorreArma indArma (x:xs) = show (indArma) ++ " - " ++ armaNome x ++ "\n            +-> " ++ armaDescricao x ++ "\n    dano: " ++ show(armaDano x) ++ "\n    força: " ++ show(armaForca x) ++ "\n    agilidade: " ++ show(armaAgilidade x) ++"\n\n" ++  (percorreArma (indArma + 1) xs)

percorreArmadura :: Int -> [Armadura] -> String
percorreArmadura indArmadura (x:[]) = show (indArmadura) ++ " - " ++ (armaduraNome x) ++ "\n            +-> " ++ (armaduraDescricao x) ++  "\n    vida: " ++      show (armaduraVida x) ++ "\n    agilidade: " ++ show (armaduraAgilidade x) ++"\n    armadura: " ++  show (armaduraArmadura x) ++ "\n    força: " ++     show (armaduraForca x) ++ "\n\n"++(percorreArmadura (indArmadura + 1) [])
percorreArmadura indArmadura [] = ""
percorreArmadura indArmadura (x:xs) =  show (indArmadura) ++ " - " ++ (armaduraNome x) ++ "\n            +-> " ++ (armaduraDescricao x) ++ "\n    vida: " ++      show (armaduraVida x) ++ "\n    agilidade: " ++ show (armaduraAgilidade x) ++"\n    armadura: " ++  show (armaduraArmadura x) ++ "\n    força: " ++     show (armaduraForca x) ++ "\n\n"++percorreArmadura (indArmadura + 1) xs

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

-- 

verificaValidadeArmadura :: Bolsa -> Int-> IO()
verificaValidadeArmadura bol remover = do
    if(remover >= tamanhoArmadura(bolsaArmadura bol)) then
        putStrLn "Indice invalido, bicho"
    else
        putStr ""

verificaValidadeArma :: Bolsa -> Int-> IO()
verificaValidadeArma bol remover = do
    if(remover >= tamanhoArma(bolsaArma bol)) then
        putStrLn "Indice invalido, bicho"
    else
        putStr ""

-- -- +++++++++++++++++++++++++++++ funções para executar as trocas de itens +++++++++++++++++++++++++++++

trocaArmadura :: Personagem -> Bolsa -> Int -> Personagem
trocaArmadura per bol ind = Personagem (personagemNome per) ((personagemVidaAtual per) + vida) (personagemVidaMax per + vida) (personagemDano per) defesa forca agilidade (personagemDinheiro per) (personagemArma per) ((bolsaArmadura bol) !! ind) bolsa
      where vida = (div (armaduraForca ((bolsaArmadura bol) !! ind)) 2) + (armaduraVida ((bolsaArmadura bol) !! ind)) - (armaduraVida (personagemArmadura per)) - (div (armaduraForca (personagemArmadura per)) 2)
            forca =  (personagemForca per) + (armaduraForca ((bolsaArmadura bol) !! ind)) - (armaduraForca (personagemArmadura per))
            defesa =  (div (armaduraArmadura ((bolsaArmadura bol) !! ind)) 2) - (div (armaduraArmadura (personagemArmadura per)) 2)
            agilidade = (personagemAgilidade per) + (armaduraAgilidade ((bolsaArmadura bol) !! ind)) - (armaduraAgilidade (personagemArmadura per))
            bolsa = addArmadura (personagemArmadura per) (Bolsa (bolsaPocao bol) (removeArmadura ind 0 (bolsaArmadura bol)) (bolsaArma bol))


trocaArma :: Personagem -> Bolsa -> Int -> Personagem
trocaArma per bol ind = Personagem (personagemNome per) ((personagemVidaAtual per) + vida) ((personagemVidaMax per) + vida) dano (personagemDefesa per) forca agilidade (personagemDinheiro per) ((bolsaArma bol) !! ind) (personagemArmadura per) bolsa
      where vida = (div (armaForca ((bolsaArma bol) !! ind)) 2)
            forca = (personagemForca per) + (armaForca ((bolsaArma bol) !! ind)) - (armaForca (personagemArma per))
            agilidade = (personagemAgilidade per) + (armaAgilidade ((bolsaArma bol) !! ind)) - (armaAgilidade (personagemArma per))
            bolsa = addArma (personagemArma per) (Bolsa (bolsaPocao bol) (bolsaArmadura bol) (removeArma ind 0 (bolsaArma bol)))
            dano = (armaDano ((bolsaArma bol) !! ind)) - (armaDano (personagemArma per))

-- +++++++++++++++++++++++++++++ lê entrada e executa as funções do bau +++++++++++++++++++++++++++++

trocaItens :: Personagem -> Bolsa -> IO Personagem
trocaItens per bol = do
      op3 <- opcoesTrocaItens
      if(op3 == 1) then do
        putStrLn (percorreArmadura 0 (bolsaArmadura bol))
        putStrLn "digite qual a armadura que deseja equipar"
        equipar <- readLn :: IO Int
        return (trocaArmadura per bol equipar)
        else if (op3 == 2) then do
        putStrLn (percorreArma 0 (bolsaArma bol))
        putStrLn "digite qual a arma que deseja equipar"
        equipar <- readLn :: IO Int
        return (trocaArma per bol equipar)
      else
         return per


remove :: Bolsa -> IO Bolsa
remove bol = do -- remover item do bau
            op2 <- opcoesRemove
            if(op2 == 1) then do
                putStrLn (percorreArmadura 0 (bolsaArmadura bol))
                putStrLn "digite qual armadura deseja remover"
                remover <- readLn :: IO Int
                verificaValidadeArmadura bol remover
                return(Bolsa (bolsaPocao bol) (removeArmadura remover 0 (bolsaArmadura bol)) (bolsaArma bol))

            else if(op2 == 2) then do
                putStrLn (percorreArma 0 (bolsaArma bol))
                putStrLn "digite qual arma deseja remover"
                remover <- readLn :: IO Int
                verificaValidadeArma bol remover
                return (Bolsa (bolsaPocao bol) (bolsaArmadura bol) (removeArma remover 0 (bolsaArma bol)))
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
            per <- trocaItens per (bolsa per)
            bau per
        else if(op == 2) then do --excluir item do bau
            newBolsa <- remove bol
            bau (Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (personagemDinheiro per) (personagemArma per) (personagemArmadura per) newBolsa)
        else if(op == 3) then do --vizualizar equipamento
            vizualizarEquipamento per
            bau per
        else if(op == 4) then   -- vasculhar sua bolsa
            bau (unsafePerformIO (gerenciaBolsa per))
        else
            system "clear"
            return per
