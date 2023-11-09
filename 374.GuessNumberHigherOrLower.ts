/*

We are playing the Guess Game. The game is as follows:

I pick a number from '1' to 'n'. You have to guess which number I
picked.

Every time you guess wrong, I will tell you whether the number I
picked is higher or lower than your guess.

You call a pre-defined API 'int guess(int num)', which returns three
possible results:

'-1': Your guess is higher than the number I picked.
'1': Your guess is lower than the number I picked.
'0': your guess is equal to the number I picked.

Return the number that I picked.

*/

function guessNumber(n: number): number
{
	if (!Number.isInteger(n) || n < 1)
		throw new Error('Invalid input')

	let min = 1
	let max = n

	while (true)
	{
		let currentGuess = Math.ceil((min + max) / 2)

		// @ts-ignore: guess(num) implemented by the task
		switch (guess(currentGuess))
		{
			case -1: max = currentGuess - 1; continue
			case 1: min = currentGuess + 1; continue
			default: return currentGuess
		}
	}
}