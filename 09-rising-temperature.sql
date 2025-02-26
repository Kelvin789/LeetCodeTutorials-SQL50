-- https://leetcode.com/problems/rising-temperature
SELECT 
    today.id
FROM Weather AS today
INNER JOIN Weather AS yesterday ON today.recordDate = DATEADD(day, 1, yesterday.recordDate)
WHERE today.temperature > yesterday.temperature
