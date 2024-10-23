
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution


select 
	P.patient_id,
	P.first_name,
    P.last_name,
    D.specialty
from patients as P
left join admissions As A
on P.patient_id = A.patient_id
left join doctors as D
on A.attending_doctor_id = D.doctor_id
where
A.diagnosis = 'Epilepsy' and
D.first_name = 'Lisa';
