import Control.Parallel
import Data.Maybe
import Data.String
import System.IO
import Text.Printf
import Text.Read

getMaximumSummand :: IO Int
getMaximumSummand = do
    nString <- prompt "Enter an integer n: "
    maybe getMaximumSummand return (readMaybe nString :: Maybe Int)

prompt :: String -> IO String
prompt message = do
    putStr message
    hFlush stdout
    getLine

triangularNumber :: Int -> Int
triangularNumber = triangularNumberFrom 1

triangularNumberFrom :: Int -> Int -> Int
triangularNumberFrom i j
    | i > j = 0
    | i == j = i
    | otherwise =
        triangularNumberFrom i midpoint `par`
        triangularNumberFrom (midpoint + 1) j `pseq`
        triangularNumberFrom i midpoint + triangularNumberFrom (midpoint + 1) j
        where midpoint = i + (j - i) `div` 2

main :: IO ()
main = do
    n <- getMaximumSummand
    printf "Computing 1 + ... + %d in parallel...\n" n
    print (triangularNumber n)
