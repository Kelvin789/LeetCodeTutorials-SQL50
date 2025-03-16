-- https://leetcode.com/problems/percentage-of-users-attended-a-contest
SELECT 
    contest_id,
    ROUND((COUNT(user_id) * 100.0 / (SELECT COUNT(*) AS count FROM Users)),2) AS [percentage]
FROM Register
GROUP BY contest_id
ORDER BY [percentage] DESC, contest_id;
