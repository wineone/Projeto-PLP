import Estruturas
import Print


loja :: Personagem -> Personagem
loja (Personagem { nome = a, vidaAtual = c, vidaMax = b }) = Personagem a (c + 10) b

returnCardList :: Personagem -> IO Personagem

returnCardList acc = do 
    line <- getLine
    if line == "."
    then return acc
      -- ^^^^^^ turn the plain value into an IO computation
    else returnCardList ((convertCard (line !! 0) (line !! 1)):acc)

loop :: IO Personagem -> IO Personagem
loop per =  do
        entry <- readLn::IO Int
        if (entry == 1) then
            return (loop (returnCardList (loja (read per))))
        else do
            return (returnCardList per)

main :: IO()
main =  do
        let per = Personagem "mathesu" 10 1111
        loop (returnCardList per)
        return ()

        -- let per = Personagem "mathesu" 10 1111
        -- let a = if(entry == 1) then
        --     let per = (loja per)
        -- if (entry == 2) then
        --     let a = 2
        -- else if(entry == 3) then 
        --     -- putStrLn "bolsa()"
        --     let b = 10
        -- else if (entry == 4) then 
        --     -- putStrLn "bau()"
        --     let c = 10
        -- else if (entry == 5) then 
        --     -- putStrLn "creditos()"
        --     let q = 10
        -- else if (entry == 6) then
        --     -- putStrLn "sair()"
        --     let e = 23
        -- else do
        --     -- putStrLn "opcao inválida\n\n"
        --     let g = 234
        -- main