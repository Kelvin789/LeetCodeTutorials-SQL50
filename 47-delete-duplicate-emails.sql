-- https://leetcode.com/problems/delete-duplicate-emails
DELETE FROM Person
WHERE id NOT IN (
    SELECT 
        MIN(id)
    FROM Person
    GROUP BY email
)
