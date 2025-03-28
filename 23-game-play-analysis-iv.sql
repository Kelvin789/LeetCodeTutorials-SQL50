-- https://leetcode.com/problems/game-play-analysis-iv
SELECT
    ROUND(
        COUNT(DISTINCT FirstLogin.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity)
    , 2) AS fraction
FROM (
    SELECT 
        player_id, 
        MIN(event_date) AS login_date
    FROM Activity
    GROUP BY player_id
) AS FirstLogin
INNER JOIN Activity AS SecondLogin ON FirstLogin.player_id = SecondLogin.player_id
                                   AND DATEDIFF(DAY, FirstLogin.login_date, SecondLogin.event_date) = 1
