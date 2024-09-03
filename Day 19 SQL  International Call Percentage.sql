
-- Question link  - https://datalemur.com/questions/international-call-percentage

-- youtube link - https://www.youtube.com/@VijaiTheAnalyst

-- Solution

SELECT 
      ROUND(
      COUNT(*) FILTER(WHERE b.country_id != c.country_id) *100.0/
      COUNT(*),1)
      -- a.caller_id,
      -- b.country_id AS caller_country,
      -- a.receiver_id,
      -- c.country_id AS receiver_country
FROM
  phone_calls AS A
LEFT JOIN
  phone_info AS B
ON a.caller_id = b.caller_id
LEFT JOIN
  phone_info as C
on a.receiver_id = c.caller_id;



