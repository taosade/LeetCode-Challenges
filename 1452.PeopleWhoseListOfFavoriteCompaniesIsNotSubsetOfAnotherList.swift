/*

Given the array 'favoriteCompanies' where 'favoriteCompanies[i]' is
the list of favorites companies for the ith person (indexed from 0).

Return the indices of people whose list of favorite companies is not
a subset of any other list of favorites companies. You must return
the indices in increasing order.

*/

class Solution
{
	func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int]
	{
		var res = [Int]()

		for (i, companiesOuter) in favoriteCompanies.enumerated()
		{
			var isSubset = false

			for (j, companiesInner) in favoriteCompanies.enumerated()
			{
				guard i != j else { continue }

				if Set(companiesOuter).isSubset(of: Set(companiesInner))
				{
					isSubset = true;
					
					break
				}
			}

			if !isSubset { res.append(i) }
		}

		return res
	}
}
