-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends
SELECT TOP 1
    id,
    COUNT(*) AS num
FROM (
    SELECT
        requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT
        accepter_id AS id
    FROM RequestAccepted
) AS Query
GROUP BY id
ORDER BY num DESC
