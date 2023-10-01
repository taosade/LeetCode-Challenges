/*

You have a long flowerbed in which some of the plots are planted, and
some are not. However, flowers cannot be planted in adjacent plots.

Given an integer array 'flowerbed' containing '0's and '1's, where
'0' means empty and '1' means not empty, and an integer 'n', return
'true' if 'n' new flowers can be planted in the flowerbed without
violating the no-adjacent-flowers rule and 'false' otherwise.

*/

class Solution
{
	func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool
	{
		guard n > 0 else { return true }
		guard !flowerbed.isEmpty else { return false }

		var n = n
		var i = 0

		while i < flowerbed.count
		{
			guard flowerbed[i] == 0 else
			{
				// The plot is taken, moving two plots ahead

				i += 2; continue
			}

			guard i != flowerbed.count - 1 else
			{
				// The plot is the last one in the flowerbed

				return n == 1
			}

			guard flowerbed[i + 1] == 0 else
			{
				// Next plot is taken, moving three plots ahead

				i += 3; continue
			}

			// Found a suitable plot to plant

			guard n > 1 else { return true }

			n -= 1; i += 2
		}

		return false
	}
}
