/*

If the customer's preferred delivery date is the same as the order
date, then the order is called immediate; otherwise, it is called
scheduled.

The first order of a customer is the order with the earliest order
date that the customer made. It is guaranteed that a customer has
precisely one first order.

Write a solution to find the percentage of immediate orders in the
first orders of all customers, rounded to 2 decimal places.

*/

SELECT ROUND
(
	COUNT(IF(`Delivery`.order_date = `Delivery`.customer_pref_delivery_date, `Delivery`.delivery_id, NULL)) /
	COUNT(`Delivery`.delivery_id)
	* 100,
	2
) AS 'immediate_percentage'
FROM `Delivery`
WHERE (`Delivery`.customer_id, `Delivery`.order_date) IN
(
	SELECT `Delivery`.customer_id, MIN(`Delivery`.order_date)
	FROM `Delivery`
	GROUP BY `Delivery`.customer_id
)
