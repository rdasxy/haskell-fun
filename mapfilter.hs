recmap f [] = []
recmap f (x : xs) = f x : map f xs

compmap f xs = [f x | x <- xs]

compfilter p xs = [x | x <- xs, p x]

recfilter p [] = []
recfilter p (x : xs) | p x = x : recfilter p xs
                     | otherwise = recfilter p xs
