#!/usr/bin/env runhaskell

sieve :: (Integral a) => [a] -> [a]
sieve ns = n : sieve ns'
	where
		n = head ns
		ns' = filter ((/= 0) . flip rem n) ns

primes :: (Integral a) => [a]
primes = sieve [2..]

prime :: (Integral a) => a -> Bool
prime n = elem n $ fst $ break (> n) primes

divisorAndPrime :: Integer -> Integer -> Bool
divisorAndPrime n k = n `mod` k == 0 && prime k

primeFactors :: Integer -> [Integer]
primeFactors n = ns
	where
		factors = filter (divisorAndPrime n) [2..n]
		ns = case factors of
			[] -> []
			firstFactor:_ -> firstFactor : if firstFactor == n then
					[]
				else
					primeFactors (n `div` firstFactor)

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = foldl max 1 $ primeFactors n

main :: IO ()
main = putStrLn $ show $ largestPrimeFactor 600851475143