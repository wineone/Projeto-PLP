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

data Pocao = Pocao {
    pocaoNome :: String,
    pocaoDescricao :: String,

    pocaoPreco :: Int,
    pocaoVida :: Int
} deriving(Show)


data Bolsa = Bolsa {
   bolsaPocao :: [Pocao],
   bolsaArmadura :: [Armadura],
   bolsaArma :: [Arma]

} deriving(Show)

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

<<<<<<< HEAD
data Fase = Fase {
    faseNome :: String,
    faseDescricao :: String,
    faseQtdInimigos :: Int
    -- lista de inimigos
} deriving (Show)
=======
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
>>>>>>> 5afb1009434b1b795c250c7afe4c84fb65a8e422
