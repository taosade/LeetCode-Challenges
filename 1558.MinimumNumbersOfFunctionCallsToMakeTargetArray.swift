/*

You are given an integer array 'nums'. You have an integer array
'arr' of the same length with all values set to 0 initially. You also
have the modify function which either increents any given element of
'arr' or doubles all the elements in one run.

You want to use the modify function to convert 'arr' to 'nums' using
the minimum number of calls.

Return the minimum number of function calls to make 'nums' from
'arr'.

*/

class Solution
{
	func minOperations(_ nums: [Int]) -> Int
	{
		var res = 0
		var tmp = nums
		var modified = false

		while true
		{
			modified = false

			for (i, num) in tmp.enumerated()
			{
				guard num != 0 else { continue }

				if (num % 2) == 1
				{
					tmp[i] -= 1

					res += 1

					if tmp[i] == 0 { continue }
				}

				tmp[i] /= 2

				modified = true
			}

			guard modified else { break }

			res += 1
		}

		return res
	}
}
