data Command = Forward Int | Backward Int | TurnLeft | TurnRight
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)


calculateDest :: (Int,Int) -> Direction -> [Command] -> (Int,Int)
calculateDest t d [] = t
calculateDest (a, b) North (Forward k : t)         = calculateDest (a, b + k) North t
calculateDest (a, b) North (Backward k : t)        = calculateDest (a, b - k) North t
calculateDest (a, b) North (TurnLeft: t)           = calculateDest (a, b) West t
calculateDest (a, b) North (TurnRight : t)         = calculateDest (a, b) East t

calculateDest (a, b) South (Forward k : t)         = calculateDest (a, b - k) South t
calculateDest (a, b) South (Backward k : t)        = calculateDest (a, b + k) South t
calculateDest (a, b) South (TurnLeft: t)           = calculateDest (a, b) East t
calculateDest (a, b) South (TurnRight : t)         = calculateDest (a, b) West t

calculateDest (a, b) West (Forward k : t)          = calculateDest (a - k, b) West t
calculateDest (a, b) West (Backward k : t)         = calculateDest (a + k, b) West t
calculateDest (a, b) West (TurnLeft: t)            = calculateDest (a, b) South t
calculateDest (a, b) West (TurnRight : t)          = calculateDest (a, b) North t

calculateDest (a, b) East (Forward k : t)          = calculateDest (a + k, b) East t
calculateDest (a, b) East (Backward k : t)         = calculateDest (a - k, b) East t
calculateDest (a, b) East (TurnLeft: t)            = calculateDest (a, b) North t
calculateDest (a, b) East (TurnRight : t)          = calculateDest (a, b) South t

destination :: (Int,Int) -> [Command] -> (Int,Int)
destination a = calculateDest a North

main = do
       a <- getLine
       b <- getLine
       let result = destination (read a) (read b)
       print result
