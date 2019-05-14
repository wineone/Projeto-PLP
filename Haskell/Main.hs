import Estruturas
import System.IO.Unsafe
import Print



lobby :: Personagem -> IO Personagem
lobby per = do
            let o = unsafePerformIO (printLobby per)
            if(o == 1) then
                putStrLn "fases"
            else if (o == 2) then
                putStrLn "Loja"
            else if (o == 3) then
                putStrLn "Bolsa"
            else if (o ==  4) then
                putStrLn "Bau"
            else if (o == 5) then
                putStrLn "Creditos"
            else if (o == 6) then
                putStrLn "Sair"
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