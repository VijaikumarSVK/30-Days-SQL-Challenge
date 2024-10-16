
-- Question link  - https://datalemur.com/questions/sql-department-company-salary-comparison

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

SELECT 
  DISTINCT E.department_id,
  to_char(S.payment_date,'MM-YYYY') as payment_date,
  CASE
    WHEN AVG(S.amount) OVER(PARTITION BY E.department_id) < AVG(S.amount)OVER() THEN 'lower'
    WHEN AVG(S.amount) OVER(PARTITION BY E.department_id) > AVG(S.amount)OVER() THEN 'higher'
    WHEN AVG(S.amount) OVER(PARTITION BY E.department_id) = AVG(S.amount)OVER() THEN 'same'
  END as comparision
FROM employee as E
JOIN salary as S
ON E.employee_id = S.employee_id
WHERE S.payment_date BETWEEN '03/01/2024' and '03/31/2024';

