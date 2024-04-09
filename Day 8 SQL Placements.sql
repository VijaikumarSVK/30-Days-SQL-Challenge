
-- Question link  - https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution 1
SELECT 
  T1.name 
FROM 
  (
    SELECT 
      T.id, 
      T.name, 
      T.friend_id, 
      T.own_package, 
      T.friend_package, 
      case when T.friend_package > T.own_package then 1 else 0 end as greater_salary 
    From 
      (
        SELECT 
          A.id, 
          A.name, 
          B.friend_id, 
          C.salary as own_package, 
          D.salary as friend_package 
        FROM 
          students A 
          JOIN friends B ON A.id = B.id 
          JOIN packages C ON A.id = C.id 
          JOIN packages D ON B.friend_id = D.id
      ) T
  ) T1 
WHERE 
  t1.greater_salary = 1 
ORDER BY 
  T1.friend_package;

-- Solution 2

SELECT 
  S.Name 
FROM 
  Students S 
  JOIN Friends F ON S.ID = F.ID 
  JOIN Packages SP ON S.ID = SP.ID 
  JOIN Packages FP ON F.Friend_ID = FP.ID 
WHERE 
  SP.Salary < FP.Salary 
ORDER BY 
  FP.Salary;

