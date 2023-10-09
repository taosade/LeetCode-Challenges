/*

You are given the root of a binary tree where each node has a value
in the range '[0, 25]' representing the letters 'a' to 'z'.

Return the lexicographically smallest string that starts at a leaf of
this tree and ends at the root.

As a reminder, any shorter prefix of a string is lexicographically
smaller.

For example, 'ab' is lexicographically smaller than 'aba'.

A leaf of a node is a node that has no children.

*/

public class TreeNode
{
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?)
	{
		self.val = val
		self.left = left
		self.right = right
	}
}

class Solution
{
	private let abc = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

	private func checkNode(_ node: TreeNode?, currentString: String, minString: inout String)
	{
		guard
			let node = node,
			node.val >= 0,
			node.val <= 25
		else { return }

		let currentString = abc[node.val] + currentString

		guard node.left == nil, node.right == nil else
		{
			// Current node is not a leaf

			checkNode(node.left, currentString: currentString, minString: &minString)
			checkNode(node.right, currentString: currentString, minString: &minString)

			return
		}

		// Current node is a leaf

		guard minString.isEmpty || currentString < minString else { return }

		minString = currentString
	}

	func smallestFromLeaf(_ root: TreeNode?) -> String
	{
		var res = ""

		checkNode(root, currentString: "", minString: &res)

		return res
	}
}
