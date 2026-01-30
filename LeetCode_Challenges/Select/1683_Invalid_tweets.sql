/* Write your T-SQL query statement below */
-- Problem: 1683. Invalid tweets
-- Link: https://leetcode.com/problems/invalid-tweets
SELECT tweet_id 
FROM Tweets
WHERE LEN(content) > 15;
