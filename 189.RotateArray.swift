/*

Given an integer array 'nums', rotate the array to the right by 'k'
steps, where 'k' is non-negative.

*/

class Solution
{
	func rotate(_ nums: inout [Int], _ k: Int)
	{
		guard nums.count > 1, k > 0 else { return }

		for _ in 1...k
		{
			nums.insert(nums.popLast()!, at: 0)
		}
	}
}
