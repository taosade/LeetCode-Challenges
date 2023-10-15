/*

Write an SQL query to find for each month and country, the number of
transactions and their total amount, the number of approved
transactions and their total amount.

Return the result table in any order.

*/

SELECT
	DATE_FORMAT(`Transactions`.trans_date, '%Y-%m') AS 'month',
	`Transactions`.country,
	SUM(1) AS 'trans_count',
	SUM(IF(`Transactions`.state = 'approved', 1, 0)) AS 'approved_count',
	SUM(`Transactions`.amount) AS 'trans_total_amount',
	SUM(IF(`Transactions`.state = 'approved', Transactions.amount, 0)) AS 'approved_total_amount'
FROM `Transactions`
GROUP BY
	YEAR(`Transactions`.trans_date),
	MONTH(`Transactions`.trans_date),
	`Transactions`.country
