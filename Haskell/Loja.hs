module Loja where

import Estruturas
import System.IO.Unsafe
import Print
import System.Random (randomRIO)
import System.IO.Unsafe
import Entidades
import Bau


floja :: Personagem -> IO Personagem
floja per = do
    let a = unsafePerformIO (printLoja per) 
    if(a == 1) then do -- função que chama arma
        let todasArmas = [maos,lancaTris,armaADura,adagasSile,donut,tridente,armaConfete,escudo,metralha]
        listaArma(todasArmas)
        --compraArma(per donut)
        --addArma(maos bols)
        floja per
    else if (a == 2) then do
        let todasArmaduras = [roupas,mofi,barril,couro,tempes,armaDoFim,divina]
        listaArmadura(todasArmaduras)-- função que chama armadura
        floja per
    else if (a == 3) then do
        let todasPocoes = [pocaoRestauraVida,pocaoBebada,pocaoNinja,pocaoAjudaAosDogs,pocaoStronda,pocaoTransformice,pocaoTranquila,pocaoApelona,pocaoCapitao,pocaoRedbull,pocaoRedBullDupla,pocaoCafeComGuarana]
        listaPocao(todasPocoes)-- função que chama pocao
        floja per
    else if (a == 4) then do
        return per -- função que sai
    else do
        putStrLn "Opção invalida"
        floja per
        return per

-- compraArma :: Personagem -> Arma -> IO Personagem
-- compraArma person arminha = do
--         if ((personagemDinheiro person) > (armaPreco arminha)) then do
--             putStrLn "ddd"
--             compraArma person arminha
--             return person arminha
--         else do
--             putStrLn "Liso"
--             compraArma person arminha
--             return person arminha


-- compraArmadura :: Personagem -> IO Personagem
--compraArmadura

-- compraPocao :: Personagem -> IO Personagem
--compraPocao