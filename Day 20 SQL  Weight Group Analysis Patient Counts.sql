
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution 1

select  count(tbl.weight_group) as patients_in_group, tbl.weight_group
from
(select  
	case
    	when weight >= 1 and weight <= 9 then 0
        when weight >= 10 and weight <= 19 then 10
        when weight >= 20 and weight <= 29 then 20
        when weight >= 30 and weight <= 39 then 30
        when weight >= 40 and weight <= 49 then 40
        when weight >= 50 and weight <= 59 then 50
        when weight >= 60 and weight <= 69 then 60
        when weight >= 70 and weight <= 79 then 70
        when weight >= 80 and weight <= 89 then 80
        when weight >= 90 and weight <= 99 then 90
        when weight >= 100 and weight <= 109 then 100
        when weight >= 110 and weight <= 119 then 110
        when weight >= 120 and weight <= 129 then 120
        when weight >= 130 and weight <= 139 then 130
        when weight >= 140 and weight <= 149 then 140
        when weight >= 150 and weight <= 159 then 150
	end as weight_group
from patients
) as tbl
group by tbl.weight_group
order by tbl.weight_group desc;

-- Solution 2

SELECT
  COUNT(*) AS patients_in_group,
  FLOOR(weight / 10) * 10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;
