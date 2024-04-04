
-- Question link  - https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
  ROUND(
    SQRT(
      POW(
        (
          Max(lat_n) - MIN(lat_n)
        ), 
        2
      ) + POW(
        (
          Max(long_w) - MIN(long_w)
        ), 
        2
      )
    ), 
    4
  ) 
FROM 
  Station;
