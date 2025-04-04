-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee
SELECT
    Managers.employee_id,
    Managers.[name],
    COUNT(Employees.reports_to) AS reports_count,
    ROUND(SUM(Employees.age) * 1.0 / COUNT(Employees.reports_to), 0) AS average_age
FROM Employees AS Managers
LEFT JOIN Employees ON Managers.employee_id = Employees.reports_to
GROUP BY Managers.employee_id, Managers.[name], Managers.reports_to
HAVING COUNT(Employees.reports_to) >= 1
ORDER BY Managers.employee_id ASC
