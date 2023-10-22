/*

There are 'n' people that are split into some unknown number of
groups. Each person is labeled with a unique ID from '0' to 'n - 1'.

You are given an integer array 'groupSizes', where 'groupSizes[i]' is
the size of the group that person 'i' is in. For example, if
'groupSizes[1] = 3', then person '1' must be in a group of size '3'.

Return a list of groups such that each person 'i' is in a group of
size 'groupSizes[i]'.

Each person should appear in exactly one group, and every person must
be in a group. If there are multiple answers, return any of them. It
is guaranteed that there will be at least one valid solution for the
given input.

*/

function groupThePeople(groupSizes: number[]): number[][]
{
	const res: number[][] = []

	const sizeMap = new Map<number, number[]>()

	groupSizes.forEach((size, i) =>
	{
		if (!Number.isInteger(size) || size < 1)
			throw new Error('Invalid input')

		const people = sizeMap.get(size) || []

		people.push(i)

		if (people.length === size)
		{
			res.push(people)

			sizeMap.delete(size)

			return
		}

		if (people.length === 1)
			sizeMap.set(size, people)
	})

	return res
}
