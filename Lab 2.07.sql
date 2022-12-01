use sakila;
-- 1 -- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT 
    category.name,
    COUNT(fc.category_id) AS `Movies per Category`
FROM
    film_category AS fc
        JOIN
category ON fc.category_id = category.category_id
GROUP BY fc.category_id
ORDER BY `Movies per Category` DESC;

-- 2 -- Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, SUM(amount)
FROM staff s
INNER JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id
ORDER BY last_name ASC;

-- 3 Which actor has appeared in the most films?
 
SELECT t.actor_id, COUNT(distinct t.film_id) FROM (
SELECT f.film_id, f.title, f.release_year, fa.actor_id, a.first_name, a.last_name

from film f
left join film_actor fa ON f.film_id = fa.film_id
left join actor a ON fa.actor_id = a.actor_id
order by 1,4
) t 
Group by 1 order by 2 desc;



-- 4 Most active customer (the customer that has rented the most number of films)
SELECT cust.customer_id, count(*) as Total_Rentals
FROM rental as r
INNER JOIN customer AS cust on r.customer_id = cust.customer_id
GROUP BY cust.customer_id
ORDER BY total_rentals DESC;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT address_id, first_name, last_name, 
(SELECT staff_id FROM staff d
 WHERE e.staff_id = d.staff_id) staff
 FROM STAFF e ORDER BY staff ;
 
  -- 6 List each film and the number of actors who are listed for that film.
select film_actor, count(*) as num_film
from film
group by CELEB
order by film_actor desc;

-- 7. 
SELECT CONCAT(c.first_name,' ', c.last_name) as customer,
SUM(p.amount) as payment
FROM customer c 
JOIN payment p ON
c.customer_id = p.customer_id
Group by customer 
ORDER BY customer;