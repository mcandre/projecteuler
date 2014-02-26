#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem6.hs -threaded -rtsopts
--
-- Run
--
-- ./problem6.hs +RTS -N

import Control.Parallel.Strategies (parMap, rseq)

squareSums :: Integer -> Integer
squareSums n = sum [1..n] ^ 2

sumSquares :: Integer -> Integer
sumSquares n = (sum . parMap rseq (^2)) [1..n]

differenceSqSumSq :: Integer -> Integer
differenceSqSumSq n = abs $ squareSums n - sumSquares n

main :: IO ()

main = (print . differenceSqSumSq) 100
