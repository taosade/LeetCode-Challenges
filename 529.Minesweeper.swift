/*

Let's play the minesweeper game!

You are given an 'm x n' char matrix 'board' representing the game
board where:

- 'M' represents an unrevealed mine,
- 'E' represents an unrevealed empty square,
- 'B' represents a revealed blank square that has no adjacent mines
(i.e., above, below, left, right, and all 4 diagonals),
- digit ('1' to '8') represents how many mines are adjacent to this
revealed square,
- 'X' represents a revealed mine.

You are also given an integer array 'click' where
'click = [clickR, clickC]' represents the next click position among
all the unrevealed squares ('M' or 'E').

Return the board after revealing this position according to the
following rules:

- If a mine 'M' is revealed, then the game is over. You should
change it to 'X'.
- If an empty square 'E' with no adjacent mines is revealed, then
change it to a revealed blank 'B' and all of its adjacent unrevealed
squares should be revealed recursively.
- If an empty square 'E' with at least one adjacent mine is
revealed, then change it to a digit ('1' to '8') representing the
number of adjacent mines.

*/

class Solution
{
	// Helper function returning an array of adjacent fields

	func adjacentFields(_ board: [[Character]], _ field: [Int]) -> [[Int]]
	{
		guard field.count == 2 else { return [] }

		var res = [[Int]]()

		for i in -1...1
		{
			guard (0..<board.count).contains(field[0] + i) else { continue }

			for j in -1...1
			{
				guard
					!(i == 0 && j == 0),
					(0..<board[field[0] + i].count).contains(field[1] + j)
				else { continue }

				res.append([field[0] + i, field[1] + j])
			}
		}

		return res
	}

	func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]]
	{
		guard
			click.count == 2,
			(0..<board.count).contains(click[0]),
			(0..<board[click[0]].count).contains(click[1])
		else { return board }

		var board = board

		switch board[click[0]][click[1]]
		{
			case "E":

			let adjacentFields = adjacentFields(board, click)
			let adjacentMineCount = adjacentFields.filter({ field in board[field[0]][field[1]] == "M" }).count

			if adjacentMineCount == 0
			{
				board[click[0]][click[1]] = "B"

				// Recursively reveal all adjacent fields

				adjacentFields.forEach
				{
					field in board = updateBoard(board, field)
				}
			} else { board[click[0]][click[1]] = Character("\(adjacentMineCount)") }

			case "M": board[click[0]][click[1]] = "X"; // Game over

			default: ()
		}

		return board
	}
}
