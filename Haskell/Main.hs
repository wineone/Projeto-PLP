import Estruturas
import Print

main :: IO()
main = do
    let pers = Personagem "Rafa" 100 100
    entradaOpcoes pers
    return ()