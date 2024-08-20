
-- Question link  - https://datalemur.com/questions/sql-highest-grossing

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT
      category,
      product,
      total_spend
FROM(
      SELECT 
            category,
            product,
            SUM(spend) as total_spend,
            ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend)DESC) as rnk
      FROM product_spend
      WHERE EXTRACT(YEAR FROM DATE(transaction_date)) = 2022
      GROUP BY category, product
      ORDER BY category, total_spend DESC
) AS new_tbl
WHERE rnk <= 2;



