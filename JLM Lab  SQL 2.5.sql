 -- LAB SQL 2.5
 USE sakila;
 
 SELECT *
 FROM account
 limit and desc to max;
 
 SELECT DISTINCT FROM 
-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT first_name
FROM sakila.actor
WHERE first_Name LIKE '%carlett';

-- 2. How many physical copies of movies are available for rent in the store's inventory? 
--  checked rental date and return_date to know if they are not at the store today. But all dates are old. So,

SELECT COUNT(inventory_id) AS Total_movies_available
FROM sakila.inventory;

-- How many unique movie titles are available?
SELECT COUNT(DISTINCT inventory_id) AS total_unique_inventory
FROM sakila.inventory;

-- 3. What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.

SELECT MIN(length) AS shortest_duration, MAX(length) AS longest_duration
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT (AVG(length)/60), 'Hours' AS Average_duration
FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(distinct last_name) AS Amount_of_different_last_name_actors
FROM sakila.actor;

-- 6. How many days was the company operating? 
-- Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT rental_date
FROM sakila.rental
ORDER BY rental_date DESC;

-- 2006-02-2014 at 15:16:03  was the last rental date. 
-- Replacing "DESC" to "ASC" we will obtein in the first line 
-- the first rental date. 2005-05-24 at 22:53:30

 -- There is not mandatory type the hour. 
SELECT DATEDIFF('2006-02-20 15:16:03', '2005-05-24 15:16:03') AS day_difference
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(last_update,'%m') AS 'month', date_format(last_update,'%d') AS 'day' FROM sakila.rental LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.

SELECT *,
CASE
WHEN (date_format(rental_date,'%W') = 'Saturday') or (date_format(rental_date,'%W') = 'Sunday')
THEN 'Weekend' 
ELSE 'Weekday' 
END AS day_type 
FROM sakila.rental;

-- 9. Get release years.
SELECT DISTINCT release_year AS all_release_years
FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title AS All_films_with_ARMAGEDDON_in_the_title
FROM  sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT title AS All_films_which_title_ends_with_APOLLO
FROM  sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
-- the longest top 10 has 185 minutes. I displayed until that value change to provide value to the answer. 
-- Maybe would be great having 10 different values to create the top 10.

SELECT length, title
FROM film
ORDER BY length DESC
LIMIT 11;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(distinct special_features) AS Number_of_films_include_Behind_the_scenes
FROM  sakila.film
WHERE special_features LIKE '%Behind_the_Scenes';

-- THANKS! :)
