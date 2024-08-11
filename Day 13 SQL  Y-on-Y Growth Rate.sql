
-- Question link  - https://datalemur.com/questions/yoy-growth-rate

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution


SELECT 
      *, 
      ROUND(((curr_year_spend - prev_year_spend)/ prev_year_spend)*100,2) as yoy_rate
FROM  (
      SELECT 
            year, 
            product_id,
            SUM(spend) as curr_year_spend,
            SUM(prev_year_spend) as prev_year_spend
      FROM(
            SELECT
                  *,
                  lag(spend,1) OVER(PARTITION BY product_id ORDER BY year) as prev_year_spend
            FROM(
            
                  SELECT 
                        EXTRACT(year FROM transaction_date) as year,
                        product_id,
                        spend
                  FROM user_transactions ) as tbl_1
                  ) as tbl_2 
          GROUP BY tbl_2.year, tbl_2.product_id
          ORDER BY product_id, year
) as tbl_3
;