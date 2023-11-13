/*

You are given a sorted array consisting of only integers where every
element appears exactly twice, except for one element which appears
exactly once.

Return the single element that appears only once.

*/

function singleNonDuplicate(nums: number[]): number
{
	for (let i = 0; i < nums.length; i += 2)
		if (nums[i] !== nums[i + 1])
			return nums[i]!

	return 0
}