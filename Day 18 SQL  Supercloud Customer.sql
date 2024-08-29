
-- Question link  - https://datalemur.com/questions/supercloud-customer

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

SELECT 
        customer_id
FROM 
        customer_contracts AS CC
JOIN 
        products as P
ON CC.product_id = P.product_id
GROUP BY
        customer_id
HAVING 
        COUNT(DISTINCT product_category)=
        (SELECT COUNT(DISTINCT product_category) FROM products);



