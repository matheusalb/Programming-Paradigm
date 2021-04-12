data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

faces :: Direction -> [Command] -> Direction
faces d [] = d
faces North (Forward k : t)         = faces North t
faces North (Backward k : t)        = faces North t
faces North (TurnLeft: t)           = faces West t
faces North (TurnRight : t)         = faces East t
  
faces South (Forward k : t)         = faces South t
faces South (Backward k : t)        = faces South t
faces South (TurnLeft: t)           = faces East t
faces South (TurnRight : t)         = faces West t
  
faces West (Forward k : t)          = faces West t
faces West (Backward k : t)         = faces West t
faces West (TurnLeft: t)            = faces South t
faces West (TurnRight : t)          = faces North t

faces East (Forward k : t)          = faces East t
faces East (Backward k : t)         = faces East t
faces East (TurnLeft: t)            = faces North t
faces East (TurnRight : t)          = faces South t

main = do
       a <- getLine
       b <- getLine
       let result = faces (read a) (read b)
       print result
