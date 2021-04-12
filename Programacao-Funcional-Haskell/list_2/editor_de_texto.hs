data Cmd = Cursor Int
           | Backspace Int
           | Delete Int
           | Insert String
           deriving (Read)

moveCursor :: Int -> [String] -> [String]
moveCursor move list
    | move < 0      = moveCursor (move+1) [reverse(tail revlef), head revlef:right]
    | move > 0      = moveCursor (move-1) [lef ++ [head right], tail right]
    | otherwise     = list
        where
            lef      = head list
            revlef   = reverse lef
            right    = list!!1
            revright = reverse right

backspace :: Int -> [String] -> [String]
backspace quant list
    | quant > 0         = backspace (quant-1) [reverse(tail revlef), right]
    | otherwise         = list
        where
            lef      = head list
            revlef   = reverse lef
            right    = list!!1
            revright = reverse right

delete :: Int -> [String] -> [String]
delete quant list
    | quant > 0         = delete (quant-1) [lef, tail right]
    | otherwise         = list
        where
            lef      = head list
            revlef   = reverse lef
            right    = list!!1
            revright = reverse right

insert :: String -> [String] -> [String]
insert s list = [lef, s++right]
    where
        lef      = head list
        revlef   = reverse lef
        right    = list!!1
        revright = reverse right

executeCmds:: [String] -> [Cmd] -> [String]
executeCmds list [] = list
executeCmds list (Cursor k : t)         = executeCmds (moveCursor k list) t
executeCmds list (Backspace k : t)      = executeCmds (backspace k list) t
executeCmds list (Delete k : t)         = executeCmds (delete k list) t
executeCmds list (Insert k : t)         = executeCmds (insert k list) t

editText :: String -> [Cmd] -> String
editText txt cmds = head textafter ++ textafter !! 1
    where
        textafter = executeCmds ["", txt] cmds

main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result

