module Print where

import Estruturas

statusHeroi :: Personagem -> IO()
statusHeroi heroi = do
    putStr (nome heroi)
    putStr "                "
    putStr (show (vidaAtual heroi) ++ "/" ++ show (vidaMax heroi))
    return ()

opcoesLobby :: Personagem -> IO()
opcoesLobby heroi = do
        
    statusHeroi heroi        

    putStr "\n\n"
    putStrLn ("[1] -> Fases")
    putStrLn ("[2] -> Loja")
    putStrLn ("[3] -> Bolsa")
    putStrLn ("[4] -> Baú")
    putStrLn ("[5] -> Créditos")
    putStrLn ("[6] -> Sair")

entradaOpcoes :: Personagem -> (Personagem, String)
entradaOpcoes heroi = do
    opcoesLobby heroi

    putStr "\nDigite sua opção: "

    entry <- readLn :: IO Int
    putStrLn ""

    -- if(entry == 1) then
    --     putStrLn "fases()"
    -- else if (entry == 2) then
    --     putStrLn "loja()"
    -- else if(entry == 3) then 
    --     putStrLn "bolsa()"
    -- else if (entry == 4) then 
    --     putStrLn "bau()"
    -- else if (entry == 5) then 
    --     putStrLn "creditos()"
    -- else if (entry == 6) then
    --     putStrLn "sair()"
    -- else do
    --     putStrLn "opcao inválida\n\n"
    --     entradaOpcoes heroi

    return (heroi, "ola")