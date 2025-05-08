-- TODO: This query will return a table with two columns; customer_state, and 
-- Revenue. The first one will have the letters that identify the top 10 states 
-- with most revenue and the second one the total revenue of each.
-- HINT: All orders should have a delivered status and the actual delivery date 
-- should be not null.
SELECT customer_state, SUM(P.payment_value) AS Revenue
FROM olist_customers AS C, olist_orders AS O, olist_order_payments AS P 
WHERE C.customer_id = O.customer_id AND
O.order_id = P.order_id AND
O.order_status = 'delivered' AND
O.order_delivered_customer_date IS NOT NULL
GROUP BY customer_state 
ORDER BY Revenue DESC LIMIT 10