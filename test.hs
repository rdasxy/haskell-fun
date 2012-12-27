import System.IO

main = do putStr "Please enter source file name: "
          fileName <- getLine
          fileHandle <- openFile fileName ReadMode
          fileContents <- hGetContents fileHandle
          return fileContents
