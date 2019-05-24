module Print where
import Estruturas
import Entidades
import System.IO.Unsafe
import System.Process
import System.IO


printaVida :: Personagem -> IO ()
printaVida p =  do
                putStrLn ((personagemNome p ) ++ "                   " ++ (show (personagemVidaAtual p)) ++ "/" ++ (show (personagemVidaMax p)) ++ "\n")

printaFases :: Personagem -> IO Int
printaFases per =   do
                    system "clear"
                    putStrLn "              #   MAPAS   #\n\n"
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

fn :: Personagem -> IO Personagem
fn p = do
    if (personagemNome p == "") then
        return p
    else 
        return p

printLobby :: Personagem -> IO Int
printLobby p =  do
                printaVida p  
                putStrLn "\n              #   LOBBY   #\n\n\n"
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
                    putStrLn "              #       LOJA      #\n\n"
                    putStrLn "[1] -> Comprar uma arma"
                    putStrLn "[2] -> Comprar uma armadura"
                    putStrLn "[3] -> Comprar uma poção"
                    putStrLn "[4] -> sair\n\n"
                    putStr "Digite sua escolha: "
                    a <- readLn :: IO Int
                    return a



boasVindas :: IO()
boasVindas =    do
                system "clear"
                putStrLn "Tecle enter para prosseguir.\n"
                enter

                putStrLn "Você acorda em um local que você nunca viu antes,"
                enter
                putStrLn "somente com as roupas do seu corpo."
                enter
                putStrLn "Você não sabe onde está..."
                enter
                putStrLn "Tudo o que você sabe é o que você \nleu no bilhete que estava na sua mão quando acordou..."
                enter
                putStrLn "Para escapar desse mundo, você deve derrotar a temível LIGHT THEME IDE.\n"
                enter
                hSetEcho stdin True     -- volta a mostrar no terminal o que o user esta escrevendo
                putStr "Você lembra do seu nome?... "


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
    system "clear"
    putStrLn "Você está no mapa:\n"
    putStrLn $ (faseNome mapa) ++ "\n"
    putStrLn $ "    +-> " ++ (faseDescricao mapa)
    putStr "\n\n\n\n"


estrelinhas :: IO()
estrelinhas = do
    putStr "****************************************\n"

divisorias :: IO()
divisorias = do
    putStr "////////////////////////////////////////////////////////////////////////////////\n"

fazNadaPer :: Personagem -> Personagem
fazNadaPer p = p

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
    if ((inimigoVidaAtual i) <= 0) then
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

interfaceAtk :: [Inimigo] -> String
interfaceAtk [] = "\n\n"
interfaceAtk (i:is) = ( (inimigoNome i) ++ "                    " ++              -- 20 espaços
                        (show (inimigoVidaAtual i) ) ++ "/" ++ (show (inimigoVidaMax i) ) ++
                        "\n" ++ (interfaceAtk is) )

escolhaAtaque :: Personagem -> [Inimigo] -> IO Int
escolhaAtaque p list = do
    digite
    system "clear"

    -- CRIA A INTERFACE DA BATALHA
    putStrLn "              #   BATALHA    #\n"

    printaVida p
    putStr (interfaceAtk list)

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
        escolhaAtaque p list

auxAtkInim :: Int -> String
auxAtkInim 1 = "\n"
auxAtkInim i = ""

