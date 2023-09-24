
//0123456789012345678901234567890123456789012345678901234567891234567

/*

You are given an integer array 'num's and two integers 'limit' and
'goal'. The array 'nums' has an interesting property that
'abs(nums[i]) <= limit'.

Return the minimum number of elements you need to add to make the sum
of the array equal to 'goal'. The array must maintain its property
that 'abs(nums[i]) <= limit'.

*/


 public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?

	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

class Solution
{
	func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int
	{
		guard limit > 0 else { return 0 }

		let distance = abs(goal - nums.reduce(0, +))

		guard distance > 0 else { return 0 }

		return (distance + limit - 1) / limit
	}
}
