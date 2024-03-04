-- SQL Data Exploration Project on the widely known database 'Sakila'

-- 1st part: Film and inventory analysis

SELECT * FROM film;
SELECT title, release_year, length AS 'length(minutes)', rating FROM film LIMIT 30;
SELECT MAX(length) FROM film; -- this is 185 minutes
SELECT MIN(length) FROM film; -- this is 46 minutes
SELECT AVG(length) FROM film; -- this 115.27 minutes

-- Selecting only the films with a length < 60 minutes and >= 46 minutes (aka minimum)
SELECT title, release_year, length AS 'length(minutes)', rating FROM film WHERE length BETWEEN (SELECT MIN(length) FROM film)
AND 59
ORDER BY length DESC; 
-- Number of movies with a length of under an hour
SELECT COUNT(title) AS 'No. movies with a duration < 1h' FROM film WHERE length BETWEEN (SELECT MIN(length) FROM film)
AND 59; -- that is 96

-- Selecting only the films with a length between 60 minutes and 120 minutes
SELECT title, release_year, length AS 'length(minutes)', rating FROM film WHERE length BETWEEN 60 AND 120
ORDER BY length DESC;
-- Number of movies with a duration between 60-120 mins
SELECT COUNT(title) AS 'No. movies with a duration >1h and <2h' FROM film WHERE length BETWEEN 60 AND 120; -- that is 447

-- Selecting only the films with a length > 2 hours
SELECT title, release_year, length AS 'length(minutes)', rating FROM film WHERE length > 120
ORDER BY length DESC;
-- Number of movies with a duration > 2h
SELECT COUNT(title) AS 'No. movies with a duration < 1h' FROM film WHERE length > 120; -- that is 457

-- CREATING VIEWS FOR these 3 categories of movies based on their length + the total number of them (another column)

CREATE VIEW under_1h AS SELECT title, release_year, length AS 'length(minutes)', rating, (SELECT COUNT(title) FROM film 
WHERE length BETWEEN (SELECT MIN(length) FROM film)
AND 60) FROM film WHERE length BETWEEN (SELECT MIN(length) FROM film)
AND 60
ORDER BY length DESC; 
SELECT * FROM under_1h;

CREATE VIEW between_1h_and_2h AS SELECT title, release_year, length AS 'length(minutes)', rating, 
(SELECT COUNT(title) FROM film WHERE length BETWEEN 60 AND 120) AS 'No. movies with a duration of >=1h and <2h' FROM film 
WHERE length BETWEEN 60 AND 120
ORDER BY length DESC;
SELECT * FROM between_1h_and_2h;

CREATE VIEW above_2h AS SELECT title, release_year, length AS 'length(minutes)', rating, 
(SELECT COUNT(title) FROM film WHERE length > 120) AS 'No. movies with a duration > 2h'  FROM film 
WHERE length > 120
ORDER BY length DESC;
SELECT * FROM above_2h;

	-- The copy numbers of the films in the inventory
SELECT f.film_id, f.title, f.release_year, COUNT(f.title) as 'No_of_copies' FROM film as f
INNER JOIN inventory as i
ON f.film_id = i.film_id
GROUP BY f.film_id
ORDER BY No_of_copies DESC;

	-- Average rental duration of each film
SELECT film_id, title, release_year, AVG(rental_duration) AS Average_Rental_Hours FROM film
GROUP BY film_id
ORDER BY Average_Rental_Hours DESC;


-- 2nd part: Customer behavior
	--  top 10 customers who have made the most rentals
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS 'No. of rentals' FROM customer AS c
INNER JOIN rental AS r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 10;

	-- rental frequency by month and year to see trends over time
    -- SELECT DISTINCT YEAR(rental_date) FROM rental; I ran this to see how many years are there (turns out only 2005/2006)
SELECT YEAR(rental_date) AS 'Year', MONTH(rental_date) AS 'Month', COUNT(rental_id) AS 'Frequency of rentals' FROM rental
GROUP BY YEAR(rental_date), MONTH(rental_date)
ORDER BY YEAR(rental_date) ASC, MONTH(rental_date) ASC;

	--  the most popular film categories among customers in Bucuresti and Botosani (the only cities from Romania)
SELECT cat.name AS category_name, COUNT(rental.rental_id) AS rental_count -- selecting cat.name and the number of rentals from rental table
FROM category AS cat -- from category table 
JOIN film_category AS fc ON cat.category_id = fc.category_id -- connect film category to category tables by category_id first
JOIN film AS f ON fc.film_id = f.film_id -- connect film table on film_category table with film_id
JOIN inventory AS inv ON f.film_id = inv.film_id -- connect inventory table to film table by film_id
JOIN rental AS rental ON inv.inventory_id = rental.inventory_id -- connect rental table to inventory table by inventory_id
JOIN customer AS cust ON rental.customer_id = cust.customer_id -- connect customer table to rental table by customer_id
JOIN address AS addr ON cust.address_id = addr.address_id -- connect address table on customer table by address_id
JOIN city AS city ON addr.city_id = city.city_id -- connect city table on address table by city_id
WHERE city.city = 'Bucuresti' -- the where clause to set the specific city aka Bucuresti
GROUP BY cat.name -- Using GROUP BY to GROUp them by the name of the category of the film
ORDER BY rental_count DESC; -- ORDER BY to sort them descendingly

-- 3rd part: Actor analysis
	-- List all actors by the number of films they've appeared in
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS 'Number of films' FROM actor as a
JOIN  film_actor as fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(fa.film_id) DESC;

	-- all films where a particular actor has appeared
SELECT a.first_name, a.last_name, f.title FROM actor as a
INNER JOIN film_actor as fa ON a.actor_id = fa.actor_id -- connecting film_actor to actor table by actor_id
INNER JOIN film as f ON fa.film_id = f.film_id -- connecting film table to film_actor table by film_id
WHERE a.first_name = 'Warren' AND a.last_name = 'Jackman'; -- specific random actor
	
