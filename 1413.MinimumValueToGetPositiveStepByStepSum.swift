/*

Given an array of integers 'nums', you start with an initial positive
value 'startValue'.

In each iteration, you calculate the step by step sum of 'startValue'
plus elements in 'nums' (from left to right).

Return the minimum positive value of 'startValue' such that the step
by step sum is never less than 1.

*/

class Solution
{
	func minStartValue(_ nums: [Int]) -> Int
	{
		var acc = 0
		var min = 0

		for num in nums
		{
			acc += num

			if acc < min { min = acc }
		}

		return -min + 1
	}
}
