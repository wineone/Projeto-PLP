module Print where
import Estruturas



printaVida :: Personagem -> IO()
printaVida p =  do
                putStrLn ((personagemNome p ) ++ "               " ++ (show (personagemVidaAtual p)) ++ "/" ++ (show (personagemVidaMax p)))
                putStrLn ""
                return ()

printaFases :: Personagem -> IO Int
printaFases per =   do
                    putStrLn "aaaaaa"
                    putStrLn "bbbbbbbbbb"
                    a <- readLn :: IO Int
                    return a


printLobby :: Personagem -> IO Int
printLobby p =  do
                printaVida p
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
                putStrLn "Você lembra do seu nome?..."