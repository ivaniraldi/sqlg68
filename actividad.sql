--Me conecto a la base de datos	
CREATE DATABASE prueba1;
\l
\c prueba1

CREATE TABLE estudiantes(
    nombres varchar(50),
    notas INTEGER,
    asistencias SMALLINT
);

\dt

ALTER TABLE estudiantes ADD apellido varchar(50);

\d estudiantes

ALTER TABLE estudiantes DROP COLUMN apellido;

--verificamos que el campo apellido no existe
\d estudiantes

--insertamos datos en la tabla
INSERT INTO estudiantes (nombres, notas, asistencias) VALUES 
('Juan', 10, 1),
('Pedro', 9, 2),
('Carlos', 8, 3),
('Luis', 7, 4),
('Maria', 6, 5);

SELECT * FROM estudiantes;
--Paso 11: Ingresa 2 estudiantes sin nota.
INSERT INTO estudiantes (nombres) VALUES ('Miguel'),('Jesus');
SELECT * FROM estudiantes;

--Paso 12: Borra todos los estudiantes sin nota.
DELETE FROM estudiantes WHERE notas IS NULL;
SELECT * FROM estudiantes;

--Paso 13: Actualiza las notas del usuario con la nota más baja y cambia el valor por 10.
UPDATE estudiantes SET notas = 10 WHERE notas = (SELECT MIN(notas) FROM estudiantes);
SELECT * FROM estudiantes;

UPDATE estudiantes SET notas = 6 WHERE notas = 7;
SELECT * FROM estudiantes;

--Paso 14: Ingresa un estudiante con un nombre muy largo (mayor a 50 caracteres).¿Qué sucede?
INSERT INTO estudiantes (nombres) VALUES ('Estudiante muy largo que no se puede insertar porque el nombre tiene mas de 50 caracteres');
--ERROR:  el valor es demasiado largo para el tipo character varying(50)

SELECT * FROM estudiantes WHERE nombres = 'Pedro' AND notas = 9 OR nombres = 'Maria' AND notas = 6;

--Traer los estudiantes ordenados por notas (Menor a mayor)
SELECT * FROM estudiantes ORDER BY notas ASC;

--Traer los estudiantes ordenados por notas (Mayor a menor)
SELECT * FROM estudiantes ORDER BY notas DESC;

--Traer los estudiantes ordenados por nombres alfabeticamente ("a" a la "z")
SELECT * FROM estudiantes ORDER BY nombres ASC;

--Traer los estudiantes ordenados por nombres alfabeticamente ("z" a la "a")
SELECT * FROM estudiantes ORDER BY nombres DESC;

SELECT * FROM estudiantes LIMIT 2;
SELECT * FROM estudiantes ORDER BY nombres ASC LIMIT 2;

--Paso 15: Seleccionar todos los datos
SELECT * FROM estudiantes;

--Paso 16: Selecciona el primer y segundo nombre de la tabla utilizando la cláusula where y el nombre en específico.
SELECT * FROM estudiantes WHERE nombres='Pedro' OR nombres='Juan';

SELECT * FROM estudiantes LIMIT 2;

--Paso 18: Crea una consulta que devuelva a los 3 estudiantes con la nota más alta.
SELECT * FROM estudiantes ORDER BY notas DESC LIMIT 3;

--Paso 19: Selecciona todas las notas entre 3 y 8
SELECT notas FROM estudiantes WHERE notas >=3 AND notas <=8;

--Seleccionar los estudiantes con notas entre 3 y 8 
SELECT * FROM estudiantes WHERE notas >=3 AND notas <=8;

--Paso 20: salir de la base de datos
\q