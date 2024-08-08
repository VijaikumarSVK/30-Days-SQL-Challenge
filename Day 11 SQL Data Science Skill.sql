
-- Question link  - https://datalemur.com/questions/matching-skills

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT candidate_id
FROM candidates
WHERE skill IN('Python', 'Tableau','PostgreSQL')
GROUP BY candidate_id 
HAVING COUNT(skill) = 3
ORDER BY candidate_id;