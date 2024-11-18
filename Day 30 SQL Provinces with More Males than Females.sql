
-- Question link  - https://www.sql-practice.com/

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

select province_name
from(
    SELECT 
        province_name,
        sum(gender = 'M') as count_male,
        sum(gender = 'F') as count_female
    FROM patients AS P
    left join province_names AS PN 
    on P.province_id = PN.province_id
    group by province_name
)
where count_male > count_female

