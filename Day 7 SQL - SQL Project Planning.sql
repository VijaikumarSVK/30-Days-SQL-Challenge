
-- Question link  - https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  T1.start_date c1, 
  MIN(T2.end_date) c2 
FROM 
  projects T1 
  JOIN projects T2 on T1.start_date NOT IN (
    SELECT 
      end_date 
    FROM 
      projects
  ) 
  and T2.end_date NOT IN (
    SELECT 
      start_date 
    FROM 
      projects
  ) 
  and T1.start_date < T2.end_date 
GROUP BY 
  T1.start_date 
ORDER BY 
  DATEDIFF(c2, c1), 
  c1;


