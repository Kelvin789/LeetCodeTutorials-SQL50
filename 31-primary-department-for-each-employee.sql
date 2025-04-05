-- https://leetcode.com/problems/primary-department-for-each-employee
-- Solution 1:
-- SELECT
--     Employee.employee_id,
--     Employee.department_id
-- FROM Employee
-- LEFT JOIN (
--     SELECT
--         employee_id,
--         COUNT(employee_id) AS count
--     FROM Employee
--     GROUP BY employee_id
--     HAVING COUNT(employee_id) = 1
-- ) AS SingleDepartmentEmployee ON Employee.employee_id = SingleDepartmentEmployee.employee_id
-- WHERE Employee.primary_flag = 'Y'
--     OR SingleDepartmentEmployee.count = 1

-- Solution 2:
SELECT 
    employee_id, 
    department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT 
    employee_id,
    MAX(department_id)
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1
