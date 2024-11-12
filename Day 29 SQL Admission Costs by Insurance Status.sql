
-- Question link  - https://www.sql-practice.com/ 

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select
	insurace_group,
    sum(admission_cost) as total
from
(
    select
    patient_id,
    case when patient_id % 2 = 0 then 'Yes' else 'No' end as insurace_group,
    case when patient_id % 2 = 0 then 10 else 50 end as admission_cost
    from admissions
)
group by insurace_group
