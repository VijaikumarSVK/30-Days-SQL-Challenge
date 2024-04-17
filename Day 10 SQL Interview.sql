
-- Question link  - https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  CN.contest_id, 
  CN.hacker_id, 
  CN.name, 
  SUM(SS.TSUB), 
  SUM(SS.TASUB), 
  SUM(VS.TV), 
  SUM(VS.TUV) 
FROM 
  contests CN 
  JOIN colleges CL on CN.contest_id = CL.contest_id 
  JOIN challenges CH on CH.college_id = CL.college_id 
  LEFT JOIN (
    SELECT 
      challenge_id as challenge_id, 
      SUM(total_views) as TV, 
      SUM(total_unique_views) as TUV 
    FROM 
      view_stats 
    GROUP BY 
      challenge_id
  ) VS on CH.challenge_id = VS.challenge_id 
  LEFT JOIN (
    SELECT 
      challenge_id as challenge_id, 
      SUM(total_submissions) as TSUB, 
      SUM(total_accepted_submissions) as TASUB 
    FROM 
      submission_stats 
    GROUP BY 
      challenge_id
  ) SS on CH.challenge_id = SS.challenge_id 
GROUP BY 
  CN.contest_id, 
  CN.hacker_id, 
  CN.name 
HAVING 
  ISNULL(
    SUM(SS.TSUB), 
    0
  )+ ISNULL(
    SUM(SS.TASUB), 
    0
  )+ ISNULL(
    SUM(VS.TV), 
    0
  )+ ISNULL(
    SUM(VS.TUV), 
    0
  ) <> 0 
ORDER BY 
  CN.contest_id;


