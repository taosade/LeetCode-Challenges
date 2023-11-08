/*

Given two strings 's' and 'goal', return 'true' if you can swap two
letters in 's' so the result is equal to 'goal', otherwise, return
'false'.

Swapping letters is defined as taking two indices 'i' and 'j'
(0-indexed) such that 'i != j' and swapping the characters at 's[i]'
and 's[j]'.

*/

function buddyStrings(s: string, goal: string): boolean
{
	if (s.length !== goal.length)
		return false

	let difIndexes = new Array<number>()

	for (let i = 0; i < s.length; i++)
	{
		if (s[i] === goal[i])
			continue

		if (difIndexes.length === 2)
			return false

		difIndexes.push(i)
	}

	if (!difIndexes.length)
		return new Set(s).size < s.length

	return difIndexes.length === 2 &&
		s[difIndexes[0]!] === goal[difIndexes[1]!] &&
		s[difIndexes[1]!] === goal[difIndexes[0]!]
}

// Brute-force solution

function buddyStringsBrute(s: string, goal: string): boolean
{
	if (s.length < 2 || s.length !== goal.length)
		return false

	for (let i = 0; i < s.length - 1; i++)
		for (let j = i + 1; j < s.length; j++)
			if (s.slice(0, i) + s[j] + s.slice(i + 1, j) + s[i] + s.slice(j + 1) === goal)
				return true

	return false
}