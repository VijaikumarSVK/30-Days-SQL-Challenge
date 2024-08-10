
-- Question link  - https://datalemur.com/questions/sql-third-transaction

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
    user_id,
    spend,
    transaction_date
FROM 
  (SELECT * ,
          RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rnk
    FROM  transactions ) as tbl_new
WHERE rnk = 3;