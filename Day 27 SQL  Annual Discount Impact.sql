
-- Question link  - 

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select 
	year(o.order_date) as order_year,
    round(sum(P.unit_price*OD.quantity*OD.discount),2) As dicount_val
from orders as O
left join order_details as OD
on O.order_id = OD.order_id
left join products as P
on OD.product_id = P.product_id
group by year(O.order_date)
order by order_year desc;


