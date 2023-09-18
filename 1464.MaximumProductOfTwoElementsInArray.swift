/*

Given the array of integers 'nums', you will choose two different
indices 'i' and 'j' of that array. Return the maximum value of
'(nums[i]-1)*(nums[j]-1)'.

*/

class Solution
{
	// Straightforward solution

	func maxProduct(_ nums: [Int]) -> Int {
		guard
			nums.count > 1,
			nums.filter({ i in i < 1 }).count == 0
		else { return 0 }

		var res = 0

		for i in 0...(nums.count - 2) {
			for j in (i + 1)...(nums.count - 1) {
				let product = (nums[i] - 1) * (nums[j] - 1)

				if product > res { res = product }
			}
		}

		return res
	}

	// Solution using sort

	func maxProductWithSort(_ nums: [Int]) -> Int {
		guard
			nums.count > 1,
			nums.filter({ i in i < 1 }).count == 0
		else { return 0 }

		let numsSorted = nums.sorted(by: >)

		return (numsSorted[0] - 1) * (numsSorted[1] - 1)
	}
}
