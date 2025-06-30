SELECT * FROM netflix_db.netflix_titles;
SELECT COUNT(*) FROM netflix_db.netflix_titles;

-- Count movies vs. tv shows
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;

-- Yearly release count
SELECT release_year, COUNT(*) AS "No. of movies released"
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;

-- Content added per year
SELECT year_added, count(*) AS "Per year content added"
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added desc;

-- Featured directors
SELECT director, listed_in, COUNT(*) AS appearances
FROM netflix_titles
WHERE director IS NOT NULL AND director != 'Not Given'
GROUP BY director, listed_in
ORDER BY appearances DESC
LIMIT 10;


-- Ratings distribution
SELECT rating, COUNT(*) as "Distribution Count"
FROM netflix_titles
GROUP by rating
ORDER BY "Distribution Count" DESC;

-- Movies vs Shows per rating
SELECT type, rating, COUNT(*) AS count
FROM netflix_titles
GROUP BY type, rating;

-- Longest-running TV series:
SELECT title, duration
FROM netflix_titles
WHERE type = 'TV Show'
ORDER BY duration_int DESC
LIMIT 1;

-- Longest movie runtime
SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY duration_int DESC
LIMIT 1;

-- Average movie runtime (minutes)
SELECT avg(duration_int) as "Average Movie Run-Time"
from netflix_titles
where type = 'Movie';

-- Most common genres
select listed_in, count(*) as count
from netflix_titles
group by listed_in
order by count desc;

-- Comedy vs Other content:
SELECT
SUM(listed_in LIKE '%Comedy%') AS comedy_count,
SUM(listed_in NOT LIKE '%Comedy%') AS other_count
FROM netflix_titles;

-- Top content country
select country, count(*) as count
from netflix_titles
group by country
order by count desc;

-- Distinct directors count
select distinct director as "Unique Director"
from netflix_titles;

-- Content by release decade
SELECT CONCAT(FLOOR(release_year/10)*10, 's') AS decade, COUNT(*) AS count
FROM netflix_titles
GROUP BY decade
ORDER BY decade;

-- Annual addition growth:
SELECT year_added, COUNT(*) AS count
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added;

-- Content without a director (originals vs. licensed)
SELECT COUNT(*) AS no_director
FROM netflix_titles
WHERE director = 'Not Given';

-- TV Shows by number of seasons
SELECT duration, COUNT(*) AS count
FROM netflix_titles
WHERE type='TV Show'
GROUP BY duration
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC;

-- Highest-rated movies (MPAA):
SELECT rating, COUNT(*) AS count
FROM netflix_titles
WHERE type='Movie'
GROUP BY rating
ORDER BY count DESC;

-- Titles per 10-year release period:
SELECT FLOOR(release_year/10)*10 AS year_start, COUNT(*) AS count
FROM netflix_titles
GROUP BY year_start
ORDER BY year_start;

-- Average Wait by Type:
SELECT type, AVG(YEAR(date_added) - release_year) AS avg_delay
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY type;