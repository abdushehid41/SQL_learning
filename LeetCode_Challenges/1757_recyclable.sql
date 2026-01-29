-- Problem: 1757. Recyclable and Low Fat Products
-- Difficulty: Easy
# Write your MySQL query statement below
SELECT
    product_id
FROM 
    Products
WHERE low_fats ='Y' AND recyclable ='Y';