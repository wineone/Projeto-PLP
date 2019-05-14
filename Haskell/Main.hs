import Estruturas
import System.IO.Unsafe
import Print


fases :: Personagem -> IO Personagem
fases per = do
            -- printaFases per
            -- a <- readLn:: IO Int
            -- if(a == 1) then
            --     lobby per
            -- else
            --     fases per
            -- print per
            return per

lobby :: Personagem -> IO Personagem
lobby per = do
            let o = unsafePerformIO (printLobby per)
            if(o == 1) then
                fases per
                -- print per
            else if (o == 2) then
                putStrLn "Loja"
            else if (o == 3) then
                putStrLn "Bolsa"
            else if (o ==  4) then
                putStrLn "bolsa completa"
            else if (o == 5) then
                putStrLn "Creditos"
            else if (o == 6) then
                putStrLn "sair"
            else
                putStrLn "opcaoInvalida"
            lobby per


main :: IO ()
main =  do
        boasVindas 
        a <- getLine
        let per = Personagem a 70 100 5 5 5 5 10000
        lobby per
        return ()