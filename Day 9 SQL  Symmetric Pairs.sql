
-- Question link  - https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  DISTINCT T1.x, 
  T1.y 
FROM 
  (
    SELECT 
      *, 
      ROW_NUMBER() over(
        order by 
          x
      ) as r_num 
    FROM 
      functions
  ) T1 
  INNER JOIN (
    SELECT 
      *, 
      ROW_NUMBER() over(
        order by 
          x
      ) as r_num 
    FROM 
      functions
  ) T2 on T1.x = T2.y 
  and T2.x = T1.y 
  and T1.r_num != T2.r_num 
  and T1.x <= T1.y 
ORDER BY 
  T1.x;
