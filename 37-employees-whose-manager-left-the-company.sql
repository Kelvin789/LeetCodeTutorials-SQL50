-- https://leetcode.com/problems/employees-whose-manager-left-the-company
SELECT 
    Employees.employee_id
FROM Employees
LEFT JOIN (
    SELECT 
        employee_id
    FROM Employees
) AS Managers ON Employees.manager_id = Managers.employee_id
WHERE Managers.employee_id IS NULL
AND Employees.manager_id IS NOT NULL
AND Employees.salary < 30000
ORDER BY Employees.employee_id ASC
