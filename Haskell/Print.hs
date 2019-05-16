module Print where
import Estruturas
import System.IO.Unsafe

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

divisorias :: IO()
divisorias = do
    putStr "////////////////////////////////////////////////////////////////////////////////"

atkCritico :: IO()
atkCritico = do
    putStrLn "Ataque Crítico!  "

printHeroiAtaca :: Personagem -> Int -> IO()
printHeroiAtaca p dano = do
    putStrLn ((personagemNome p) ++ " deu " ++ (show dano) ++ " de dano.")

fazNada :: Int -> IO ()
fazNada a = do
    if(a == -4675859550) then
        print a
    else
        putStr ""

printInimigoAtaca :: Inimigo -> Int -> IO()
printInimigoAtaca i dano = do
    putStrLn ((inimigoNome i) ++ " deu " ++ (show (inimigoDano i)) ++ " de dano.")

printHeroiTomaDano :: Personagem -> Int -> IO()
printHeroiTomaDano p dano = do
    putStrLn ((personagemNome p) ++ " recebeu " ++ (show dano) ++ " de dano.")

printInimigoTomaDano :: Inimigo -> Int -> IO()
printInimigoTomaDano i dano = do
    if ((inimigoVidaAtual i - dano) <= 0) then
        putStrLn "Você tá chutando cachorro morto..."
    else
        putStrLn ( (inimigoNome i) ++ " recebeu " ++ (show dano) ++ " de dano." )

lostBattle :: Int -> IO ()
lostBattle per = do
    putStrLn "Oxe doido tu perdeu feião visse ;(\n"
    putStrLn ("Você perdeu " ++ (show per) ++ " moedas.\n\n")

wonBattle :: Personagem -> Int -> IO ()
wonBattle per num = do
    putStrLn ("Parebéns " ++ (personagemNome per) ++ ".\n")
    putStrLn ("Você ganhou " ++ (show num) ++ " moedas.\n\n")

escolhaAtaque :: IO Int
escolhaAtaque = do
    putStrLn "Como você quer atacar?\n"
    putStrLn "[1] -> Ataque Forte"
    putStrLn "[2] -> Ataque Fraco"
    putStr "\nDigite sua opção: "
    a <- readLn :: IO Int

    if (a == 1) then do
        putStrLn "Você selecionou ataque FORTE.\n"
        return a
    else if (a == 2) then do
        putStrLn "Você selecionou ataque FRACO.\n"
        return a
    else do
        escolhaAtaque

printAtkInimigo :: [Inimigo] -> Int -> String
printAtkInimigo [] i = ""
printAtkInimigo (gp:gpt) i = ("Atacar: " ++ (inimigoNome gp) ++ 
                            "[" ++ (show i) ++ "]" ++ 
                            (show (inimigoVidaAtual gp)) ++ "/" ++ 
                            (show (inimigoVidaMax gp)) ++ "\n" ++ 
                            (printAtkInimigo gpt (i+1)) )

escolheInimigo :: GrupoDeInimigos -> IO Int
escolheInimigo gp = do
    putStrLn (printAtkInimigo (grupoInimigos gp) 1)
    putStr "Digite quem você quer atacar: "
    a <- readLn :: IO Int
    
    if ( (a <= (grupoQuantidade gp)) && (a > 0) ) then
        return (a - 1)
    else
        escolheInimigo gp