module Batalha where

import System.IO.Unsafe
import System.Random (randomRIO)
import Fases
import Estruturas
import Print

esquiva :: Int -> Bool
esquiva agilidade = do
    let rValue = unsafePerformIO (randomRIO (1,100 :: Int))
    let rValue2 = ((unsafePerformIO (randomRIO (1,10 :: Int))) + (div (agilidade * 4) 100) )
    (rValue < rValue2)

critico :: Int -> Bool
critico agilidade = do
    let rValue = unsafePerformIO (randomRIO (1,100 :: Int))
    let rValue2 = ((unsafePerformIO (randomRIO (1,10 :: Int))) + (div (agilidade * 4) 100) )
    (rValue < rValue2)

heroiAtaca :: Personagem -> Int -> IO Int
heroiAtaca heroi bonusDano = do
    let dano = ( (personagemDano heroi) + (div (personagemForca heroi) 10) + ((personagemDano heroi) * bonusDano) )
    
    if (critico (personagemAgilidade heroi)) then do
        atkCritico
        printHeroiAtaca heroi (dano * 2)
        return (dano * 2)
    else do
        printHeroiAtaca heroi dano
        return dano
    
inimigoAtaca :: Inimigo -> IO Int
inimigoAtaca enemy = do
    let dano = ( (inimigoDano enemy) + (div (inimigoForca enemy) 10) )

    if (critico (inimigoAgilidade enemy)) then do
        atkCritico
        printInimigoAtaca enemy (dano * 2)
        return (dano * 2)
    else do
        printInimigoAtaca enemy dano
        return dano

-- heroiTomaDano :: Personagem -> Int -> IO Personagem
-- heroiTomaDano p danoInimigo = do
--     if (esquiva (personagemAgilidade p)) then do
--         putStrLn $ (personagemNome p) ++ " se esquivou."
--         return p
--     else do
--         let dano_Armadura = ( danoInimigo - (div (danoInimigo * (personagemDefesa p)) 100) )
--         let pRetorno = Personagem (personagemNome p) max(((personagemVidaAtual p) - dano_Armadura), 0) (personagemVidaMax p) (personagemDano p) (personagemDefesa p) (personagemForca p) (personagemAgilidade p) (personagemDinheiro p) (arma p) (armadura p)
        
--         printHeroiTomaDano p dano_Armadura
--         return pRetorno

-- inimigoRecebeDano :: Inimigo -> 