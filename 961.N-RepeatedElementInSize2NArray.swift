/*

You are given an integer array 'nums' with the following properties:

1. 'nums.length == 2 * n'
2. 'nums' contains 'n + 1' unique elements
3. Exactly one element of 'nums' is repeated 'n' times
4. Return the element that is repeated 'n' times.

*/

class Solution
{
	func repeatedNTimes(_ nums: [Int]) -> Int
	{
		var numSet = Set<Int>()

		for num in nums
		{
			if numSet.contains(num) { return num }

			numSet.insert(num)
		}

		// Fallback in case input array is empty or all elements are unique

		return 0
	}
}
