#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem5.hs -threaded -rtsopts
--
-- Run
--
-- ./problem5.hs +RTS -N

import Control.Parallel.Strategies
import Control.Parallel

import Data.List (sort)

allDivisorsOf :: [Integer] -> Integer -> Bool
allDivisorsOf ns n = all ((0 ==) . (n `mod`)) ns

lcd :: [Integer] -> Integer
lcd xs = head fs
  where
    (s:ss) = (reverse . sort) xs
    ms = parMap rseq (* s) [1..]
    fs = filter (allDivisorsOf ss) ms

main :: IO ()
main = (print . lcd) [2..20]
