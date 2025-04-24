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

SELECT f.title, MIN(return_date), MAX(return_date)
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title

-- EJERCICIO 5)
-- Como tal, esta es la solución, pero al hacerlo en el SQL Lite Browser,
-- se congela/laguea/tilda/aparece en marcha pero tarda por ser varios datos

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

-- EJERCICIO 6)

SELECT COUNT(title) AS "Cantidad de Peliculas por Tipo de Rating", rating 
FROM film
GROUP BY rating

-- EJERCICIO 7)

SELECT COUNT(title) AS "Cantidad de Peliculas por Categoria", c.name
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name

-- EJERCICIO 8)

SELECT COUNT(*) AS 'Actor Que Aparece Mas Veces', CONCAT(a.first_name, ' ', a.last_name) AS 'Nombre Completo'
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY a.first_name
ORDER BY COUNT(*) DESC
LIMIT 10;

-- EJERCICIO 9)

SELECT COUNT(i.inventory_id), a.address, ci.city, co.country
FROM inventory i
INNER JOIN store s ON s.store_id = i.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY a.address, ci.city, co.country

-- EJERCICIO 10)

SELECT a.address, ci.city, co.country, COUNT(DISTINCT i.film_id) AS 'Peliculas Distintas'
FROM inventory i
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY a.address, ci.city, co.country

-- EJERCICIO 11)

SELECT AVG(f.rental_rate), c.name
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.name
ORDER BY AVG(f.rental_rate) DESC

-- EJERCICIO 12)

SELECT f.title, (f.rental_duration * f.rental_rate) AS 'Costo Total', f.rental_duration, f.rental_rate, r.rental_date, r.return_date
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
WHERE title = 'ALABAMA DEVIL'
ORDER BY r.rental_date ASC

-- 13
SELECT f.title, c.name, f.length
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY f.length DESC

-- 14
SELECT f.title
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE f.title LIKE "W%"
GROUP BY f.title
HAVING COUNT(a.actor_id) >= 5

-- 15
SELECT SUM(p.amount) AS 'Suma Total De Los Pagos', cus.first_name, cus.last_name
FROM rental r
INNER JOIN customer cus ON cus.customer_id = r.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY cus.first_name

-- 16
SELECT f.title, f.length, a.first_name
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
ORDER BY f.length ASC

-- 17
SELECT cus.last_name, ci.city, co.country, a.address, r.rental_date, r.return_date, p.amount
FROM rental r
INNER JOIN customer cus ON cus.customer_id = r.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
INNER JOIN address a ON cus.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
ORDER BY p.amount ASC

-- 18
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES
(201, 'Diego', 'Ajata', '2025-04-24 11:03:30')

-- 19
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES
(202, 'Santiago', 'Burzolino', '2025-04-24 11:05:50'),
(203, 'Juan', 'Parrado', '2025-04-24 11:05:50')

-- 20
UPDATE actor
SET first_name = 'Luis',
    last_name = 'Spinetta'
WHERE actor_id = 201;

UPDATE actor
SET first_name = 'Rodolfo',
    last_name = 'Paéz'
WHERE actor_id = 202;

UPDATE actor
SET first_name = 'Gustavo',
    last_name = 'Cerati'
WHERE actor_id = 203;

-- 21
DELETE FROM actor
WHERE actor_id IN (201, 202, 203);