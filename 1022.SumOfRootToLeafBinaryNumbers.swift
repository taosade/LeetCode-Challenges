/*

You are given the root of a binary tree where each node has a value
'0' or '1'. Each root-to-leaf path represents a binary number
starting with the most significant bit.

For example, if the path is '0 -> 1 -> 1 -> 0 -> 1', then this could
represent '01101' in binary, which is '13'.

or all leaves in the tree, consider the numbers represented by the
path from the root to that leaf. Return the sum of these numbers.

*/

class Solution
{
	func getLeafsSum(_ node: TreeNode, prefix: String = "") -> Int
	{

		guard node.left != nil || node.right != nil else
		{
			return Int(prefix + "\(node.val)", radix: 2) ?? 0
		}

		var res = 0

		if let left = node.left
		{
			res += getLeafsSum(left, prefix: prefix + "\(node.val)")
		}

		if let right = node.right
		{
			res += getLeafsSum(right, prefix: prefix + "\(node.val)")
		}

		return res
	}

	func sumRootToLeaf(_ root: TreeNode?) -> Int
	{
		if let node = root { return getLeafsSum(node, prefix: "\(node.val)") }

		return 0
	}
}
