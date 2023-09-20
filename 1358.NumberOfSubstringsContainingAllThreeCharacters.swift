/*

Given a string 's' consisting only of characters 'a', 'b' and 'c'.

Return the number of substrings containing at least one occurrence of
all these characters 'a', 'b' and 'c'.

*/

class Solution
{
	func betterNumberOfSubstrings(_ s: String) -> Int
	{
		let s = Array(s)
		var a = 0, b = 0, c = 0
		var leftEdge = 0
		var res = 0

		for rightEdge in 0..<s.count
		{
			switch s[rightEdge]
			{
				case "a": a += 1
				case "b": b += 1
				case "c": c += 1
				default: ()
			}

			while a > 0, b > 0, c > 0
			{
				res += s.count - rightEdge

				switch s[leftEdge]
				{
					case "a": a -= 1
					case "b": b -= 1
					case "c": c -= 1
					default: ()
				}

				leftEdge += 1
			}
		}

		return res
	}
}
