#!/usr/bin/env runhaskell

import Data.List (sort)

allDivisorsOf :: [Integer] -> Integer -> Bool
allDivisorsOf ns n = all ((0 ==) . (n `mod`)) ns

lcd :: [Integer] -> Integer
lcd xs = head fs
	where
		(s:ss) = reverse $ sort xs
		ms = map (* s) [1..]
		fs = filter (allDivisorsOf ss) ms

main :: IO ()
main = putStrLn $ show $ lcd [2..20]