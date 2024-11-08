
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select 
	distinct A.patient_id,
    concat(A.patient_id,len(P.last_name), year(birth_date))
from  admissions as A
left join patients as P
on A.patient_id = P.patient_id


