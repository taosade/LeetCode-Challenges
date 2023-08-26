/*

You are given two integer arrays 'nums1' and 'nums2', sorted in
non-decreasing order, and two integers 'm' and 'n', representing the
number of elements in 'nums1' and 'nums2' respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing
order.

The final sorted array should not be returned by the function, but
instead be stored inside the array 'nums1'. To accommodate this,
'nums1' has a length of 'm + n', where the first 'm' element denote
the elements that should be merged, and the last 'n' elements are set
to '0' and should be ignored. 'nums2' has a length of 'n'.

*/

class Solution
{
	// Expected solution using pointers
	
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		var pointer1 = m - 1
		var pointer2 = n - 1
		var current = m + n - 1

		while pointer1 >= 0 && pointer2 >= 0 {
			if nums1[pointer1] >= nums2[pointer2] {
				nums1[current] = nums1[pointer1]
				pointer1 -= 1
			} else {
				nums1[current] = nums2[pointer2]
				pointer2 -= 1
			}

			current -= 1
		}

		// If nums2 array still has elements left:

		while pointer2 >= 0 {
			nums1[current] = nums2[pointer2]
			pointer2 -= 1
			current -= 1
		}
	}

	// One line solution using Array.sorted()

	func mergeOneLiner(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		nums1 = (nums1[..<m] + nums2).sorted()
	}
}
