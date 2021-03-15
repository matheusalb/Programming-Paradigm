shorten :: String -> String
shorten (h:t)
    | h == '='  = "http://youtu.be/" ++ getElems t
    | otherwise = shorten t
        where
            getElems "" = ""
            getElems (hh:tt)
                | hh /= '&' = hh : getElems tt
                | otherwise = ""
                

splitBy :: String -> String -> [String]
splitBy "" aux         = []
splitBy (h:t) aux
    | h == '\n'     = aux : splitBy t ""
    | otherwise     = splitBy t (aux ++ [h])

joinShorten :: String -> String -> String
joinShorten "" s    = shorten s ++ "\n"
joinShorten aux ""  = aux ++ "\n"
joinShorten aux s   = aux ++ shorten s ++ "\n"

main :: IO ()
main = putStr "Reading urls from url.in\n" >>
       readFile "url.in" >>=
       \st ->
            putStr $ foldl joinShorten "" (splitBy st "") 
             