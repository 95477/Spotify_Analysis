--Data Analysis

--Easy category
---------------
--1.Retrieve the names of all tracks that have more than 1 billion streams.
SELECT
	*
FROM
	SPOTIFY
WHERE
	STREAM > 1000000000;--385 songs
	
-- 2.List all albums along with their respective artists.
SELECT DISTINCT
	ALBUM,
	ARTIST
FROM
	SPOTIFY ORDER BY
	1;


-- 3.Get the total number of comments for tracks where licensed = TRUE.
SELECT
	COUNT(COMMENTS)
FROM
	SPOTIFY
WHERE
	LICENSED = 'true';--14059


-- 4.Find all tracks that belong to the album type single.
SELECT
	TRACK,ALBUM_TYPE
FROM
	SPOTIFY
WHERE
	ALBUM_TYPE = 'single';
	
-- 5.Count the total number of tracks by each artist.
SELECT
	ARTIST,
	COUNT(TRACK) AS NO_OF_TRACK
FROM
	SPOTIFY
GROUP BY
	ARTIST;