SELECT * FROM netflix_db.netflix_titles;
SELECT COUNT(*) FROM netflix_db.netflix_titles;


-- Problem 1: Count movies vs. tv shows
SELECT type, COUNT(*) AS "Total Records"
FROM netflix_titles
GROUP BY type;


-- Problem 2: Yearly release count
SELECT release_year, COUNT(*) AS "No. of movies released"
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year desc;


-- Problem 3: Content added per year
SELECT year_added, count(*) AS "Per year content added"
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added;


-- Problem 4: Top directors by title count
SELECT director, listed_in, COUNT(*) AS appearances
FROM netflix_titles
WHERE director IS NOT NULL AND director != 'Not Given'
GROUP BY director, listed_in
ORDER BY appearances DESC
LIMIT 10;


-- Problem 5: Ratings distribution
SELECT rating, COUNT(*) as counts
FROM netflix_titles
GROUP by rating
ORDER BY counts DESC;


-- Problem 6: Movies vs Shows per rating
SELECT type, rating, COUNT(*) AS count
FROM netflix_titles
WHERE rating IS NOT NULL AND rating != 'Not Given'
GROUP BY type, rating
ORDER BY type, count DESC;


-- Problem 7: Longest-running TV series:
SELECT title, duration
FROM netflix_titles
WHERE type = 'TV Show'
ORDER BY duration_int DESC
LIMIT 1;


-- Problem 8: Longest movie runtime
SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY duration_int DESC;


-- Problem 9: Average movie runtime (minutes)
SELECT avg(duration_int) as "Average Movie Run-Time"
from netflix_titles
where type = 'Movie';


-- Problem 10: Most common genres
select listed_in, count(*) as Count
from netflix_titles
group by listed_in
order by Count desc;


-- Problem 11: Comedy vs Other content:
SELECT
SUM(listed_in LIKE '%Comedy%') AS "Comedy Count",
SUM(listed_in NOT LIKE '%Comedy%') AS "Other Count"
FROM netflix_titles;


-- Problem 12: Top content country
select country, count(*) as total_content_count
from netflix_titles
group by country
order by total_content_count desc;


-- Problem 13: Distinct directors count
SELECT COUNT(DISTINCT director) AS unique_directors
FROM netflix_titles
WHERE director IS NOT NULL AND director != 'Not Given';


-- Problem 14:Content by release decade
SELECT CONCAT(FLOOR(release_year/10)*10, 's') AS decade, COUNT(*) AS count
FROM netflix_titles
GROUP BY decade
ORDER BY decade;


-- Problem 15: Annual addition growth:
SELECT year_added, COUNT(*) AS titles_added
FROM netflix_titles
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;


-- Problem 16: Content without a director
SELECT COUNT(*) AS no_director
FROM netflix_titles
WHERE director = 'Not Given';


-- Problem 17: TV Shows by number of seasons
SELECT duration, COUNT(*) AS count
FROM netflix_titles
WHERE type='TV Show'
GROUP BY duration
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED);


-- Problem 18: Highest-rated movies (MPAA):
SELECT rating, COUNT(*) AS count
FROM netflix_titles
WHERE type='Movie'
GROUP BY rating
ORDER BY count DESC;


-- Problem 19: Titles per 10-year release period:
SELECT FLOOR(release_year/10)*10 AS year_start, COUNT(*) AS count
FROM netflix_titles
GROUP BY year_start
ORDER BY year_start;


-- Problem 20: Average Wait by Type:
SELECT type, AVG(YEAR(date_added) - release_year) AS avg_delay
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY type;


-- Problem 21: Countries that have worked with the most globally diverse directors
SELECT 
    t.country,
    COUNT(DISTINCT d.director) AS unique_directors_worked_with
FROM titles t
JOIN directors d ON t.show_id = d.show_id
WHERE t.country IS NOT NULL
  AND d.director IS NOT NULL
  AND d.director != 'Not Given'
GROUP BY t.country
ORDER BY unique_directors_worked_with DESC
LIMIT 10;


-- Problem 22: Directors work across the widest range of genres
SELECT 
    d.director,
    COUNT(DISTINCT t.listed_in) AS genre_variety
FROM directors d
JOIN titles t ON d.show_id = t.show_id
WHERE d.director IS NOT NULL AND d.director != 'Not Given'
GROUP BY d.director
HAVING genre_variety > 1
ORDER BY genre_variety DESC
LIMIT 10;


-- Problem 23: What genres are most commonly shared between two countries?
SELECT 
    t1.country AS country_1,
    t2.country AS country_2,
    t1.listed_in AS shared_genre,
    COUNT(*) AS shared_count
FROM titles t1
JOIN titles t2 
  ON t1.listed_in = t2.listed_in 
 AND t1.country < t2.country
GROUP BY t1.country, t2.country, t1.listed_in
ORDER BY shared_count DESC
LIMIT 10;
