-- EJERCICIO 1)

SELECT f.title, return_date, address, country, city
FROM rental r
INNER JOIN staff s ON r.staff_id = s.staff_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL

-- eso selecciona todas las peliculas que cumplan esas caracteristicas
-- pero si me dice a elegir solamente agrego esto, seleccionara la pelicula de id 1:
-- WHERE r.return_date IS NULL AND f.title LIKE "%ISH%"

-- EJERCICIO 2)

SELECT f.title, c.name, l.name, f.rating, f.length
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN language l ON l.language_id = f.language_id
WHERE length >= 60 AND length <= 120

-- EJERCICIO 3)

SELECT first_name, last_name, address, city, country
FROM staff s
INNER JOIN address a ON a.address_id = s.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id

-- EJERCICIO 4)

SELECT f.title, MIN(rental_date), MAX(rental_date)
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title

-- EJERCICIO 5)

SELECT * 
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN language l ON l.language_id = f.language_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor ac ON ac.actor_id = fa.actor_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film_text ft ON ft.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN store sto ON sto.store_id = i.store_id
INNER JOIN staff sta ON r.staff_id = sta.staff_id
INNER JOIN payment p ON p.staff_id = sta.staff_id
INNER JOIN address a ON sta.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
INNER JOIN customer cus ON cus.customer_id = r.customer_id




