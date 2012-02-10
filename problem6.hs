#!/usr/bin/env runhaskell

import Control.Parallel.Strategies
import Control.Parallel

squareSums :: Integer -> Integer
squareSums n = sum [1..n] ^ 2

sumSquares :: Integer -> Integer
sumSquares n = sum $ (parMap rseq) (^2) [1..n]

differenceSqSumSq :: Integer -> Integer
differenceSqSumSq n = abs $ squareSums n - sumSquares n

main :: IO ()
main = putStrLn $ show $ differenceSqSumSq 100