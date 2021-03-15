double :: [Int] -> [Int]
double [] = []
double (h:ls) = (2*h) : double(ls)

expand :: [Int] -> [Int]
expand [] = []
expand (h:ls) = h:h:expand(ls)


member :: [Int] -> Int -> Bool
member [] n = False
member (h:ls) n = h == n || member ls n

digits :: String -> String
digits "" = ""
digits (st:ls) = st >= '0' && st <= '9'  