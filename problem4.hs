#!/usr/bin/env runhaskell

palindrome :: Int -> Bool
palindrome n = s == reverse s
	where
		s = show n

products :: Int -> [Int]
products n = map (uncurry (*)) [ (x,y) | x <- [1..n], y <- [1..n] ]

palindromeProducts :: Int -> [Int]
palindromeProducts n = filter palindrome $ products n

largestPalindromeProduct :: Int -> Int
largestPalindromeProduct n = foldl max 1 $ palindromeProducts n

main :: IO ()
main = putStrLn $ show $ largestPalindromeProduct 999