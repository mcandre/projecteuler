#!/usr/bin/env runhaskell

multiple :: Int -> Int -> Bool
multiple m n = n `mod` m == 0

multipleThree :: Int -> Bool
multipleThree = multiple 3

multipleFive :: Int -> Bool
multipleFive = multiple 5

multipleThreeOrFive :: Int -> Bool
multipleThreeOrFive n = multipleThree n || multipleFive n

ns :: [Int]
ns = filter multipleThreeOrFive [1..999]

main :: IO ()
main = (print . sum) ns
