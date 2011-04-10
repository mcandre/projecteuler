#!/usr/bin/env runhaskell

pythagoreanTripleWithPerimeter :: Int -> [Int]
pythagoreanTripleWithPerimeter p = [ a * b * c | c <- [1..], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a + b + c == p ]

main :: IO ()
main = putStrLn $ show $ head $ pythagoreanTripleWithPerimeter 1000