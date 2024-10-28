
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

SELECT 
	E.first_name,
    E.last_name,
    count(O.order_id) as num_orders,  
    (case 
    	when O.shipped_date <= O.required_date then	"On Time"
        else "Late"
    end) as shipped   
from orders As O
left join employees AS E
on O.employee_id = E.employee_id
group by E.first_name, E.last_name, shipped
order by E.last_name, E.first_name, num_orders desc;



