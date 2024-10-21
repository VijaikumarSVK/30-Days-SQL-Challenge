
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select * from 
patients
where 
first_name like '__r%' and
gender = 'F' and 
month(birth_date) in (2,5,12) and 
weight between 60 and 80 and
patient_id % 2 = 1 and 
city = 'Kingston'
;

