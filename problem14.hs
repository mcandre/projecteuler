#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem14.hs -threaded -rtsopts
--
-- Run
--
-- ./problem14 +RTS -N

import Control.Parallel.Strategies
import Control.Parallel
import Data.List (maximumBy)

-- From Andrew Pennebaker
-- https://github.com/mcandre/cspace

collatz :: Integer -> Integer
collatz n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

hailstone :: Integer -> [Integer]
hailstone n
  | n <= 1 = [1]
  | otherwise = n:hailstone (collatz n)

maxLength :: [a] -> [a] -> [a]
maxLength xs ys
  | length ys > length xs = ys
  | otherwise = xs

longestChainIn :: [Integer] -> [Integer]
longestChainIn = foldl maxLength [] . parMap rseq hailstone

longestChainUnder :: Integer -> Integer
longestChainUnder n = head $ (evens :: [Integer]) `par` (odds :: [Integer]) `pseq` maxLength evens odds
  where
    evens = longestChainIn [0, 2 .. n]
    odds = longestChainIn [1, 3 .. n]

main :: IO ()
main = (print . longestChainUnder) 1000000
