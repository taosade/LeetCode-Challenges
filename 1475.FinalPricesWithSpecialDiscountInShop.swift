/*

You are given an integer array 'prices' where 'prices[i]' is the
price of the ith item in a shop.

There is a special discount for items in the shop. If you buy the ith
item, then you will receive a discount equivalent to 'prices[j]'
where 'j' is the minimum index such that 'j > i' and
'prices[j] <= prices[i]'. Otherwise, you will not receive any
discount at all.

Return an integer array answer where 'answer[i]' is the final price
you will pay for the ith item of the shop, considering the special
discount.

*/

class Solution
{
	func finalPrices(_ prices: [Int]) -> [Int]
	{
		var res = prices

		guard res.count > 1 else { return res }

		for i in 0...(res.count - 2)
		{
			for j in (i + 1)...(res.count - 1)
			{
				guard res[j] <= res[i] else { continue }

				res[i] -= prices[j]

				break
			}
		}

		return res
	}
}
