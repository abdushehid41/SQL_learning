/* Write your T-SQL query statement below */
SELECT 
    name,
    bonus
FROM 
    Employee AS e
LEFT JOIN Bonus AS b
ON e.empId = b.empId
WHERE 
    bonus < 1000 OR bonus IS NULL;