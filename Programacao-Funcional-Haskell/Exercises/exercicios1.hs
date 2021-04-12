
---Q1---------------------------------------------
addEsp :: String -> Int -> String
addEsp "" n   = ""
addEsp a 0    = a
addEsp a n    = addEsp (a ++ " ") (n - 1) 

addEspOnStr :: String -> Int -> String
addEspOnStr a 0            = a
addEspOnStr "" n           = ""
addEspOnStr (hst:"") n     = [hst]
addEspOnStr (hst:lst) n    = addEsp ([hst]) (n) ++ addEspOnStr (lst) (n)
--------------------------------------------------

--Q2----------------------------------------------
contaNumStr :: String -> Int -> Int
contaNumStr "" n = 0
contaNumStr (hs:ts) n
    | (read [hs] :: Int) == n = 1 + contaNumStr ts n
    | otherwise = 0

quantidade :: Int -> Int -> Int
quantidade n m
    | n < 0 = 0
    | otherwise = contaNumStr (show n) (m) + quantidade (n-1) (m)
-----------------------------------------------------

--Q3------------------------------------------------
tiraUm :: String -> String
tiraUm "" = ""
tiraUm (head:tail)
    | [head] == "1" = tiraUm (tail)
    | otherwise = [head] ++ tiraUm(tail)

limpaUm :: [Int] -> [Int]
limpaUm [] = []
limpaUm (head:tail)
    | tiraUm (show (head)) == "" = [] ++ limpaUm tail
    | otherwise = (read (tiraUm (show (head))) :: Int) : limpaUm tail

----------------------------------------------------

--Q4-----------------------------------------------
myReverse :: String -> String
myReverse [] = []
myReverse (hst:tst) = myReverse tst ++ (hst:[]) 

comparationNonSenseCase :: String -> String -> Bool
comparationNonSenseCase [] []            = True
comparationNonSenseCase [] b             = False
comparationNonSenseCase a []             = False
comparationNonSenseCase (ha:ta) (hb:tb) 
    | ( ((ha >= 'A' && ha <= 'Z') || (ha >='a' && ha <='z')) && ((hb >= 'A' && hb <= 'Z') || (hb >='a' && hb <='z')) && ((ha == hb) || (ha == toEnum (fromEnum hb + 32) || (ha == toEnum (fromEnum hb - 32))))) = comparationNonSenseCase ta tb && True
    | ha == hb  = True
    | otherwise = False

pegaElemento :: String -> Int -> Char
pegaElemento "" n = '\00'
pegaElemento (head:tail) n
    | n == 0       = head
    | otherwise    = pegaElemento (tail) (n-1)

isPalindromo :: String -> Bool
isPalindromo st = comparationNonSenseCase (myReverse (st)) (st)

    -- | tail == "" = True
    -- | head == pegaElemento (tail)(length tail - 1) || pegaElemento (tail) (length tail - 1)== '\00' = True && isPalindromo tail
    -- | otherwise = False
    
    
    -- | tail == "" = True
    -- | head == last tail = True && isPalindromo tail
    -- | otherwise = False

-----------------------------------------------------------

--Q5--------------------------------------------------------

btoi :: String -> Int
btoi "" = 0
btoi (hst:tst) = (read [hst] :: Int)*(2^length tst) + btoi tst 

--Q6----------------------------------------------------------
divide :: [Int] -> Int -> ([Int], [Int])
divide [] n = ([], [])
divide a  0 = ([], a)
divide (hit:tit) n = (hit:fst(divide (tit) (n-1)), snd(divide (tit) (n-1)) )

metade :: [Int] -> ([Int], [Int])
metade [] = ([],[])
metade a 
    | length a `mod` 2  == 0 = divide (a) (length(a)`div`(2))
    | otherwise = divide(a) ((length(a) +1)`div`2 - 1)

--------------------------------------------------------------

--Q7----------------------------------------------------------

isReplica :: String  -> Int -> Char -> Bool
isReplica "" 0 chr  = True
isReplica "" n chr  = False
isReplica (hst:tst) n chr 
    | (hst == chr) && (n>0) = True && isReplica (tst) (n-1) (chr) 
    | otherwise = False

--------------------------------------------------------------

--Q8----------------------------------------------------------
traduzChar :: Char -> [(Char, Char)] -> Char
traduzChar chr (hdic:tdic)
    | chr == fst hdic = snd hdic
    | otherwise = traduzChar chr tdic 

decEnigma :: String -> [(Char, Char)] -> String
decEnigma [] b = ""
decEnigma a [] = a 
decEnigma (hst:tst) dicionario =  traduzChar hst dicionario : decEnigma tst dicionario 

--------------------------------------------------------------

--Q9----------------------------------------------------------
-- deleteN :: [String] -> Int -> [String]
-- deleteN [] n = []
-- deleteN (ha:ta) 0 = ta
-- deleteN (ha:ta) n = ha:deleteN (ta) (n-1)

getElement :: [String] -> Int -> String
getElement [] n = ""
getElement (hst:tst) 0 = hst
getElement (hst:tst) n = getElement (tst) (n-1)

toBool :: String -> Bool
toBool st
    | st == "Aprovada" || st == "aprovada"  = True
    | otherwise = False

cutList :: [String] -> Int -> [String]
cutList [] n  = []
cutList (hlst:tlst) 0 = tlst
cutList (hlst:tlst) n = cutList (tlst) (n-1)

transformListInListOfTupla5 :: [String] -> [(Int, String, String, Double, Bool)]
transformListInListOfTupla5 [] = []
transformListInListOfTupla5 (hls:tls) = (read hls :: Int, getElement tls 0, getElement tls 1, read (getElement tls 2) :: Double, toBool(getElement tls 3)):transformListInListOfTupla5 (cutList tls 3)
--transformListInListOfTupla5 (hls:tls) 5 = if length tls >= 5 then( read (getElement tls 3) :: Int, getElement tls 4, getElement tls 5, read (getElement tls 6) :: Double, toBool(getElement tls 7)):transformListInListOfTupla5 tls 5 else []


concElement :: Char->[String]->[String]
concElement chr [] = [[chr]]
concElement chr (hl:tl) = (chr:hl):tl

separateString2 :: String -> Char -> Char -> [String]
separateString2 "" chr chr2 = [""]
separateString2 (hst:tst) chr chr2
    | hst == chr || hst == chr2 = if tst /= [] then [""] ++ separateString2 tst chr chr2 else separateString2 tst chr chr2
    | otherwise  = concElement (hst) (separateString2 tst chr chr2)

separateString :: String -> Char -> [String]
separateString "" chr = [""]
separateString (hst:tst) chr
    | hst == chr = if tst /= [] then [""] ++ separateString tst chr else separateString tst chr
    | otherwise  = concElement (hst) (separateString tst chr)


clearData :: String -> [(Int, String, String, Double, Bool)]
clearData "" = []
clearData st = transformListInListOfTupla5 (separateString2 (st) ';' ' ')


-- sexta dia 20 8 as 10:30hs