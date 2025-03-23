-- https://leetcode.com/problems/immediate-food-delivery-ii
SELECT
    ROUND(COUNT(1) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM Delivery), 2) AS immediate_percentage
FROM (
    SELECT
        customer_id AS first_order_customer_id,
        MIN(order_date) AS first_order_date,
        MIN(customer_pref_delivery_date) AS first_order_customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
) AS FirstOrders
WHERE first_order_date = first_order_customer_pref_delivery_date
