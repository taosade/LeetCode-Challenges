/*

Given the coordinates of four points in 2D space 'p1', 'p2', 'p3' and
'p4', return 'true' if the four points construct a square.

The coordinate of a point 'p-i' is represented as '[x-i, y-i]'. The
input is not given in any order.

A valid square has four equal sides with positive length and four
equal angles (90-degree angles).

*/

class Solution
{
	func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool
	{
		guard
			p1.count == 2,
			p2.count == 2,
			p3.count == 2,
			p4.count == 2
		else { return false }

		let points = [p1, p2, p3, p4]

		var distances = Set<Int>()

		for i in 0...2
		{
			for j in (i + 1)...3
			{
				let distance =
					(points[i][0] - points[j][0]) * (points[i][0] - points[j][0]) +
					(points[i][1] - points[j][1]) * (points[i][1] - points[j][1])

				// Short circuit if any of two points are the same

				guard distance != 0 else { return false }

				distances.insert(distance)

				// Short circuit if three distinct distances found

				guard distances.count != 3 else { return false }
			}
		}

		return true
	}
}
