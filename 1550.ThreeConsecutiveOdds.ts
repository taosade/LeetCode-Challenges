/*

Given an integer array 'arr', return 'true' if there are three
consecutive odd numbers in the array. Otherwise, return 'false'.

*/

function threeConsecutiveOdds(arr: number[]): boolean
{
	let oddsCount = 0

	for (let num of arr)
	{
		if (!Number.isInteger(num) || num % 2 === 0)
		{
			oddsCount = 0; continue
		}

		if (++oddsCount === 3) return true
	}

   return false
}
