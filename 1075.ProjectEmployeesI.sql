/*

Write an SQL query that reports the average experience years of all
the employees for each project, rounded to 2 digits.

Return the result table in any order.

*/

SELECT
	`Project`.project_id,
	ROUND(AVG(`Employee`.experience_years), 2) as 'average_years'
FROM `Project`
JOIN `Employee` ON `Project`.employee_id = `Employee`.employee_id
GROUP BY `Project`.project_id
