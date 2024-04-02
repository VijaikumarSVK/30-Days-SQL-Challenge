SELECT 
  A.hacker_id, 
  B.name 
FROM 
  Submissions AS A 
  INNER JOIN hackers as B on A.hacker_id = B.hacker_id 
  INNER JOIN Challenges AS C on A.challenge_id = C.challenge_id 
  INNER JOIN Difficulty AS D on C.difficulty_level = D.difficulty_level 
WHERE 
  A.score = D.score 
GROUP BY 
  A.hacker_id, 
  B.name 
HAVING 
  COUNT(*)> 1 
ORDER BY 
  COUNT(*) DESC, 
  A.hacker_id;
