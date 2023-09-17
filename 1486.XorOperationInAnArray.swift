/*

You are given an integer 'n' and an integer 'start'.

Define an array 'nums' where 'nums[i] = start + 2 * i' (0-indexed)
and 'n == nums.length'.

Return the bitwise XOR of all elements of 'nums'.

*/

class Solution
{
	func xorOperation(_ n: Int, _ start: Int) -> Int
	{
		guard n > 0, start >= 0 else { return 0 }

		let nums = (0...(n - 1)).map { i in start + (i * 2) }

		return nums.reduce(0, ^)
	}
}
