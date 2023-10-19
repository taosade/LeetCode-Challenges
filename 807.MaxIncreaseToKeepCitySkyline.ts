/*

There is a city composed of 'n x n' blocks, where each block contains
a single building shaped like a vertical square prism. You are given
a 0-indexed 'n x n' integer matrix grid where 'grid[r][c]' represents
the height of the building located in the block at row 'r' and column
'c'.

A city's skyline is the outer contour formed by all the building when
viewing the side of the city from a distance. The skyline from each
cardinal direction north, east, south, and west may be different.

We are allowed to increase the height of any number of buildings by
any amount (the amount can be different per building). The height of
a 0-height building can also be increased. However, increasing the
height of a building should not affect the city's skyline from any
cardinal direction.

Return the maximum total 'sum' that the height of the buildings can
be increased by without changing the city's skyline from any cardinal
direction.

*/

function maxIncreaseKeepingSkyline(grid: number[][]): number
{
	// Check grid consistency

	for (let i = 1; i < grid.length; i++)
		if (grid[i].length !== grid[0].length)
			throw new Error('Uneven grid')

	const xMaxHeights: number[] = []
	const yMaxHeights: number[] = []

	// Find max heights for each row and column

	for (let x = 0; x < grid.length; x++)
	{
		for (let y = 0; y < grid[x].length; y++)
		{
			if (!Number.isInteger(grid[x][y]) || grid[x][y] < 0)
				throw new Error('Invalid height')

			xMaxHeights[x] = Math.max(xMaxHeights[x] ?? 0, grid[x][y])
			yMaxHeights[y] = Math.max(yMaxHeights[y] ?? 0, grid[x][y])
		}
	}

	let res = 0

	// Sum difs between each building's height and min of max heights

	for (let x = 0; x < xMaxHeights.length; x++)
	{
		for (let y = 0; y < yMaxHeights.length; y++)
		{
			res += Math.min(xMaxHeights[x], yMaxHeights[y]) - grid[x][y]
		}
	}

	return res
}
