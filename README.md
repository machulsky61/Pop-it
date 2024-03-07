![Haskell](https://img.shields.io/badge/Haskell-5e5086?style=for-the-badge&logo=haskell&logoColor=white)

# Pop-it Game

## Overview
Pop-it is a two-player game where players take turns alternately. At the beginning of the game, there are several piles of stones on a table. A move consists of selecting one of the piles and removing some stones from it (at least one stone must be removed, and it's also valid to remove all the stones from the pile). The player who takes the last stone wins. In other words, the player who cannot make a move because there are no stones left on the table loses. It's worth noting that there are no ties, and the game always ends since at some point all the stones are removed.

The main objective of this project is to write functions that allow playing Pop-it optimally.

![Uncle Petros and Goldbach's Conjecture](https://d15djgxczo4v72.cloudfront.net/s3fs-public/davidson_images/NimGame_wiki_580.png)

## Table of Contents
- [Winning Positions](#winning-positions)
- [Representing Positions and Moves in Haskell](#representing-positions-and-moves-in-haskell)
- [Usage](#usage)
- [Documentation](#documentation)
- [License](#license)

## Winning Positions

We say that a position is winning if the player whose turn it is can ensure winning the game, regardless of how well their opponent plays.

In a two-player game like Pop-it, it's possible to characterize winning positions recursively:

- A position is winning if there exists a move such that the position obtained after making that move is not winning.

Note that we don't need a base case: with this definition of winning position, it follows that the empty position is not winning, as the set of valid moves from the empty position is empty. The implementation of Exercise 3 should be based on this recurrence.

## Representing Positions and Moves in Haskell
We will represent a Pop-it position with the following type:

```haskell
type Position = [Int]
```
The numbers in the list must be positive integers and represent the sizes of the piles of stones.

Note that a position can be represented in various ways. For example, the position where there is one pile with 5 stones and two piles with 2 stones can be represented in three equivalent ways: [5,2,2], [2,5,2], and [2,2,5]. However, [2,2,5,0] is not a valid representation of this position (we don't write piles that are empty). It's worth noting that the game ends when the position becomes empty [].

On the other hand, we will represent a move with the following type:
```haskell
type Move = (Int, Int)
```
The first element of the pair indicates the position of the pile, and the second indicates how many stones are removed from that pile in that move. As usual in the course, we number the piles starting from 1.

## Usage
To use the Pop-it game functions, you can simply copy the Haskell code provided and include it in your Haskell project. Ensure that you have Haskell installed on your system.

## Documentation
`play :: Position -> Move -> Position`
> Receives a position p, a valid move j, and returns the position obtained by making that move.

`possibleMoves :: Position -> [Move]`
> Receives a position p and returns the set of valid moves starting from p.

`isWinningPosition :: Position -> Bool`
> Determines whether a position p is winning.

`winningMove :: Position -> Move`
> Receives a winning position p and returns a move that would leave the opponent in a non-winning position.

`numberOfWinningMoves :: Position -> Int`
> Receives a position p (not necessarily winning) and returns the number of winning moves starting from p.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
