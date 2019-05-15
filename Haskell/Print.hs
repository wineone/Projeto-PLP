module Print where
import Estruturas

printaVida :: Personagem -> IO()
printaVida p =  do
                putStrLn ((personagemNome p ) ++ "               " ++ (show (personagemVidaAtual p)) ++ "/" ++ (show (personagemVidaMax p)))
                putStrLn ""
                return ()

printaFases :: Personagem -> IO Int
printaFases per =   do
                    putStrLn "Com grandes escolhas vem grande responsabilidades.\nEscolha sabiamente.\n"
                    putStrLn "[1] -> Manguezal"
                    putStrLn "[2] -> Casa"
                    putStrLn "[3] -> Jogoses Voraz"
                    putStrLn "[4] -> Piloto"
                    putStrLn "[5] -> Área 51"
                    putStrLn "[6] -> BOSS"
                    putStrLn "[7] -> sair"
                    putStrLn "\nEscolha sabiamente a fase desejada... "
                    a <- readLn :: IO Int
                    return a


printLobby :: Personagem -> IO Int
printLobby p =  do
                putStrLn "\n\n"
                printaVida p
                putStrLn ""
                putStrLn "[1] -> Fases"
                putStrLn "[2] -> Loja"
                putStrLn "[3] -> Bolsa"
                putStrLn "[4] -> Baú"
                putStrLn "[5] -> Créditos"
                putStrLn "[6] -> Sair"
                putStr "\n\nDigite sua opção: "
                a <- readLn :: IO Int
                return a
                


boasVindas :: IO()
boasVindas =    do
                putStrLn "Você acorda em um local que você nunca viu antes,"
                putStrLn "somente com as roupas do seu corpo."
                putStrLn "Você não sabe onde está..."
                putStrLn "Tudo o que você sabe é o que você leu no bilhete que estava na sua mão quando acordou..."
                putStrLn "Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE."
                putStr "Você lembra do seu nome?... "

                
printMapa :: IO Int
printMapa = do
    putStrLn "[1] -> Entrar em uma batalha"
    putStrLn "[2] -> Vasculhar sua bolsa"
    putStrLn "[3] -> Pausa para o café"
    putStr "\nQual a sua escolha? "

    a <- readLn :: IO Int
    return a

descrMapa :: Fase -> IO()
descrMapa mapa = do
    putStrLn "Você está no mapa:\n"
    putStrLn $ (faseNome mapa) ++ "\n"
    putStrLn $ "    +-> " ++ (faseDescricao mapa)
    putStr "\n\n\n\n"

estrelinhas :: IO()
estrelinhas = do
    putStr "****************************************"