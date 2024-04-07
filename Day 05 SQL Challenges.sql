
-- Question link  - https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  T2.h_id, 
  T2.name, 
  T2.cnt 
FROM 
  (
    SELECT 
      T1.h_id as h_id, 
      T1.name as name, 
      t1.cnt as cnt, 
      COUNT(T1.h_id) OVER(PARTITION BY T1.cnt) as occurance, 
      MAX(cnt) OVER() as max_num 
    FROM 
      (
        SELECT 
          H.hacker_id as h_id, 
          H.name as name, 
          COUNT(C.challenge_id) as cnt 
        FROM 
          hackers H 
          INNER JOIN challenges C ON H.hacker_id = C.hacker_id 
        GROUP BY 
          h_id, 
          name
      ) T1
  ) T2 
WHERE 
  T2.occurance = 1 
  or T2.cnt = T2.max_num 
ORDER BY 
  T2.cnt desc, 
  t2.h_id;

