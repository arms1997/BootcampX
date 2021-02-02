SELECT day, count(*)
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day;