-- https://leetcode.com/problems/find-users-with-valid-e-mails
SELECT
    user_id,
    [name],
    mail
FROM Users 
WHERE mail LIKE '[a-zA-Z]%@leetcode.com' 
    AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'
