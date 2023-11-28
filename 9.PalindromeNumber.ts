/*

Given an integer 'x', return 'true' if 'x' is a palindrome, and 'false'
otherwise.

*/

function isPalindrome(x: number): boolean {
	const str = x.toString()

   for (let i = 0; i < (str.length - 1) / 2; i++)
		if (str[i] !== str[str.length - 1 - i])
			return false

	return true
}

// Less efficient one-liner

function isPalindromeOL(x: number): boolean {
	return x === Number.parseInt(x.toString().split('').reverse().join(''))
}

// Smart non-string solution

function isPalindromeNS(x: number): boolean {
	if (x < 0) return false

	let X = x // preserve initial x value
	let ans = 0

	while (X > 0) {
		const lastDigit = X % 10
		ans = ans * 10 + lastDigit
		X = Math.floor(X / 10)
	}

	return ans === x
}