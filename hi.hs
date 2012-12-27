import System.IO
main = do putStrLn "Please Type a number"
          x <- readLn
          if calculateNumber x
              then putStrLn "Correct"
              else putStrLn "Wrong"
calculateNumber 4 = True
calculateNumber n = False


readInputFile = do fromHandle <- getAndOpenFile "Copy from: " ReadMode
                   toHandle   <- getAndOpenFile "Copy to: " WriteMode 
                   contents   <- hGetContents fromHandle
                   hPutStr toHandle contents
                   hClose toHandle
                   putStr "Done."
getAndOpenFile :: String -> IOMode -> IO Handle

getAndOpenFile prompt mode =
    do putStr prompt
       name <- getLine
       catch (openFile name mode)
             (\_ -> do putStrLn ("Cannot open "++ name ++ "\n")
                       getAndOpenFile prompt mode)
