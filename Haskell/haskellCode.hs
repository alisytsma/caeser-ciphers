--Haskell
import Data.Char (ord, chr, isUpper, isAlpha, toUpper)

--encrypt function that sends characters to shift
encrypt :: Int -> String -> String
encrypt = (fmap) . shift
 
--shifts each character by the shift amount
shift :: Int -> Char -> Char
shift shiftAmount c
--if a character, shift
  | isAlpha c = chr $ 65 + mod ((ord c - 65) + shiftAmount) 26
--Otherwise, don't
  | otherwise = c
  
--decrypt function which is just the negated encrypt function
decrypt = encrypt . negate

--solve function which returns maxShiftAmount of solved inputs
-- if maxShiftAmount is 0, return nothing
solve 0 input = return ()
solve maxShiftAmount input =
 do
 --print caesar shift amount and the shifted string
  putStrLn ("Caesar " ++ show maxShiftAmount ++ ": " ++ encSolve)
  --recursively call solve to loop maxShiftAmount of times
  solve (maxShiftAmount-1) input
 where
   encSolve = encrypt maxShiftAmount input

--main body
main = do 
   mapM_ putStrLn ["Original String:" ++ show input, "Encrypted String: " ++ show encStr, "Decrypted String: " ++ show decStr, "Solve: "]
   solve 26 input
   where
    input = map toUpper "Everything in moderation. Except for snacks."
    shiftAmount = 10
    encStr = encrypt shiftAmount input
    decStr = decrypt shiftAmount encStr
    
    