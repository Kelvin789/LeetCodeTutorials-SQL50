-- https://leetcode.com/problems/product-sales-analysis-iii
SELECT DISTINCT
    Sales.product_id,
    Sales.year AS first_year,
    Sales.quantity AS quantity,
    Sales.price AS price
FROM Sales
INNER JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS FirstSale ON Sales.product_id = FirstSale.product_id 
               AND Sales.year = FirstSale.first_year
