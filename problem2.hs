#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem2.hs -package MemoTrie
--
-- Run
--
-- ./problem2

import Data.MemoTrie (memo)

fib :: Integer -> Integer
fib = memo fib'
  where
    fib' 0 = 0
    fib' 1 = 1
    fib' n = fib' (n - 2) + fib' (n - 1)

fibSeq :: [Integer]
fibSeq = map fib [0..]

evenFibs :: [Integer]
evenFibs = filter even fibSeq

ns :: [Integer]
ns = takeWhile (< 4000000) evenFibs

main :: IO ()
main = (print . sum) ns
