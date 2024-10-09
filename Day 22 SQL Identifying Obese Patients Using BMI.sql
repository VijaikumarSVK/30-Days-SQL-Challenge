
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select 
patient_id, weight, height,  
case
when 
	weight/power(height/100.000,2) >=30 then 1
    else 0
end as isobese
from patients