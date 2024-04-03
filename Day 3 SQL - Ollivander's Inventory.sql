
-- Question link  - https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  id, 
  age, 
  coins_needed, 
  power 
FROM 
  (
    SELECT 
      A.id, 
      B.age, 
      A.coins_needed, 
      A.power, 
      ROW_NUMBER() OVER (
        PARTITION BY B.age, 
        A.power 
        ORDER BY 
          A.coins_needed
      ) as r_num 
    FROM 
      Wands AS A 
      LEFT JOIN wands_property AS B on A.code = B.code 
    WHERE 
      B.is_evil = 0
  ) AS T 
WHERE 
  r_num = 1 
ORDER BY 
  power DESC, 
  age DESC;



