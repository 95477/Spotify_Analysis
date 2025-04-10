--Advance Problems
------------------
-- 1.Find the top 3 most-viewed tracks for each artist using window functions.
-- select * from spotify;
WITH
	CTE AS (
		SELECT
			ARTIST,
			TRACK,
			SUM(VIEWS) AS TOTAL_VIEWS,
			DENSE_RANK() OVER (
				PARTITION BY
					ARTIST
				ORDER BY
					SUM(VIEWS) DESC
			) AS RANK
		FROM
			SPOTIFY
		GROUP BY
			1,
			2
		ORDER BY
			1,
			3 DESC
	)
SELECT
	ARTIST,
	TRACK,
	RANK
FROM
	CTE
WHERE
	RANK <= 3;

-- 2.Write a query to find tracks where the liveness score is above the average.
-- select * from spotify;
SELECT
	TRACK,
	SUM(LIVENESS),
	2 AS TOTAL_LIVENESS
FROM
	SPOTIFY
GROUP BY
	1
HAVING
	SUM(LIVENESS) > AVG(LIVENESS);

--ORR

SELECT track,artist,liveness
from spotify
where liveness >(select avg(liveness) from spotify);

-- 3.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album
WITH
	CTE AS (
		SELECT
			ALBUM,
			MAX(ENERGY) AS HIGHEST_ENERGY,
			MIN(ENERGY) AS LOWEST_ENERGY
		FROM
			SPOTIFY
		GROUP BY
			1
	)
SELECT
	ALBUM,
	ROUND(CAST(HIGHEST_ENERGY - LOWEST_ENERGY AS NUMERIC), 2) AS ENERGY_DIFF
FROM
	CTE
ORDER BY 2 DESC;

-- 4.Find tracks where the energy-to-liveness ratio is greater than 1.2.
select * from spotify;
select track,energy/liveness as energy_to_liveness from spotify
where energy/liveness>1.2;

--OR
SELECT
	TRACK,
	SUM(ENERGY) / SUM(LIVENESS) AS ENERGY_TO_LIVENESS
FROM
	SPOTIFY
GROUP BY
	1
HAVING
	SUM(ENERGY) / SUM(LIVENESS) > 1.2;

-- 5.Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
select track,likes,views from spotify;