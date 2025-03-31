-- https://leetcode.com/problems/project-employees-i
SELECT
    Project.project_id,
    ROUND(CAST(SUM(Employee.experience_years) AS DECIMAL(18,2)) / CAST(COUNT(Employee.employee_id) AS DECIMAL(18,2)), 2) AS average_years
FROM Project
LEFT JOIN Employee ON Project.employee_id = Employee.employee_id
GROUP BY Project.project_id
