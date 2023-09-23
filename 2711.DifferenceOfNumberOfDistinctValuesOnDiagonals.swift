/*

Given a 0-indexed 2D grid of size 'm x n', you should find the matrix
answer of size 'm x n'.

The value of each cell '(r, c)' of the matrix answer is calculated in
the following way:

- Let 'topLeft[r][c]' be the number of distinct values in the
top-left diagonal of the cell '(r, c)' in the matrix grid.
- Let bottomRight[r][c] be the number of distinct values in the
bottom-right diagonal of the cell '(r, c)' in the matrix grid.

Then 'answer[r][c] = |topLeft[r][c] - bottomRight[r][c]|'.

Return the matrix answer.

A matrix diagonal is a diagonal line of cells starting from some cell
in either the topmost row or leftmost column and going in the
bottom-right direction until reaching the matrix's end.

A cell '(r1, c1)' belongs to the top-left diagonal of the cell
'(r, c)', if both belong to the same diagonal and 'r1 < r'. Similarly
is defined bottom-right diagonal.

*/

class Solution
{
	func differenceOfDistinctValues(_ grid: [[Int]]) -> [[Int]]
	{
		var res = [[Int]]()

		for i in 0..<grid.count
		{
			res.append([])

			for j in 0..<grid[i].count
			{
				var k = i, l = j
				var topLeftNums = Set<Int>(), bottomRightNums = Set<Int>()

				// Collect unique top-left values
				
				while k > 0 && l > 0
				{
					k -= 1; l -= 1; topLeftNums.insert(grid[k][l])
				}

				k = i; l = j

				// Colect unique bottom-right values

				while k < (grid.count - 1) && l < (grid[k + 1].count - 1)
				{
					k += 1; l += 1; bottomRightNums.insert(grid[k][l])
				}

				res[i].append(abs(topLeftNums.count - bottomRightNums.count))
			}
		}

		return res
	}
}
