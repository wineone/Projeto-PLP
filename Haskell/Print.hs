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
    
teste :: IO String
teste = do
        a <- getLine
        return a

-- entradaOpcoes :: Personagem -> (Personagem, String)
-- entradaOpcoes heroi = do
--     opcoesLobby heroi

--     putStr "\nDigite sua opção: "

--     entry <- readLn :: IO Int
--     putStrLn ""

    

--     return (heroi, "ola")