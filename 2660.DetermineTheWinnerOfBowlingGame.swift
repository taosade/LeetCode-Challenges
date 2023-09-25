/*

You are given two 0-indexed integer arrays 'player1' and 'player2',
that represent the number of pins that player 1 and player 2 hit in a
bowling game, respectively.

The bowling game consists of 'n' turns, and the number of pins in
each turn is exactly 10.

Assume a player hit 'x-i' pins in the ith turn. The value of the ith
turn for the player is:

- '2 * i' if the player hit 10 pins in any of the previous two turns.
- Otherwise, it is 'x-i'.

The score of the player is the sum of the values of their 'n' turns.

Return

- 1 if the score of player 1 is more than the score of player 2
- 2 if the score of player 2 is more than the score of player 1
- 0 in case of a draw

*/

class Solution
{
	func countScore(_ scores: [Int]) -> Int
	{
		var res = 0, strikes = 0

		for score in scores
		{
			res += strikes > 0 ? 2 * score : score

			if score == 10 { strikes = 2 }
			else if strikes > 0 { strikes -= 1 }
		}

		return res
	}

	func isWinner(_ player1: [Int], _ player2: [Int]) -> Int
	{
		let score1 = countScore(player1)
		let score2 = countScore(player2)

		if score1 == score2 { return 0 }

		return score1 > score2 ? 1 : 2
	}
}
