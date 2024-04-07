
-- Question link  - https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  T1.h_id, 
  T1.name, 
  sum(T1.score) as score 
FROM 
  (
    SELECT 
      S.hacker_id as h_id, 
      H.name as name, 
      S.score as score, 
      ROW_NUMBER() OVER(
        PARTITION BY S.hacker_id, 
        S.challenge_id 
        order by 
          S.score desc
      ) as r_num 
    FROM 
      submissions S 
      INNER JOIN hackers H ON S.hacker_id = H.hacker_id
  ) T1 
WHERE 
  T1.r_num = 1 
  AND score <> 0 
GROUP BY 
  T1.h_id, 
  T1.name 
ORDER BY 
  score desc, 
  h_id;

