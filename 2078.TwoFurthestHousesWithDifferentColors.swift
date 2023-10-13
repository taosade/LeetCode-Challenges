/*

There are 'n' houses evenly lined up on the street, and each house is
beautifully painted. You are given a 0-indexed integer array colors
of length 'n', where 'colors[i]' represents the color of the 'ith'
house.

Return the maximum distance between two houses with different colors.

The distance between the 'ith' and 'jth' houses is 'abs(i - j)',
where 'abs(x)' is the absolute value of 'x'.

*/

class Solution
{
	func maxDistance(_ colors: [Int]) -> Int
	{
		guard
			colors.count >= 2,
			let leftDifIndex = colors.firstIndex(where: { color in color != colors.last }),
			let rightDifIndex = colors.lastIndex(where: { color in color != colors.first })
		else { return 0 }

		return max(colors.count - leftDifIndex - 1, rightDifIndex)
	}
}
