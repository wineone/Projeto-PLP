
import Estruturas
import System.IO.Unsafe
import System.IO
import System.Process
import Print
import Fases
import Bau
import Entidades
import Batalha
import Loja


lobby :: Personagem -> IO Personagem
lobby per = do
            let o = unsafePerformIO (printLobby per)
            if(o == 1) then do
                lobby (unsafePerformIO (fases per)) -- função que chama a fase
            else if (o == 2) then do
                lobby (unsafePerformIO (floja per lojao)) -- função que chama a loja
            else if (o == 3) then do
                lobby (unsafePerformIO (gerenciaBolsa per)) -- função que chama a bolsa
            else if (o ==  4) then do
                lobby (unsafePerformIO (bau per)) -- função que chama a bolsa completa
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
        nome <- getLine

        putStrLn "\n\n"
        
        let bol = Bolsa [pocaoTransformice,pocaoTranquila,pocaoCapitao] [roupas, mofi, barril] [maos, lancaTris, armaADura]
        let per = Personagem nome 100 100 5 5 5 5 100000 maos roupas bol
        lobby per
        return ()
