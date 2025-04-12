-- https://leetcode.com/problems/count-salary-categories
-- Solution 1:
SELECT
    'Low Salary' AS category,
    COUNT(1) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION
SELECT
    'Average Salary' AS category,
    COUNT(1) AS avgerage_salary_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
UNION
SELECT
    'High Salary' AS category,
    COUNT(1) AS high_salary_count
FROM Accounts
WHERE income > 50000
