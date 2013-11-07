#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem5.hs
--
-- Run
--
-- ./problem5 +RTS -N

import Data.List (sortBy)

allDivisorsOf :: [Integer] -> Integer -> Bool
allDivisorsOf ns n = all ((0 ==) . (n `mod`)) ns

lcd :: [Integer] -> Integer
lcd xs = head fs
  where
    (s:ss) = (sortBy (flip compare)) xs
    ms = map (* s) [1..]
    fs = filter (allDivisorsOf ss) ms

main :: IO ()
main = (print . lcd) [2..20]
