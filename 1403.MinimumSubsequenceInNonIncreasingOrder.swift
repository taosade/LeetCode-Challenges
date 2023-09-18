/*

Given the array 'nums', obtain a subsequence of the array whose sum
of elements is strictly greater than the sum of the non included
elements in such subsequence.

If there are multiple solutions, return the subsequence with minimum
size and if there still exist multiple solutions, return the
subsequence with the maximum total sum of all its elements.

A subsequence of an array can be obtained by erasing some (possibly
zero) elements from the array.

Note that the solution with the given constraints is guaranteed to be
unique. Also return the answer sorted in non-increasing order.

*/

class Solution
{
	func minSubsequenceNeat(_ nums: [Int]) -> [Int] {
		guard
			!nums.isEmpty,
			nums.filter({ i in i < 1 }).count == 0
		else { return [] }

		let halfSum = nums.reduce(0, +) / 2
		var numsSorted = nums.sorted(by: >)
		var res = [numsSorted.removeFirst()]

		while res.reduce(0, +) <= halfSum {
			res.append(numsSorted.removeFirst())
		}

		return res
	}
}
