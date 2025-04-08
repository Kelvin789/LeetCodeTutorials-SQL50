-- https://leetcode.com/problems/list-the-products-ordered-in-a-period
SELECT
    Products.product_name, 
    SUM(Orders.unit) AS unit
FROM Products
LEFT JOIN Orders ON Products.product_id = Orders.product_id
                 AND order_date LIKE '2020-02-%'
GROUP BY Products.product_name
HAVING SUM(Orders.unit) >= 100
