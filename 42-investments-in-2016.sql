-- https://leetcode.com/problems/investments-in-2016
WITH CTE AS(
    SELECT 
        pid,
        tiv_2015,
        tiv_2016,
        COUNT(pid) OVER (PARTITION BY tiv_2015) AS tv_count,
        COUNT(pid) OVER (PARTITION BY lat, lon) AS l_count
    FROM Insurance
)

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM CTE
WHERE tv_count > 1
AND l_count < 2
