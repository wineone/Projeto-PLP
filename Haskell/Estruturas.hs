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

    personagemDinheiro :: Int,

    arma :: Arma,    --, ageitar
    armadura :: Armadura    --ajeitar

    
} deriving (Show)

data Inimigo = Inimigo {
    inimigoNome :: String,
    inimigoDescricao :: String,

    inimigoVidaAtual :: Int,
    inimigoVidaMax :: Int,
    
    inimigoDano :: Int,
    inimigoForca :: Int,
    inimigoAgilidade :: Int,
    inimigoDefesa :: Int

} deriving (Show)

data GrupoDeInimigos = GrupoDeInimigos {
    grupoQuantidade :: Int,
    grupoLoot :: Int,
    grupoInimigos :: [Inimigo]
} deriving(Show)

data Fase = Fase {
    faseNome :: String,
    faseDescricao :: String,
    faseQtdGrupos :: Int,
    faseGrupo :: GrupoDeInimigos
} deriving (Show)