USE WORLD;

# EJ1 - MUESTRA UN LISTADO DE LOS CONTINENTES DEL MUNDO Y SU SUPERFICIE TOTAL
SELECT 
CONTINENT,SUM(SURFACEAREA) 
FROM COUNTRY 
GROUP BY CONTINENT
;

# EJ2 - MUESTRA UN LISTADO DE LOS PAÍSES DE ÁFRICA, ASIA O AMÉRICA CON UNA POBLACIÓN DE MENOS DE 1 MILLÓN DE HABITANTES
SELECT 
NAME,POPULATION 
FROM COUNTRY 
WHERE CONTINENT IN ("AFRICA","ASIA","%AMERICA%") 
AND POPULATION <1000000
;

# EJ3 - MUESTRA LA ESPERANZA DE VIDA MEDIA AGRUPANDO POR FORMA DE GOBIERNO. ORDENA DE MAYOR A MENOR ESPERANZA DE VIDA MEDIA.
SELECT 
AVG(LIFEEXPECTANCY),GOVERNMENTFORM AS LIVEXGOV 
FROM COUNTRY 
GROUP BY GOVERNMENTFORM 
ORDER BY LIVEXGOV DESC
;

# EJ4 - MUESTRA LAS DISTINTAS FORMAS DE GOBIERNO QUE HAY EN EUROPA Y CUÁNTOS PAÍSES USAN CADA UNA.
SELECT 
GOVERNMENTFORM,COUNT(NAME) 
FROM COUNTRY 
WHERE CONTINENT 
IN ("EUROPE") 
GROUP BY GOVERNMENTFORM 
;

# EJ5 - MUESTRA UNA LISTA CON LOS 5 JEFES DE ESTADO QUE LO SON DE MÁS PAÍSES (DEBE APARECER EL NOMBRE DEL JEFE DE ESTADO Y DE CUÁNTOS PAÍSES LO ES)
SELECT 
HEADOFSTATE,COUNT(NAME) 
AS MEDIA 
FROM COUNTRY 
GROUP BY HEADOFSTATE  
ORDER BY MEDIA 
DESC LIMIT 5
;
