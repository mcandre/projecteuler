#!/usr/bin/env runhaskell

-- Compile
--
-- ghc -O2 --make problem10.hs
--
-- Run
--
-- ./problem10

sieve :: (Integral a) => [a] -> [a]
sieve ns = n : sieve ns'
  where
    n = head ns
    ns' = filter ((/= 0) . flip rem n) ns

primes :: (Integral a) => [a]
primes = sieve [2..]

sumPrimesBelow :: Integer -> Integer
sumPrimesBelow n = (sum . fst . break (>= n)) primes

main :: IO ()
main = (print . sumPrimesBelow) 2000000
