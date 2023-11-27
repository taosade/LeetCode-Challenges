/*

You are given an integer array 'matches' where
'matches[i] = [winnerI, loserI]' indicates that the player 'winnerI'
defeated player 'loserI' in a match.

Return a list 'answer' of size '2' where:

'answer[0]' is a list of all players that have not lost any matches
'answer[1]' is a list of all players that have lost exactly one match

The values in the two lists should be returned in increasing order.

*/

function findWinners(matches: number[][]): number[][] {
	const winners = new Set<number>()
	const losers = new Set<number>()
	const oneTimeLosers = new Set<number>()

	for (const match of matches) {
		if (!Number.isInteger(match[0]) || !Number.isInteger(match[1]))
			continue

		if (!losers.has(match[0]!))
			winners.add(match[0]!)

		winners.delete(match[1]!)

		if (losers.has(match[1]!))
			oneTimeLosers.delete(match[1]!)
		else {
			losers.add(match[1]!)
			oneTimeLosers.add(match[1]!)
		}
	}

	return [
		Array.from(winners.values()).sort((a, b) => a - b),
		Array.from(oneTimeLosers.values()).sort((a, b) => a - b)
	]
}

// Alternative solution using Map() for loss count (less efficient)

function findWinnersAlt(matches: number[][]): number[][] {
	const winners = new Set<number>()
	const losers = new Map<number, number>()

	for (const match of matches) {
		if (!Number.isInteger(match[0]) || !Number.isInteger(match[1]))
			continue

		if (!losers.has(match[0]!))
			winners.add(match[0]!)

		winners.delete(match[1]!)

		switch (losers.get(match[1]!)) {
			case 1: losers.set(match[1]!, 2); break
			case 2: break
			default: losers.set(match[1]!, 1)
		}
	}

	return [
		Array.from(winners.values()).sort((a, b) => a - b),
		Array.from(losers.entries())
			.filter(i => i[1] === 1)
			.map(i => i[0])
			.sort((a, b) => a - b)
	]
}