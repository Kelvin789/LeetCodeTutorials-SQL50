-- https://leetcode.com/problems/confirmation-rate
SELECT
    Signups.user_id AS user_id,
    CASE
        WHEN ISNULL(ConfirmedCount.confirmed_count, 0) = 0
            THEN 0.00
        ELSE 
            ROUND(
                CAST(ISNULL(ConfirmedCount.confirmed_count, 0) AS DECIMAL(16,2)) / 
                CAST(ISNULL(TotalMessageCount.message_count, 0) AS DECIMAL(16,2))
            , 2)
    END AS confirmation_rate 
FROM Signups
LEFT JOIN (
    SELECT
        Confirmations.user_id AS user_id,
        COUNT(*) AS confirmed_count
    FROM Confirmations
    WHERE Confirmations.[action] = 'confirmed'
    GROUP BY Confirmations.user_id
) AS ConfirmedCount ON Signups.user_id = ConfirmedCount.user_id
LEFT JOIN (
    SELECT 
        Signups.user_id,
        COUNT(Confirmations.user_id) AS message_count
    FROM Signups 
    LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
    GROUP BY Signups.user_id
) AS TotalMessageCount ON Signups.user_id = TotalMessageCount.user_id
