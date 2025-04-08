-- https://leetcode.com/problems/second-highest-salary
/* My first solution */
-- SELECT
--     CASE
--         WHEN COUNT(Top2Salary.salary) <= 1 THEN NULL
--         ELSE MIN(Top2Salary.salary) 
--     END AS SecondHighestSalary 
-- FROM (
--     SELECT TOP 2
--         salary
--     FROM Employee
--     GROUP BY salary
--     ORDER BY salary DESC
-- ) AS Top2Salary

/* Online solution 2 */
-- SELECT
--     MAX(salary) AS SecondHighestSalary
-- FROM Employee
-- WHERE salary < (SELECT MAX(salary) FROM Employee)

/* Online solution 2 */
SELECT DISTINCT
    COALESCE(MAX(salary), NULL) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee)
