
-- Question link  - https://datalemur.com/questions/pizzas-topping-cost

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution


SELECT 
CONCAT(A.topping_name,',',B.topping_name,',',C.topping_name) AS pizza,
A.ingredient_cost + B.ingredient_cost + C.ingredient_cost AS total_cost
FROM pizza_toppings AS A 
INNER JOIN pizza_toppings AS B
ON A.topping_name < B.topping_name
INNER JOIN pizza_toppings AS C
ON B.topping_name < C.topping_name
ORDER BY total_cost  DESC, pizza
;



