
-- Question link  - https://datalemur.com/questions/histogram-users-purchases

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT 
      transaction_date,
      user_id,
      prod_count
FROM(

    SELECT 
          transaction_date, 
          user_id, 
          COUNT(product_id) as prod_count,
          RANK()OVER(PARTITION BY user_id ORDER BY transaction_date DESC) as rnk
    FROM user_transactions
    GROUP BY user_id, transaction_date 
    ) as new__tbl
WHERE rnk =1
ORDER BY transaction_date, user_id;