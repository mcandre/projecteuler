#!/usr/bin/env runhaskell

import Control.Parallel.Strategies
import Control.Parallel

memoizedFib :: Int -> Integer
memoizedFib = ((parMap rseq) fib [0..] !!)
	where
		fib 0 = 0
		fib 1 = 1
		fib n = memoizedFib (n - 2) + memoizedFib (n - 1)

fibSeq :: [Integer]
fibSeq = (parMap rseq) memoizedFib [0..]

evenFibs :: [Integer]
evenFibs = filter even fibSeq

ns :: [Integer]
ns = fst $ break (>= 4000000) evenFibs

main :: IO ()
main = putStrLn $ show $ sum ns