/*

There is a function 'signFunc(x)' that returns:

- '1' if 'x' is positive
- '-1' if 'x' is negative
- '0' if 'x' is equal to '0'

You are given an integer array 'nums'. Let product be the product of
all values in the array 'nums'.

Return 'signFunc(product)'.

*/

class Solution
{
	func arraySign(_ nums: [Int]) -> Int
	{
		guard !nums.isEmpty else { return 0 }

		var isPositive = true

		for i in nums
		{
			guard i != 0 else { return 0 }
			guard i < 0 else { continue }

			isPositive.toggle()
		}

		return isPositive ? 1 : -1
	}
}
