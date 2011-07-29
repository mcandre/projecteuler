#!/usr/bin/env runhaskell

squareSums :: Integer -> Integer
squareSums n = sum [1..n] ^ 2

sumSquares :: Integer -> Integer
sumSquares n = sum $ map (^2) [1..n]

differenceSqSumSq :: Integer -> Integer
differenceSqSumSq n = abs $ squareSums n - sumSquares n

main :: IO ()
main = putStrLn $ show $ differenceSqSumSq 100