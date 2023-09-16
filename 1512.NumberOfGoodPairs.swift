/*

Given an array of integers 'nums', return the number of good pairs.

A pair '(i, j)' is called good if 'nums[i] == nums[j]' and 'i < j'.

*/

class Solution
{
	func numIdenticalPairs(_ nums: [Int]) -> Int
	{
		var res = 0
		var dict = [Int: Int]()

		for num in nums
    {
			if let num = dict[num] { res += num }
			dict[num, default: 0] += 1
		}

		return res
	}
}
