/*

You are given two 2D integer arrays 'nums1' and 'nums2'.

'nums[i] = [id, val]' indicate that the number with the id 'id' has a
value equal to 'val'.

Each array contains unique ids and is sorted in ascending order by
id.

Merge the two arrays into one array that is sorted in ascending order
by id, respecting the following conditions:

- Only ids that appear in at least one of the two arrays should be
included in the resulting array.
- Each id should be included only once and its value should be the
sum of the values of this id in the two arrays. If the id does not
exist in one of the two arrays then its value in that array is
considered to be' '0'.
- Return the resulting array. The returned array must be sorted in
ascending order by id.

*/

class Solution
{
	func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]]
	{
		guard !nums1.isEmpty && !nums2.isEmpty else { return [] }

		var pointer1 = 0, pointer2 = 0
		var res = [[Int]]()

		while true
		{
			// Check if one of the pointers reached the end

			guard pointer1 < nums1.count else { res.append(contentsOf: nums2[pointer2...]); break }
			guard pointer2 < nums2.count else { res.append(contentsOf: nums1[pointer1...]); break }

			// Next 'nums1' element has lower ID

			if nums1[pointer1][0] < nums2[pointer2][0]
			{
				res.append([nums1[pointer1][0], nums1[pointer1][1]])

				pointer1 += 1

				continue
			}

			// Next 'nums2' element has lower ID

			if nums1[pointer1][0] > nums2[pointer2][0]
			{
				res.append([nums2[pointer2][0], nums2[pointer2][1]])

				pointer2 += 1

				continue
			}

			// Next ID is present in both arrays

			res.append([nums1[pointer1][0], nums1[pointer1][1] + nums2[pointer2][1]])

			pointer1 += 1
			pointer2 += 1
		}

		return res
	}
}
