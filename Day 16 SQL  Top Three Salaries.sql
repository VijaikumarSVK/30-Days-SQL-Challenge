
-- Question link  - https://datalemur.com/questions/sql-top-three-salaries

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
      department_name,
      name,
      salary
FROM(
       SELECT      
            department_name,
            name,
            salary,
            DENSE_RANK()OVER(PARTITION BY department_name ORDER BY salary DESC ) as rnk
        FROM(
            SELECT
                  b.department_name,
                  a.name,
                  a.salary 
            FROM employee a
            LEFT JOIN department b
            on a.department_id = b.department_id
            ORDER BY b.department_name, a.salary DESC, a.name
        ) as tbl_1
) as tbl_1
WHERE rnk <= 3
