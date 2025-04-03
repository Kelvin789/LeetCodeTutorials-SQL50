-- https://leetcode.com/problems/group-sold-products-by-the-date
SELECT
    sell_date,
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (SELECT DISTINCT * FROM Activities) AS Activities
GROUP BY sell_date
ORDER BY sell_date
