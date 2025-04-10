-- Medium Level
---------------
-- 1. Calculate the average danceability of tracks in each album.
SELECT
	ALBUM,
	AVG (DANCEABILITY) as Avg_dancebility
FROM
	SPOTIFY
GROUP BY
	1
ORDER BY
	2 DESC;
	
-- 2. Find the top 5 tracks with the highest energy values.
SELECT
	TRACK,
	SUM(ENERGY)
FROM
	SPOTIFY
GROUP BY
	1
ORDER BY
	2 DESC
LIMIT
	5;

-- 3. List all tracks along with their views and likes where official_video = TRUE.
SELECT
	TRACK,
	VIEWS,
	LIKES
FROM
	SPOTIFY
WHERE
	OFFICIAL_VIDEO= TRUE;


-- 4. For each album, calculate the total views of all associated tracks.

SELECT
	ALBUM,
	TRACK,
	SUM(VIEWS) AS TOTAL_VIEWS
FROM
	SPOTIFY GROUP BY
	1,
	2
ORDER BY 3 DESC;

-- 5. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * FROM(SELECT 
    TRACK,
    COALESCE(
        SUM(
            CASE
                WHEN MOST_PLAYED_ON = 'Youtube' THEN STREAM
                ELSE 0
            END
        ), 
        0
    ) AS STREAM_ON_YOUTUBE,
    COALESCE(
        SUM(
            CASE
                WHEN MOST_PLAYED_ON = 'Spotify' THEN STREAM
                ELSE 0
            END
        ), 
        0
    ) AS STREAM_ON_SPOTIFY
FROM 
    SPOTIFY
GROUP BY 
    TRACK
	) as t1
where STREAM_ON_SPOTIFY>STREAM_ON_YOUTUBE
and STREAM_ON_YOUTUBE<>0;

