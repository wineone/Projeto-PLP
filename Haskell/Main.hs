import Estruturas
import System.IO.Unsafe
import Print

fases :: IO Personagem ->  IO Personagem
fases per =   do
              let p = unsafePerformIO per
              return p            

menu :: IO Personagem -> IO Personagem
menu p =  do
        printa
        op <- readLn::IO Int
        if(op == 1) then
            menu (fases p)
        else 
            menu p


main :: IO ()
main =  do
        nome <- getLine
        let p = Personagem nome 21
        menu (p :: IO Personagem)
        return ()




















-- escolheDes :: Personagem -> Int -> Personagem
-- escolheDes (Personagem {nome = a, idade = b}) c | (c == 1) = (Personagem a (b+10)) -- funções do jogo aqui
--                                                 | (c == 2) = (Personagem a (b + 25)) -- funções do jogo aqui
--                                                 | otherwise = (Personagem a b) -- funções do jogo aqui

-- loop :: Personagem -> (IO ()) -> IO ()
-- loop p  func =  do
--                 func
--                 print p
--                 a <- readLn::IO Int
--                 loop (escolheDes p a) func
--                 return ()

-- a ::  IO ()
-- a = do
--     putStrLn "primeira função de testes"
--     return ()

-- b ::  IO ()
-- b = do
--     putStrLn "segunda função de testes"
--     return ()


-- main:: IO ()
-- main =  do
--         let p = Personagem "matheus" 0
--         loop p b
--         return ()