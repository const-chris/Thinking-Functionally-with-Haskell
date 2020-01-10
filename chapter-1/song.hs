import Data.Char
import Data.List

numbers =
  ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

song :: Int -> String
song n =
  if n == 0
    then ""
    else song (n - 1) ++ "\n" ++ verse n ++ "\n"

verse :: Int -> String
verse n = intercalate "\n" $ map capitalize [line1 n, line2, line3 n, line4]

line1 :: Int -> String
line1 n = numbers !! n ++ man_men n ++ " went to mow"

line2 :: String
line2 = "Went to mow a meadow"

line3 :: Int -> String
line3 n = countdown n ++ "and his dog"
  where
    countdown n =
      numbers !! n ++
      man_men n ++
      if n == 1
        then " "
        else ", " ++ countdown (n - 1)

line4 :: String
line4 = line2

man_men :: Int -> String
man_men n =
  if n == 1
    then " man"
    else " men"

capitalize :: String -> String
capitalize (x:xs) = toUpper x : xs
