

USE SAKILA;

# EJ1 - MUESTRA UNA LISTA DE LAS PELÍCULAS Y CUÁNTOS ACTORES HAN ACTUADO EN CADA UNA. ORDENA ALFABÉTICAMENTE LA LISTA POR NOMBRE DE LA PELÍCULA.
SELECT FILM.TITLE, COUNT(ACTOR.ACTOR_ID) AS NUM_ACTORES
FROM FILM
JOIN FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
JOIN ACTOR ON FILM_ACTOR.ACTOR_ID = ACTOR.ACTOR_ID
GROUP BY FILM.TITLE
ORDER BY FILM.TITLE;

# EJ2 - ¿CUÁL ES EL CLIENTE QUE MÁS HA PAGADO DE MEDIA EN SUS ALQUILERES?
SELECT CUSTOMER.CUSTOMER_ID, AVG(PAYMENT.AMOUNT) AS PAGOMEDIO
FROM CUSTOMER
JOIN PAYMENT ON CUSTOMER.CUSTOMER_ID = PAYMENT.CUSTOMER_ID
GROUP BY CUSTOMER.CUSTOMER_ID
ORDER BY PAGOMEDIO DESC
LIMIT 1;

# EJ3 - MUESTRA CUÁNTAS COPIAS TENEMOS DE MEDIA PARA LAS PELÍCULAS AGRUPANDO POR RATING.
SELECT FILM.RATING, COUNT(INVENTORY.INVENTORY_ID), COUNT(DISTINCT FILM.FILM_ID) AS MEDIA_COPIAS
FROM FILM
JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
GROUP BY FILM.RATING;

# EJ4 - MUESTRA UNA LISTA DE LAS CATEGORÍAS Y CUÁNTAS HORAS TARDARÍAMOS EN VER TODAS LAS PELÍCULAS DE CADA CATEGORÍA.
SELECT CATEGORY.NAME, SUM(FILM.LENGTH) AS HORAS_TOTALES
FROM CATEGORY
JOIN FILM_CATEGORY ON CATEGORY.CATEGORY_ID = FILM_CATEGORY.CATEGORY_ID
JOIN FILM ON FILM_CATEGORY.FILM_ID = FILM.FILM_ID
GROUP BY CATEGORY.NAME;

# EJ5 - MUESTRA UNA LISTA DE TODOS LOS PAÍES Y CUÁNTOS CLIENTES HAY DE CADA PAÍS. ORDENA DE MAYOR A MENOR NÚMERO DE CLIENTES.
SELECT COUNTRY.COUNTRY, COUNT(CUSTOMER.CUSTOMER_ID) AS CLIENTES_X_PAIS
FROM COUNTRY
JOIN CITY ON COUNTRY.COUNTRY_ID = CITY.COUNTRY_ID
JOIN ADDRESS ON CITY.CITY_ID = ADDRESS.CITY_ID
JOIN CUSTOMER ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID
GROUP BY COUNTRY.COUNTRY
ORDER BY CLIENTES_X_PAIS DESC;