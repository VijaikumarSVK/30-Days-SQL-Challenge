
-- Question link  - https://datalemur.com/questions/top-fans-rank

-- youtube link - https://www.youtube.com/c/https:/www.youtube.com/@encodecode1

-- Solution

SELECT artist_name , artist_rnk
FROM 
      (
        SELECT 
              A.artist_name, 
              DENSE_RANK() OVER(ORDER BY COUNT(SG.song_id) DESC)as artist_rnk
        FROM 
        global_song_rank  AS GSR 
        JOIN songs as SG
        on GSR.song_id  = SG.song_id
        JOIN artists as A 
        ON SG.artist_id = A.artist_id
        WHERE GSR.rank <= 10
        GROUP BY A.artist_name
) as new_tbl
WHERE artist_rnk <=5;