printAtkInimigo :: [Inimigo] -> Int -> String
printAtkInimigo [] i = ""
printAtkInimigo (gp:gpt) i = (auxAtkInim i) ++ ("Atacar: [" ++ (show i) ++ "] "
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
    system "clear"
    putStrLn "Você acaba de entrar em uma batalha!!\n"

    putStrLn "Conheça seus inimigos:\n"
    putStrLn (meetYourEnemies grupo)

meetYourEnemies :: [Inimigo] -> String
meetYourEnemies [] = ""
meetYourEnemies (i:is) = (inimigoNome i) ++ " " ++
                         (show (inimigoVidaAtual i) ) ++ "/" ++
                         (show (inimigoVidaMax i) ) ++ "\n" ++
                         "    +-> " ++ (inimigoDescricao i) ++ "\n\n" ++
                         (meetYourEnemies is)




percorreArma1 :: Int -> [Arma] -> String
percorreArma1 indArma (x:[]) = "[" ++ (show (indArma + 1)) ++ "]" ++ " - " ++armaNome x ++ "\n    +->" ++ armaDescricao x  ++ "\nPreço: " ++ show ((armaPreco x)) ++"    Dano:" ++ show(armaDano x) ++ "    Força: " ++ show(armaForca x) ++ "    Agilidade: " ++ show(armaAgilidade x) ++"\n\n" ++  (percorreArma1 (indArma + 1) [])
percorreArma1 indArma [] = "\n************************\n\n[0] -> Cancelar compra.\n\n************************\n\n\n"
percorreArma1 indArma (x:xs) =  "[" ++ (show (indArma + 1)) ++ "]" ++ " "++armaNome x ++ "\n    +->" ++ armaDescricao x  ++ "\nPreço: " ++ show ((armaPreco x)) ++"    Dano:" ++ show(armaDano x) ++ "    Força: " ++ show(armaForca x) ++ "    Agilidade: " ++ show(armaAgilidade x) ++"\n\n" ++  (percorreArma1 (indArma + 1) xs)

percorreArmadura1 :: Int -> [Armadura] -> String
percorreArmadura1 indArmadura (x:[]) = "[" ++ show ((indArmadura) + 1) ++ "]" ++" - "++ (armaduraNome x) ++ "\n   +->" ++ (armaduraDescricao x) ++ "\n" ++ "Preço: " ++ show ((armaduraPreco x)) ++ "     Dano: " ++ show((armaduraArmadura x)) ++ "     Força: " ++ show((armaduraForca x)) ++"     Agilidade: " ++show( (armaduraAgilidade x)) ++"     Vida: " ++show( (armaduraVida x)) ++ "\n\n" ++ (percorreArmadura1 (indArmadura+1) []) 
percorreArmadura1 indArmadura [] = "\n************************\n\n[0] -> Cancelar compra.\n\n************************\n\n\n"
percorreArmadura1 indArmadura (x:xs) = "[" ++ show ((indArmadura) + 1) ++ "]" ++" - "++(armaduraNome x) ++ "\n    +->" ++ (armaduraDescricao x) ++ "\n" ++ "Preço: " ++ show ((armaduraPreco x)) ++"     Dano: " ++ show((armaduraArmadura x)) ++"     Força: " ++ show((armaduraForca x)) ++"     Agilidade: " ++show( (armaduraAgilidade x)) ++"     Vida: " ++show( (armaduraVida x)) ++ "\n\n" ++ (percorreArmadura1 (indArmadura + 1) xs)

percorrePocao1 :: Int -> [Pocao] -> String
percorrePocao1 indPocao (x:[]) = "[" ++ (show (indPocao + 1)) ++ "]" ++" - "++ (pocaoNome x) ++ "\n   +->" ++ (pocaoDescricao x) ++ "\n" ++ "Preço: " ++ show ((pocaoPreco x)) ++ "     Vida: " ++ show((pocaoVida x)) ++ "\n\n"++ (percorrePocao1 (indPocao + 1) [])
percorrePocao1 indPocao [] = "\n************************\n\n[0] -> Cancelar compra.\n\n************************\n\n\n"
percorrePocao1 indPocao (x:xs) = "[" ++ (show (indPocao + 1)) ++ "]" ++" - "++(pocaoNome x) ++ "\n    +->" ++ (pocaoDescricao x) ++ "\n" ++ "Preço: " ++ show ((pocaoPreco x)) ++ "     Vida: " ++ show((pocaoVida x)) ++ "\n\n" ++ (percorrePocao1(indPocao+1) xs)

-- Funções auxiliares para tamanho do array (importadas de Bau)

tamanhouPocao :: [Pocao] -> Int
tamanhouPocao [] = 0
tamanhouPocao (x:[]) = 1
tamanhouPocao (x:xs) = 1 + tamanhouPocao (xs)


tamanhouArmadura :: [Armadura] -> Int
tamanhouArmadura [] = 0
tamanhouArmadura (x:[]) = 1
tamanhouArmadura (x:xs) = 1 + tamanhouArmadura (xs)


tamanhouArma :: [Arma] -> Int
tamanhouArma [] = 0
tamanhouArma (x:[]) = 1
tamanhouArma (x:xs) = 1 + tamanhouArma (xs)

-- fim 

listaArma :: [Arma] -> Personagem -> IO Int
listaArma ar per = do
    system "clear"
    putStr "Seu money -> "
    print (personagemDinheiro per)
    putStrLn ""
    putStr (percorreArma1 0 ar)
    putStr "Digite sua escolha: "
    
    escolhaopcao <- readLn :: IO Int
    let esc = escolhaopcao - 1

    let poiva = armaPreco ( ar !! (esc) )
    let tam = tamanhouArma ar

    if (escolhaopcao > 0 && escolhaopcao <= tam) then do
         if personagemDinheiro per >= poiva then do
            let nome = armaNome ( ar !! (esc) )
            
            putStr "\n"
            estrelinhas
            putStr "\n Você comprou, "
            putStr nome 
            putStrLn " vá até o seu baú \n"
            estrelinhas
            putStr "\n"
            
            digite
            return esc
         else do
            let escolhaopcao = -1
            putStrLn "\n\nVc tá Liso $$$"
            return esc
    else if (escolhaopcao == 0) then
        return (-1)
    else do
        putStrLn "\nDigite uma opção válida."
        listaArma ar per

listaArmadura :: [Armadura] -> Personagem -> IO Int
listaArmadura armadur per = do
    system "clear"
    putStr "Seu money -> "
    print (personagemDinheiro per)
    putStrLn ""
    putStr (percorreArmadura1 0 armadur)
    putStr "Digite sua escolha: "
    
    escolhaopcao <- readLn :: IO Int
    let esc = escolhaopcao - 1

    let poiva = armaduraPreco (armadur !! esc )
    let tam = tamanhouArmadura (armadur)

    if (escolhaopcao > 0 && escolhaopcao <= tam) then do
         if personagemDinheiro per >= poiva then do
            let nome = armaduraNome ( armadur !! esc )
            
            putStr "\n"
            estrelinhas
            putStr "\n Você comprou, "
            putStr nome 
            putStrLn " vá até o seu baú \n"
            estrelinhas
            putStr "\n"
            
            digite
            return esc
         else do
            let escolhaopcao = -1
            putStrLn "\n\nVc tá Liso $$$"
            return esc
    else if (escolhaopcao == 0) then
        return (-1)
    else do
        putStrLn "\nDigite uma opção válida"
        listaArmadura armadur per

listaPocao :: [Pocao] -> Personagem -> IO Int
listaPocao po per = do
    system "clear"
    putStr "Seu money -> "
    print (personagemDinheiro per)
    putStrLn ""
    putStr (percorrePocao1 0 po)
    putStr "Digite sua escolha: "
    
    escolhaopcao <- readLn :: IO Int
    let esc = escolhaopcao - 1

    let poiva = pocaoPreco (po !! esc )
    let tam = tamanhouPocao (po)

    if (escolhaopcao > 0 && escolhaopcao <= tam) then do
        if personagemDinheiro per >= poiva then do
            let nome = pocaoNome ( po !! esc )
            
            putStr "\n"
            estrelinhas
            putStr "\n Você comprou, "
            putStr nome 
            putStrLn " vá até o seu baú \n"
            estrelinhas
            putStr "\n"
            
            digite
            return esc
         else do
            let escolhaopcao = -1
            putStrLn "\n\nVc tá Liso $$$"
            return esc
    else if (escolhaopcao == 0) then
        return (-1)
    else do
        putStrLn "\nDigite uma opção válida."
        listaPocao po per


opcoesBau :: IO Int
opcoesBau = do
    system "clear"
    putStrLn "              #   BAU    #\n"
    putStrLn "[1] -> Troque seu equipamento"
    putStrLn "[2] -> Excluir item da Bau"
    putStrLn "[3] -> Visualizar Equipamento"
    putStrLn "[4] -> Vasculhar sua Bolsa"
    putStrLn "[5] -> Voltar ao menu inicial"
    putStr "\nO que voce quer fazer?... "
    escolha <- readLn :: IO Int

    return escolha

opcoesTroca :: IO Int
opcoesTroca = do
    system "clear"
    putStrLn "              #   TROQUE SEU EQUIPAMENTO    #\n"
    putStrLn "[1] -> Troque sua armadura"
    putStrLn "[2] -> Troque sua arma"
    putStrLn "[3] -> voltar"
    putStr "\nO que voce quer fazer?... "
    escolha <- readLn :: IO Int
    return escolha

opcoesRemove :: IO Int
opcoesRemove = do
    system "clear"
    putStrLn "              #   REMOVA SEU EQUIPAMENTO    #\n"
    putStrLn "[1] -> remova sua armadura"
    putStrLn "[2] -> remova sua arma"
    putStrLn "[3] -> voltar"
    putStr "\nO que voce quer fazer?... "
    escolha <- readLn :: IO Int
    return escolha

opcoesRemoveBolsa :: IO Int
opcoesRemoveBolsa = do
    system "clear"
    putStrLn "              #   BOLSA    #\n\n"
    putStrLn "[1] -> Visualizar poções"
    putStrLn "[2] -> Usar uma poção"
    putStrLn "[3] -> Jogar uma poção fora"
    putStrLn "[4] -> Voltar a batalhar"
    putStr "\n O que voce quer fazer?..."
    escolha <- readLn :: IO Int
    return escolha

opcoesTrocaItens :: IO Int
opcoesTrocaItens = do
  system "clear"
  putStrLn "              #   TROQUE SEU EQUIPAMENTO    #\n"
  putStrLn "[1] -> troque sua armadura"
  putStrLn "[2] -> troque sua arma"
  putStrLn "[3] -> voltar"
  putStrLn "O que voce quer fazer?... "
  escolha <- readLn :: IO Int
  return escolha

vizualizarEquipamento :: Personagem -> IO()
vizualizarEquipamento per = do
    system "clear"
    putStrLn "++++++++++++++++++++++++++++++++++++++++\n"
    putStrLn "          #CONHEÇA O HEROI#              \n"
    putStrLn $ "Nome do Herói: " ++ (personagemNome per) ++ "     HP: " ++ show (personagemVidaAtual per) ++ "/"++ show(personagemVidaMax per)
    putStrLn $ "\n       Dinheiro: " ++ (show (personagemDinheiro per)) ++ "\n"

    putStrLn "Atributos do jogador: "
    putStrLn $ "    Defesa: " ++ show(personagemDefesa per)
    putStrLn $ "    Dano: " ++ show (personagemDano per)
    putStrLn $ "    Força: " ++ show (personagemForca per)
    putStrLn $ "    Agilidade: " ++ show (personagemAgilidade per)

    let arma = personagemArma per
    let armadura = personagemArmadura per

    putStrLn $ "\nSua Arma: " ++ (armaNome arma)
    putStrLn $ "        +> " ++ (armaDescricao arma)
    putStrLn $ "    dano: " ++ show(armaDano arma)
    putStrLn $ "    força: " ++ show(armaForca arma)
    putStrLn $ "    agilidade: " ++ show(armaAgilidade arma)

    putStrLn $ "\nSua Armadura " ++ (armaduraNome armadura)
    putStrLn $ "        +> " ++ (armaduraDescricao armadura)
    putStrLn $ "    armadura: " ++  show (armaduraArmadura armadura)
    putStrLn $ "    força: " ++     show (armaduraForca armadura)
    putStrLn $ "    agilidade: " ++ show (armaduraAgilidade armadura)
    putStrLn $ "    vida: " ++      show (armaduraVida armadura)
    putStrLn "\n\n++++++++++++++++++++++++++++++++++++++++"
    digite



digite :: IO()
digite = do
    putStr "\nDigite enter para continuar..."
    enter
    hSetEcho stdin True
    putStr "\n"

enter :: IO Char
enter = do
    hSetEcho stdin False
    hSetBuffering stdin NoBuffering
    c <- getChar
    return c

enterAux :: IO()
enterAux = do
    enter
    hSetEcho stdin True
    return ()

final :: Personagem -> IO()
final p = do
    system "clear"
    putStrLn "Tecle enter para prosseguir."
    
    enterAux
    putStr "\n\n"
    putStr "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    putStr "\n"
    
    putStrLn "..."
    enterAux
    putStrLn ("Parabéns " ++ personagemNome p ++ " você derrotou a terrível LIGHT THEME IDE")
    enterAux
    putStrLn "..."
    enterAux
    putStrLn "Mas infelizmente nada acontece."
    enterAux
    putStrLn "..."
    enterAux
    putStrLn "Você ainda pode jogar mais se quiser..."
    enterAux
    putStrLn "\nOu não, sei lá"
    enterAux
    putStrLn "..."
    enterAux
    putStrLn "eh isso\n"
    putStr "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    putStr "\n\n"

