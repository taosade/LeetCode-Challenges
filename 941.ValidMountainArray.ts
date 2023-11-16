/*

Given an array of integers 'arr', return 'true' if and only if it is
a valid mountain array. Recall that 'arr' is a mountain array if and
only if:

- 'arr.length >= 3'
- There exists some 'i' with '0 < i < arr.length - 1' such that:
- 'arr[0] < arr[1] < ... < arr[i - 1] < arr[i]'
- arr[i] > arr[i + 1] > ... > arr[arr.length - 1]'

*/

function validMountainArray(arr: number[]): boolean
{
	if (arr.length < 3) return false

	let peakPassed = false

	for (let i = 1; i < arr.length; i++)
	{
		if
		(
			!Number.isInteger(arr[i]) ||
			!Number.isInteger(arr[i - 1]) ||
			arr[i] === arr[i - 1]
		)
			return false

		if (arr[i]! < arr[i - 1]!)
		{
			if (i === 1) return false

			peakPassed = true
		}
		else if (peakPassed) return false
	}

	return peakPassed
}
