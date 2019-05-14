module Estruturas where

data Arma = Arma {
    armaNome :: String,
    armaDescricao :: String,

    armaPreco :: Int,
    armaDano :: Int,
    armaForca :: Int,
    armaAgilidade :: Int
} deriving (Show)


data Armadura = Armadura {
    armaduraNome :: String,
    armaduraDescricao :: String,

    armaduraPreco :: Int,
    armaduraArmadura :: Int,
    armaduraForca :: Int,
    armaduraAgilidade :: Int,
    armaduraVida :: Int
} deriving (Show)

data Personagem = Personagem{
    personagemNome :: String,
    
    personagemVidaAtual :: Int,
    personagemVidaMax :: Int,

    personagemDano :: Int,
    personagemDefesa :: Int,
    personagemForca :: Int,
    personagemAgilidade :: Int,

    personagemDinheiro :: Int

    -- arma :: Arma, ageitar
    -- armadura :: Armadura ajeitar

    
} deriving (Show)