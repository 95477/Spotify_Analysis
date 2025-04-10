--Creating table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
artist VARCHAR(255),
track VARCHAR (255),
album VARCHAR (255),
album_type VARCHAR(58),
danceability FLOAT,
energy FLOAT,
loudness FLOAT,
speechiness FLOAT,
acousticness FLOAT,
instrumentalness FLOAT,
liveness FLOAT,
valence FLOAT,
tempo FLOAT,
duration_min FLOAT,
title VARCHAR (255),
channel VARCHAR (255),
views FLOAT,
likes BIGINT,
comments BIGINT,
licensed BOOLEAN,
official_video BOOLEAN,
stream BIGINT,
energy_liveness FLOAT,
most_played_on VARCHAR(50)
)

--Lets take a look on dataset after fetching
SELECT
	*
FROM
	SPOTIFY;

--EDA
SELECT
	COUNT(*)
FROM
	SPOTIFY;

--No of unique artist
SELECT
	COUNT(DISTINCT ARTIST)
FROM
	SPOTIFY;

--No of unique album
SELECT
	COUNT(DISTINCT ALBUM)
FROM
	SPOTIFY;


--No of unique album TYPE
SELECT DISTINCT
	ALBUM_TYPE
FROM
	SPOTIFY;


--Maximum duration MINUTE
SELECT
	MAX(DURATION_MIN)
FROM
	SPOTIFY;

--Minimum duration MINUTE
SELECT
	MIN(DURATION_MIN)
FROM
	SPOTIFY;

--Here we are getting 0 as output so we need to analyze which song has 0 duration or something wrong is there.ABORT
SELECT
	*
FROM
	SPOTIFY
WHERE
	DURATION_MIN = 0;

--Lers delete the songs whose duration is 0
DELETE FROM SPOTIFY
WHERE
	DURATION_MIN = 0;

--lets see how many channels are there
SELECT DISTINCT
	CHANNEL
FROM
	SPOTIFY;

--Most streaming platform
SELECT DISTINCT
	most_played_on
FROM
	SPOTIFY;














