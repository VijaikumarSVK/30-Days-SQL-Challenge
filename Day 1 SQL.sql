
-- You can find the question in this link
-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true


-- solution
SELECT  
round (abs(min(LAT_N ) - max(LAT_N)) +  abs(min(LONG_W) - max(LONG_W )),4)
FROM station;
