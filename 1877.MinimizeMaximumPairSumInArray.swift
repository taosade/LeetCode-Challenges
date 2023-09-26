/*

The pair 'sum' of a pair '(a, b)' is equal to 'a + b'. The maximum
pair 'sum' is the largest pair sum in a list of pairs.

For example, if we have pairs '(1, 5)', '(2, 3)', and '(4, 4)', the
maximum pair sum would be 'max(1+5, 2+3, 4+4) = max(6, 5, 8) = 8'.

Given an array 'nums' of even length 'n', pair up the elements of
nums into 'n / 2' pairs such that:

Each element of 'nums' is in exactly one pair, and the maximum pair
sum is minimized.

Return the minimized maximum pair sum after optimally pairing up the
elements.

*/

class Solution
{
	func minPairSum(_ nums: [Int]) -> Int
	{
		guard nums.count % 2 == 0 else { return 0 }

		var maxSum = Int.min
		let nums = nums.sorted(by: <)

		for i in 0..<(nums.count / 2)
		{
			let sum = nums[i] + nums[nums.count - 1 - i]

			if sum > maxSum { maxSum = sum }
		}

		return maxSum
	}
}
