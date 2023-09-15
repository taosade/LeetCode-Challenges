/*

Given two arrays of integers 'nums1' and 'nums2', return the number
of triplets formed (type 1 and type 2) under the following rules:

Type 1: Triplet (i, j, k) if 'nums1[i]2 == nums2[j] * nums2[k]' where
'0 <= i < nums1.length' and '0 <= j < k < nums2.length'.
Type 2: Triplet (i, j, k) if 'nums2[i]2 == nums1[j] * nums1[k]' where
'0 <= i < nums2.length' and '0 <= j < k < nums1.length'.

*/

class Solution
{
	func countProducts(of: Int, inArray: [Int]) -> Int
	{
		guard inArray.count > 1 else { return 0 }

		var res = 0

		for i in 0...(inArray.count - 2)
		{
			for j in (i + 1)...(inArray.count - 1)
			{
				if inArray[i] * inArray[j] == of { res += 1 }
			}
		}

		return res
	}

	func numTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int
	{
		nums1.map { num in num * num }.reduce(0, { acc, num in
			acc + countProducts(of: num, inArray: nums2)
		}) + nums2.map { num in num * num }.reduce(0, { acc, num in
			acc + countProducts(of: num, inArray: nums1)
		})
	}
}
