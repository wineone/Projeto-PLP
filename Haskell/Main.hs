import Estruturas
import System.IO.Unsafe
import Print


fases :: Personagem -> IO Personagem
fases per = do
            let a = unsafePerformIO (printaFases per) 
            if(a == 1) then do
                lobby per --função que chama o manguezal
            else if (a == 2) then do
                lobby per -- função que chama a casa
            else if (a == 3) then do
                lobby per -- função que chama o jogoses Voraz
            else if (a == 4) then do
                lobby per -- função que cham o piloto
            else if (a == 5) then do
                lobby per -- função que chama a Area 51
            else if (a == 6) then do 
                lobby per -- função qeu chama o BOSS
            else if (a == 7) then do
                lobby per -- função que sai
            else
                fases per
            

lobby :: Personagem -> IO Personagem
lobby per = do
            let o = unsafePerformIO (printLobby per)
            if(o == 1) then do
                fases per -- função que chama a fase
            else if (o == 2) then do
                fases per -- função que chama a loja
            else if (o == 3) then do
                fases per -- função que chama a bolsa
            else if (o ==  4) then do
                fases per -- função que chama a bolsa completa
            else if (o == 5) then do
                fases per -- função que chama a creditos
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