/*

Given the array 'nums' consisting of '2n' elements in the form
'[x1, x2, ..., xn, y1, y2, ..., yn]'.

Return the array in the form '[x1, y1, x2, y2, ..., xn, yn]'.

*/

class Solution
{
	// Straightforward cycle solution

	func shuffle(_ nums: [Int], _ n: Int) -> [Int]
	{
		guard n != 0, nums.count == 2 * n else { return [] }

		var res = [Int]()

		for i in 0...(n - 1)
		{
			res.append(nums[i])
			res.append(nums[i + n])
		}

		return res
	}

	// One-line solution using zip

	func shuffleWithZip(_ nums: [Int], _ n: Int) -> [Int]
	{
		guard n != 0, nums.count == 2 * n else { return [] }

		return zip(nums[0...(n - 1)], nums[n...((2 * n) - 1)]).flatMap { (i, j) in [i, j] }
	}
}
