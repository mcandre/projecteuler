#!/usr/bin/env runhaskell

sieve :: (Integral a) => [a] -> [a]
sieve ns = n : sieve ns'
	where
		n = head ns
		ns' = filter ((/= 0) . flip rem n) ns

primes :: (Integral a) => [a]
primes = sieve [2..]

sumPrimesBelow :: Integer -> Integer
sumPrimesBelow n = sum $ fst $ break (>= n) primes

main :: IO ()
main = putStrLn $ show $ sumPrimesBelow 2000000