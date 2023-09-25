/*

There is a school that has classes of students and each class will be
having a final exam. You are given a 2D integer array 'classes',
where 'classes[i] = [pass-i, total-i]'. You know beforehand that in
the ith class, there are 'total-i' total students, but only 'pass-i'
number of students will pass the exam.

You are also given an integer 'extraStudents'. There are another
brilliant students that are guaranteed to pass the exam of any class
they are assigned to. You want to assign each of the 'extraStudents'
students to a class in a way that maximizes the average pass ratio
across all the classes.

The pass ratio of a class is equal to the number of students of the
class that will pass the exam divided by the total number of students
of the class. The average pass ratio is the sum of pass ratios of all
the classes divided by the number of the classes.

Return the maximum possible average pass ratio after assigning the
'extraStudents' students. Answers within 10^-5 of the actual answer
will be accepted.

*/

class Solution
{
	func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double
	{
		guard
			!classes.isEmpty,
			extraStudents >= 0
		else { return 0 }

		var classes = classes

		for _ in 0..<extraStudents
		{
			var profit = Double(0)
			var classId = Int(0)

			// Find a class with max ratio profit

			for (i, c) in classes.enumerated()
			{
				let thisProfit = (Double(c[0] + 1) / Double(c[1] + 1)) - (Double(c[0]) / Double(c[1]))

				guard thisProfit > profit else { continue }

				profit = thisProfit; classId = i
			}

			// Check if further improvement is possible

			guard profit > 0 else { break }

			// Add an extra student to the class with the max ratio profit

			classes[classId] = classes[classId].map { i in i + 1 }
		}

		return classes.map({ i in Double(i[0]) / Double(i[1])}).reduce(0, +) / Double(classes.count)
	}
}
