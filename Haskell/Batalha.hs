module Batalha where

import System.IO.Unsafe
import System.Random (randomRIO)
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
    let dano = ( (personagemDano heroi) + (div (personagemForca heroi) 10) + ( div ((personagemDano heroi) * bonusDano) 100 ) )
    
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

heroiTomaDano :: Personagem -> Int -> IO Personagem
heroiTomaDano p danoInimigo = do
    if (esquiva (personagemAgilidade p)) then do
        putStrLn $ (personagemNome p) ++ " se esquivou."
        return p
    else do
        let dano_Armadura = ( danoInimigo - (div (danoInimigo * (personagemDefesa p)) 100) )
        let pRetorno = Personagem (personagemNome p) (max((personagemVidaAtual p) - dano_Armadura) 0) (personagemVidaMax p) (personagemDano p) (personagemDefesa p) (personagemForca p) (personagemAgilidade p) (personagemDinheiro p) (personagemArma p) (personagemArmadura p) (bolsa p)
        
        printHeroiTomaDano p dano_Armadura
        return pRetorno

inimigoRecebeDano :: Int -> Int -> Inimigo ->  IO Inimigo
inimigoRecebeDano bonusEsquiva danoHeroi ini   = do

    -- divisorias == função que imprime barras de divisória
    
    if(esquiva ((inimigoAgilidade ini) + bonusEsquiva)) then do
        putStrLn ""
        divisorias

        putStrLn $ (inimigoNome ini) ++ " se esquivou"
        return ini
    else do
        putStrLn ""
        divisorias
        
        let danoArmadura = (danoHeroi - (div (danoHeroi * (inimigoDefesa ini)) 100 ))
        fazNada danoArmadura
        let iniRetorno = Inimigo (inimigoNome ini) (inimigoDescricao ini) (max ((inimigoVidaAtual ini) - danoArmadura) 0) (inimigoVidaMax ini) (inimigoDano ini) (inimigoForca ini) (inimigoAgilidade ini) (inimigoDefesa ini)

        

        printInimigoTomaDano ini danoArmadura
        return iniRetorno


verificaMortoP :: Personagem -> Bool
verificaMortoP per = ((personagemVidaAtual per) == 0)

verificaMortoI :: [Inimigo] -> Bool
verificaMortoI [] = True
verificaMortoI (x:xs) | ((inimigoVidaAtual x) == 0) = verificaMortoI xs
              | otherwise = False   

penalidade :: Personagem -> Int -> Personagem
penalidade per pena = Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) (max ((personagemDinheiro per) - pena) 0) (personagemArma per) (personagemArmadura per) (bolsa per)


ganha :: Personagem -> Int -> Personagem
ganha per pena = Personagem (personagemNome per) (personagemVidaAtual per) (personagemVidaMax per) (personagemDano per) (personagemDefesa per) (personagemForca per) (personagemAgilidade per) ((personagemDinheiro per) + pena) (personagemArma per) (personagemArmadura per) (bolsa per)


bonusBatalha :: Int -> (Int, Int)
bonusBatalha opcao = do
    if (opcao == 1) then
        (5, 4)
    else
        (0, 0)

auxReplace :: [Inimigo] -> [Inimigo] -> Inimigo -> Int -> Int -> [Inimigo]
auxReplace [] nova  _ _ _ = nova
auxReplace (x:xs) nova ini atu dese | (atu == dese) = auxReplace xs (nova ++ [ini]) ini (atu + 1) dese
                                  | otherwise = auxReplace xs (nova ++ [x]) ini (atu + 1) dese

replaceIni :: GrupoDeInimigos -> Inimigo -> Int -> GrupoDeInimigos
replaceIni gru ini index = GrupoDeInimigos (grupoQuantidade gru) (grupoLoot gru) (auxReplace (grupoInimigos gru) [] ini 0 index)


ataqueDoGrupo :: [Inimigo] -> Personagem -> Personagem
ataqueDoGrupo [] per = per
ataqueDoGrupo (i:is) per = do
    if ( (inimigoVidaAtual i) > 0 ) then do
        let a = (unsafePerformIO (inimigoAtaca i))
  
        let p = heroiTomaDano per a
        if(a == 1888888) then
            ataqueDoGrupo is (unsafePerformIO p)
        else
            ataqueDoGrupo is (unsafePerformIO p)     
    else
        ataqueDoGrupo is per

verificaBoss :: [Inimigo] -> Personagem -> IO()
verificaBoss (a:as) heroi = do
    if ((inimigoNome a) == "Light Theme IDE") then
        final heroi
    else
        return ()

batalha :: Personagem -> GrupoDeInimigos -> IO Personagem
batalha per gru = do

    if(verificaMortoP per) then do
        lostBattle (div (grupoLoot gru) 10)
        digite
        return (penalidade per (div (grupoLoot gru) 10))
    else if (verificaMortoI (grupoInimigos gru)) then do
        wonBattle per (grupoLoot gru)
        verificaBoss (grupoInimigos gru) per
        digite
        return (ganha per (grupoLoot gru))
    else do
        
        let op = (unsafePerformIO ( escolhaAtaque per (grupoInimigos gru) ) )
        fazNada op
        let tupla = bonusBatalha op  -- tupla (Int, Int) = (BonusDano, BonusEsquiva)
        
        let opInim = unsafePerformIO (escolheInimigo gru)
        
        let ini = inimigoRecebeDano  (snd tupla) (unsafePerformIO (heroiAtaca per (fst tupla))) ((grupoInimigos gru) !! opInim)
        let grupoNovo = replaceIni gru (unsafePerformIO ini) opInim
        
        let atk = ataqueDoGrupo (grupoInimigos grupoNovo) per
        digite
        
        batalha atk grupoNovo