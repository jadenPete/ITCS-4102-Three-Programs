-- For ITCS-4102 "Three Programs" assignment. This is program number two.
--
-- Written by Neil Svedberg
--
-- 2024-03-14
--
-- Neil Svedberg
-- Jaden Smith
-- Luke Simone
-- Sophia Zhu
-- ... 1 more
--
-- This program takes an image as it's input and computes the edges of the image.

module Main (main) where

import Graphics.Image
import System.Environment

main :: IO ()
main = getArgs >>= parseArgs

-- This function demonstrates two major control structures in Haskell.
--
-- First of all, it uses do-notation, a way of composing sequential monadic
-- operations.
--
-- Secondly, it uses pattern matching. This can be done in many places in
-- Haskell, for example in the `case` statement. Here, we pattern match on the
-- command-line arguments to know when to print a "usage" message.
parseArgs :: [String] -> IO ()
parseArgs [infile, outfile] = do
  -- Here, we read the image as an unboxed vector, a data structure in Haskell
  -- which is optimized for performance.
  img <- readImageY RPU infile

  let -- Our two filters which we will use to generate the edges are stored as
      -- lists, a basic data structure in Haskell. Specifically, these are
      -- two-dimensional nested lists.
      --
      -- Unlike the above vector type, these are stored naively as a
      -- singly-linked list in memory.
      sobelX = fromLists [[-1,  0,  1],
                          [-2,  0,  2],
                          [-1,  0,  1]]
      sobelY = fromLists [[-1, -2, -1],
                          [ 0,  0,  0],
                          [ 1,  2,  1]]

      imgX = convolve Reflect sobelX img
      imgY = convolve Reflect sobelY img

      edges = normalize $ sqrt (imgX^2 + imgY^2)

  writeImage outfile edges

parseArgs _ = putStrLn "Usage: edge-detection-exe INFILE OUTFILE"
