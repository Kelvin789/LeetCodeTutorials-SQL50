-- https://leetcode.com/problems/last-person-to-fit-in-the-bus
SELECT TOP 1
    person_name
FROM (
    SELECT
        turn,
        person_id,
        person_name,
        [weight],
        SUM([weight]) OVER(ORDER BY turn) AS weight_by_turn
    FROM [Queue]
) AS QueueOnBoard
WHERE weight_by_turn <= 1000
ORDER BY weight_by_turn DESC
