-- DAY 1: Window Functions
-- Date: March 16, 2026
-- Author: Gaurav Govind Nikam

-- PROBLEM 1: Rank Scores (LeetCode 178)
-- DENSE_RANK used because no gaps allowed in ranking
SELECT
  score,
  DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores
ORDER BY score DESC;

-- PROBLEM 2: Department Top 3 Salaries (LeetCode 185)
-- Step 1: Rank salaries within each department
-- Step 2: Filter top 3 ranks only
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
