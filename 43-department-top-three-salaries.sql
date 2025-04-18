-- https://leetcode.com/problems/department-top-three-salaries/
WITH CTE AS(
    SELECT 
        Department.name AS Department,
        Employee.name AS Employee,
        Employee.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY Employee.departmentId ORDER BY Employee.salary DESC) AS highest_salary
    FROM Employee
    JOIN Department ON Employee.departmentId = Department.id
)

SELECT 
    Department,
    Employee,
    Salary
FROM CTE
WHERE highest_salary IN (1, 2, 3)
