-- https://leetcode.com/problems/average-time-of-process-per-machine
SELECT
    starting.machine_id,
    ROUND(AVG(finishing.timestamp - starting.timestamp), 3) AS processing_time
FROM Activity AS starting
INNER JOIN Activity AS finishing ON starting.machine_id = finishing.machine_id
    AND starting.process_id = finishing.process_id
    AND starting.activity_type = 'start'
    AND finishing.activity_type = 'end'
GROUP BY starting.machine_id
