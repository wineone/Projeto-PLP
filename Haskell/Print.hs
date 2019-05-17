module Print where
import Estruturas
import System.IO.Unsafe
import System.Process
import System.IO

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
                    putStr   "\nEscolha sabiamente a fase desejada... "
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
                
printLoja :: Personagem -> IO Int
printLoja p =  do
                    putStrLn "#       LOJA      #\n\n"
                    putStrLn "[1] -> Comprar uma arma\n"
                    putStrLn "[2] -> Comprar uma armadura\n"
                    putStrLn "[3] -> Comprar uma poção\n"
                    putStrLn "[4] -> sair\n\n"
                    putStrLn "Digite sua opção: "
                    a <- readLn :: IO Int
                    return a







boasVindas :: IO()
boasVindas =    do
                system "clear"
                putStrLn "Tecle enter para prosseguir."
                -- enter
    
                putStr "Você acorda em um local que você nunca viu antes,"
                -- enter
                putStr "somente com as roupas do seu corpo."
                -- enter
                putStr "Você não sabe onde está..."
                -- enter
                putStr "Tudo o que você sabe é o que você leu no bilhete que estava na sua mão quando acordou..."
                -- enter
                putStr "Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE."
                -- enter
                putStr "\nVocê lembra do seu nome?... "

                
printMapa :: IO Int
printMapa = do
    putStr "\n"
    putStrLn "[1] -> Entrar em uma batalha"
    putStrLn "[2] -> Vasculhar sua bolsa"
    putStrLn "[3] -> Pausa para o café"
    putStr "\nQual a sua escolha? "

    a <- readLn :: IO Int
    return a

descrMapa :: Fase -> IO()
descrMapa mapa = do
    putStrLn "\n\nVocê está no mapa:\n"
    putStrLn $ (faseNome mapa) ++ "\n"
    putStrLn $ "    +-> " ++ (faseDescricao mapa)
    putStr "\n\n\n\n"

estrelinhas :: IO()
estrelinhas = do
    putStr "****************************************\n"

divisorias :: IO()
divisorias = do
    putStr "////////////////////////////////////////////////////////////////////////////////\n"


atkCritico :: IO()
atkCritico = do
    putStrLn "Ataque Crítico!  "

printHeroiAtaca :: Personagem -> Int -> IO()
printHeroiAtaca p dano = do
    putStrLn $ "\n" ++ (personagemNome p) ++ " deu " ++ (show dano) ++ " de dano."

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
    putStr "\n\n"
    estrelinhas
    putStrLn "Oxe doido tu perdeu feião visse ;(\n"
    putStrLn ("Você perdeu " ++ (show per) ++ " moedas.")
    estrelinhas
    putStrLn "\n"

wonBattle :: Personagem -> Int -> IO ()
wonBattle per num = do
    putStr "\n\n"
    estrelinhas
    putStrLn ("Parabéns " ++ (personagemNome per) ++ ".\n")
    putStrLn ("Você ganhou " ++ (show num) ++ " moedas.")
    estrelinhas
    putStrLn "\n"

escolhaAtaque :: IO Int
escolhaAtaque = do
    putStrLn "\nComo você quer atacar?\n"
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
printAtkInimigo (gp:gpt) i = ("Atacar: [" ++ (show i) ++ "] "
                             ++ (inimigoNome gp) ++ " " ++
                            (show (inimigoVidaAtual gp)) ++ "/" ++ 
                            (show (inimigoVidaMax gp)) ++ "\n" ++ 
                            (printAtkInimigo gpt (i+1)) )

escolheInimigo :: GrupoDeInimigos -> IO Int
escolheInimigo gp = do
    putStrLn (printAtkInimigo (grupoInimigos gp) 1)
    putStr "\nDigite quem você quer atacar: "
    a <- readLn :: IO Int
    
    if ( (a <= (grupoQuantidade gp)) && (a > 0) ) then
        return (a - 1)
    else
        escolheInimigo gp

entraBatalha :: [Inimigo] -> IO()
entraBatalha grupo = do
    putStrLn "\nVocê acaba de entrar em uma batalha!!\n"
    --digite()
    putStrLn "Conheça seus inimigos:\n"
    putStrLn $ (meetYourEnemies grupo) ++ "\n"

meetYourEnemies :: [Inimigo] -> String
meetYourEnemies [] = ""
meetYourEnemies (i:is) = (inimigoNome i) ++ " " ++ 
                         (show (inimigoVidaAtual i) ) ++ "/" ++ 
                         (show (inimigoVidaMax i) ) ++ "\n" ++
                         "    +-> " ++ (inimigoDescricao i) ++ "\n\n" ++
                         (meetYourEnemies is)

-- enter :: IO()
-- enter = do
--     hSetBuffering stdin NoBuffering
--     c <- getChar
--     return c