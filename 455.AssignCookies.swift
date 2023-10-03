/*

Assume you are an awesome parent and want to give your children some
cookies. But, you should give each child at most one cookie.

Each child 'i' has a greed factor 'g[i]', which is the minimum size
of a cookie that the child will be content with; and each cookie 'j'
has a size 's[j]'. If 's[j] >= g[i]', we can assign the cookie 'j' to
the child 'i', and the child 'i' will be content. Your goal is to
maximize the number of your content children and output the maximum
number.

*/

class Solution
{
	func findContentChildren(_ g: [Int], _ s: [Int]) -> Int
	{
		guard !g.isEmpty, !s.isEmpty else { return 0 }

		var res = 0

		var s = s.sorted(by: <)

		for greed in g.sorted(by: <)
		{
			while true
			{
				guard !s.isEmpty else { return res }

				guard s.removeFirst() >= greed else { continue }

				res += 1; break
			}
		}

		return res
	}
}
