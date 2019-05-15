module Bau where

import Estruturas
import System.IO.Unsafe
import Print

addArmadura :: Armadura -> Bolsa -> Bolsa
addArmadura armadura bol = Bolsa (bolsaPocao (bol)) (armadura : bolsaArmadura (bol)) (bolsaArma(bol))

addArma :: Arma -> Bolsa -> Bolsa
addArma arma bol = Bolsa (bolsaPocao (bol)) (bolsaArmadura (bol)) (arma : bolsaArma(bol))

addPocao :: Pocao -> Bolsa -> Bolsa
addPocao pocao bol = Bolsa (pocao : bolsaPocao (bol)) (bolsaArmadura (bol)) (bolsaArma(bol))


--removeArmadura :: Armadura -> Bolsa -> Bolsa
--removeArmadura armadura bol = Bolsa (bolsaPocao (bol)) (percorre armadura (bolsaArmadura (bol))) --(bolsaArma(bol))

--percorre :: Armadura -> [Armadura] -> [Armadura]
--percorre armadura (x:xs)
--            | (eIgual xs []) = xs
--            | (armadura == x) = xs
--            | otherwise = percorre armadura (xs)


removeArma :: Arma -> Bolsa -> Bolsa
removeArma arma bol = Bolsa (bolsaPocao (bol)) (bolsaArmadura (bol)) (arma : bolsaArma(bol))

removePocao :: Pocao -> Bolsa -> Bolsa
removePocao pocao bol = Bolsa (pocao : bolsaPocao (bol)) (bolsaArmadura (bol)) (bolsaArma(bol))
