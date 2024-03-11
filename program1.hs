module Main where

main :: IO ()
main = do
  putStr "Enter an int: "
  input <- getLine
  let num = read input :: Int

  -- signum (sign of int [positive/negative])
  putStrLn $
    show num ++ " is " ++ case signum num of
      1 -> "Positive"
      (-1) -> "Negative"
      0 -> "Zero"
  -- abs (absolute value of int)
  putStrLn $ "Absolute vale of " ++ show num ++ ": " ++ show (abs num)

  putStr "Enter a float: "
  input <- getLine
  let num = read input :: Float

  -- sqrt (square root of float)
  putStrLn $ "Square root of " ++ show num ++ " is " ++ show (sqrt num)
  -- log (natural log of float)
  putStrLn $ "Natural log of " ++ show num ++ " is " ++ show (log num)

  putStr "Enter your name: "
  name <- getLine

  -- length (of string)
  putStrLn $ "Your name is " ++ show (length name) ++ " characters long"
  -- reverse (string)
  putStrLn $ "Your name backwards is " ++ reverse name

  putStr "Was this fun? [y/n]: "
  input <- getLine
  -- head (first char of string)
  let fun = case head input of
        'y' -> True
        _ -> False

  -- not (invert boolean)
  if not fun
    then
      putStrLn "cries :("
    else
      putStrLn "Ayy lets go"
