-- ================================================
-- DAY 1: SQL Window Functions
-- Date: March 16, 2026
-- Author: Gaurav Govind Nikam
-- ================================================

-- ROW_NUMBER: unique rank always
-- RANK: same rank for ties, skips after
-- DENSE_RANK: same rank for ties, no skipping

-- Example:
-- Values:     100, 100, 90, 80
-- ROW_NUMBER:   1,   2,  3,  4
-- RANK:         1,   1,  3,  4
-- DENSE_RANK:   1,   1,  2,  3


-- PROBLEM 1: Rank Scores (LeetCode 178)
-- No gaps in ranking = use DENSE_RANK

SELECT
  score,
  DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores
ORDER BY score DESC;


-- PROBLEM 2: Department Top 3 Salaries (LeetCode 185)
-- Top 3 unique salaries per department

WITH ranked AS (
  SELECT
    e.name AS Employee,
    d.name AS Department,
    e.salary AS Salary,
    DENSE_RANK() OVER (
      PARTITION BY e.departmentId
      ORDER BY e.salary DESC
    ) AS salary_rank
  FROM Employee e
  JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM ranked
WHERE salary_rank <= 3;
