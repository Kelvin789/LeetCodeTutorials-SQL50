-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports
SELECT
    e1.[name] 
FROM Employee e1
WHERE e1.id IN 
(
    SELECT 
        e2.managerId 
    FROM Employee e2
    GROUP BY e2.managerId
    Having COUNT(*) >= 5
)
