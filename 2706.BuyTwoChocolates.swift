/*

You are given an integer array 'prices' representing the prices of
various chocolates in a store. You are also given a single integer
'money', which represents your initial amount of money.

You must buy exactly two chocolates in such a way that you still have
some non-negative leftover money. You would like to minimize the sum
of the prices of the two chocolates you buy.

Return the amount of money you will have leftover after buying the
two chocolates. If there is no way for you to buy two chocolates
without ending up in debt, return 'money'. Note that the leftover
must be non-negative.

*/

class Solution
{
	func buyChoco(_ prices: [Int], _ money: Int) -> Int
	{
		guard prices.count >= 2 else { return money }

		let prices = prices.sorted(by: <)

		let leftover = money - prices[0] - prices[1]

		return leftover >= 0 ? leftover : money
	}
}
