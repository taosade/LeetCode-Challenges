/*

Given an array of integers 'nums', find the maximum length of a
subarray where the product of all its elements is positive.

A subarray of an array is a consecutive sequence of zero or more
values taken out of that array.

Return the maximum length of a subarray with positive product.

*/

class Solution
{
	func getMaxLen(_ nums: [Int]) -> Int
	{
		var res: Int = 0
		var startIndex: Int? = nil
		var firstNegativeIndex: Int? = nil
		var isPositive: Bool = true

		for (i, num) in nums.enumerated()
		{
			guard num != 0 else
			{
				startIndex = nil

				firstNegativeIndex = nil

				continue
			}

			if num < 0 && firstNegativeIndex == nil { firstNegativeIndex = i }

			if let startIndex
			{
				if num < 0 { isPositive.toggle() }

				if isPositive { res = max(res, i - startIndex + 1) }

				// ... or cut the first negative number so the product is positive

				else if let firstNegativeIndex { res = max(res, i - firstNegativeIndex) }
			}
			else
			{
				startIndex = i

				isPositive = num > 0

				if isPositive && res == 0 { res = 1 }
			}
		}

		return res
	}
}
