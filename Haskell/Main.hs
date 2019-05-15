import Estruturas
import System.IO.Unsafe
import Print
import Fases

lobby :: Personagem -> IO Personagem
lobby per = do
            let o = unsafePerformIO (printLobby per)
            if(o == 1) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a fase
            else if (o == 2) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a loja
            else if (o == 3) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a bolsa
            else if (o ==  4) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a bolsa completa
            else if (o == 5) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a creditos
            else if (o == 6) then do
                putStrLn "quereu sair"
                return per -- função que chama a saida
            else
                lobby per


main :: IO ()
main =  do
        boasVindas 
        a <- getLine
        let per = Personagem a 70 100 5 5 5 5 10000
        lobby per
        return ()