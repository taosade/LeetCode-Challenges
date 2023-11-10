/*

Write a function that reverses a string. The input string is given as
an array of characters 's'.

You must do this by modifying the input array in-place with O(1)
extra memory.

*/

function reverseString(s: string[]): void
{
	let pointer = 0

	for (let i = s.length - 1; i > pointer; i--)
	{
	const temp = s[i]

	s[i] = s[pointer]!; s[pointer] = temp!

	pointer++
	}
}

// And an obvious one:

function reverseStringDumb(s: string[]): void
{
	s.reverse()
}