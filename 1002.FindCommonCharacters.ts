/*

Given a string array 'words', return an array of all characters that
show up in all strings within the 'words' (including duplicates). You
may return the answer in any order.

*/

function commonChars(words: string[]): string[]
{
	if (!words.length) return []

	const chars = words.map(word => [...word])

	outerLoop: for (let i = chars[0]!.length - 1; i >= 0; i--)
	{
		for (let j = 1; j < chars.length; j++)
		{
			const k = chars[j]!.indexOf(chars[0]![i]!)

			if (k === -1) // character not found
			{
				chars[0]!.splice(i, 1)

				continue outerLoop
			}

			chars[j]!.splice(k, 1)
		}
	}

	return chars[0]!
}
