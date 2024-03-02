type Position = [Int]

type Move = (Int, Int)


play :: Position -> Move -> Position --Receives a position p, a valid move j, and returns the position obtained by making that move.
play (p : ps) (i, n)
  | i == 1 && p - n > 0 = (p - n) : ps
  | i == 1 && p - n == 0 = ps
  | otherwise = p : play ps (i -1, n)


possibleMoves :: Position -> [Move] -- Receives a position p and returns the set of valid moves starting from p.
possibleMoves n = possibleMovesFrom 1 n

possibleMovesFrom :: Int -> Position -> [Move]
possibleMovesFrom i [] = []
possibleMovesFrom i (x : xs) = possibleMovesAt i x `mergeMoves` possibleMovesFrom (i + 1) xs

possibleMovesAt :: Int -> Int -> [Move]
possibleMovesAt i 0 = []
possibleMovesAt i x = (i, x) : possibleMovesAt i (x -1)

mergeMoves :: [Move] -> [Move] -> [Move]
mergeMoves [] t = t
mergeMoves (s : st) t = mergeMoves st (s : t)


isWinningPosition :: Position -> Bool -- Determines whether a position p is winning.
isWinningPosition p = hasWinningMove p (possibleMoves p)

hasWinningMove :: Position -> [Move] -> Bool
hasWinningMove _ [] = False
hasWinningMove [] _ = False
hasWinningMove [1] _ = True
hasWinningMove p (m : ms) = not (isWinningPosition (play p m)) || hasWinningMove p ms


winningMove :: Position -> Move-- Receives a winning position p and returns a move that would leave the opponent in a non-winning position.
winningMove p = whichWinningMove p (possibleMoves p)

whichWinningMove :: Position -> [Move] -> Move
whichWinningMove p (m : ms)
  | not (isWinningPosition (play p m)) = m
  | otherwise = whichWinningMove p ms


numberOfWinningMoves :: Position -> Int -- Receives a position p (not necessarily winning) and returns the number of winning moves starting from p.
numberOfWinningMoves p = countWinningMoves p (possibleMoves p)

countWinningMoves :: Position -> [Move] -> Int
countWinningMoves p [] = 0
countWinningMoves p (m : ms)
  | not (isWinningPosition (play p m)) = 1 + countWinningMoves p ms
  | otherwise = countWinningMoves p ms
