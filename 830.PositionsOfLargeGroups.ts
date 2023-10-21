/*

In a string 's' of lowercase letters, these letters form consecutive
groups of the same character.

For example, a string like 'abbxxxxzyy' has the groups 'a', 'bb',
'xxxx', 'z', and 'yy'.

A group is identified by an interval '[start, end]', where 'start'
and 'end' denote the start and end indices (inclusive) of the group.
In the above example, 'xxxx' has the interval '[3, 6]'.

A group is considered large if it has 3 or more characters.

Return the intervals of every large group sorted in increasing order
by start index.

*/

function largeGroupPositions(s: string): number[][] {
	if (!s.length)
		return []

	const res: number[][] = []

	let currentChar = s[0]
	let startPos = 0

	for (let i = 1; i < s.length + 1; i++) {
		if (s[i] === currentChar)
			continue

		if (i - startPos >= 3)
			res.push([startPos, i - 1])

		currentChar = s[i]
		startPos = i
	}

	return res
}
