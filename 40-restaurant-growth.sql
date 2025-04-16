-- https://leetcode.com/problems/restaurant-growth
SELECT
    c1.visited_on,
    SUM(c2.amount) AS amount,
    ROUND(SUM(c2.amount + 0.00) / 7, 2) AS average_amount
FROM (
    SELECT DISTINCT
        visited_on
    FROM Customer
) AS c1
INNER JOIN Customer AS c2 ON c2.visited_on <= c1.visited_on 
                          AND c2.visited_on > DATEADD(DAY, -7, c1.visited_on)
GROUP BY c1.visited_on
HAVING COUNT(DISTINCT c2.visited_on) = 7
ORDER BY c1.visited_on
