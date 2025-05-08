-- TODO: This query will return a table with two columns; State, and
-- Delivery_Difference. The first one will have the letters that identify the
-- states, and the second one the average difference between the estimate
-- delivery date and the date when the items were actually delivered to the
-- customer.
-- HINTS:
-- 1. You can use the julianday function to convert a date to a number.
-- 2. You can use the CAST function to convert a number to an integer.
-- 3. You can use the STRFTIME function to convert a order_delivered_customer_date to a string removing hours, minutes and seconds.
-- 4. order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL
SELECT oc.customer_state as State, CAST(AVG(JULIANDAY(order_estimated_delivery_date) - JULIANDAY(STRFTIME('%Y-%m-%d', order_delivered_customer_date))) AS int) as Delivery_Difference
FROM olist_orders as oo
JOIN olist_customers as oc ON oc.customer_id = oo.customer_id
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL
GROUP BY oc.customer_state
ORDER BY Delivery_Difference ASC;

