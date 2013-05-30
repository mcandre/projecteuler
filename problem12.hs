#!/usr/bin/env runhaskell

import Control.Parallel.Strategies
import Control.Parallel

triangle :: Integer -> Integer
triangle 1 = 1
triangle n = n + triangle (n - 1)

-- From Fritz Ruehr
-- http://www.willamette.edu/~fruehr/LLC/lab1.html
isqrt :: (Integral a) => a -> a
isqrt = floor . sqrt . fromIntegral

divisors :: Integer -> [Integer]
divisors 1 = [1]
divisors n = ks ++ parMap rseq (n `div`) ks
  where
    ks = [ k | k <- [1 .. (isqrt n)], n `mod` k == 0 ]

triangleWithDivisors :: Integer -> Integer
triangleWithDivisors n = head $ filter ((>= n) . fromIntegral . length . divisors) $ parMap rseq triangle [1 ..]

main :: IO ()
main = (print . triangleWithDivisors) 500
