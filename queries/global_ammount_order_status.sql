-- TODO: This query will return a table with two columns; order_status, and
-- Ammount. The first one will have the different order status classes and the
-- second one the total ammount of each.
SELECT order_status, COUNT(order_status) AS Ammount
FROM olist_orders
GROUP BY order_status

pero podría porfavor : SELECT 
    order_status,
    CAST(COUNT(*) AS INTEGER) AS Amount
FROM 
    olist_orders
GROUP BY 
    order_status
ORDER BY 
    order_status;