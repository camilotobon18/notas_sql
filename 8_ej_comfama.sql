
/*1- crear una tabla llamada agenda con los siguientes campos 
nombre (20)
domicilio (30)
telefono (11)
2- visualice las tablas existentes y verifique la creacion de la tabla agenda 
3- visualice la estructura de la tabla agenda 
4- ingrese la siguiente 
nombre docilimicio telefono
alberto, colon 123 - 423456
fernando, avellaneda135, 445878
5- selecione y muestre todo los registro de la tabla agenda 
6- elimine la tabla agenda si existe 
7- intente eliminara la tabla nuevamente sin especificar si existe 
8. una tienda de videos tiene los siguientes campos para almacenar sus peliculas
	nombre varchar(20)
	actor varchar(20)
	duracion integer
	cantidad_copias integer

	1-elimine la tabla si existe
	2-visualice la estructura de la tabla
	3-ingrese lo siguiente
	nombre: mision imposible
	actor: tom cruise
	duracion: 120
	cantidad: 3

	mision imposible 2
	actor: tom cruise
	duracion: 180
	cantidad: 2

	nombre: mujer bonita
	actor: julia robert
	duracion: 90
	cantidad: 3

	4-muestre todos los registros
9. hacer una consulta que muestre solamente el titulo y el actor de todas las peliculas
10. q muestre titulo y cantidad de copias
11. con la tabla agenda seleccione el registro de Fernando
12. seleccione el registro donde la direccion sea "colon 456", en caso de no existir dicha direccion cree un registro y haga la consulta
13. elimine la tabla agenda
14. un comercio que vende articulos de computacion registra los siguientes datos en la tabla articulos 
	codigo INT,
	nombre VARCHAR(20),
	descripcion VARCHAR(30)
	precio FLOAT
cree la tabla, visualice su estructura e ingrese los siguientes articulos
1, impresora, epson, 400.8
2, impresora, epson c85, 500
3, monitor, samsung, 800
4, teclado, en ingles, 100
5, teclado, en español, 90

15. seleccione todos los registros cuyo nombre sea impresora
16. muestre el codigo, descripcion y precio de los teclados
17. seleccione las peliculas cuya duracion no supere los 90
18. seleccione las peliculas donde el actor no sea Tom Cruise
19. seleccione las peliculas que tenga mas de dos copias
*/

--1.
CREATE DATABASE comfama;
CREATE TABLE agenda( 
	nombre VARCHAR(20),
    domicilio VARCHAR(30),
    telefono VARCHAR(11)
);

--2.
SHOW TABLES;
--3.
DESC agenda;
--4.
INSERT INTO agenda(nombre, domicilio, telefono) VALUES("Alberto", "Colon 123", "423456");
INSERT INTO agenda(nombre, domicilio, telefono) VALUES("Fernando", "Avellaneda 135", "445878");
--5.
SELECT * FROM agenda;
--6.
DROP TABLE IF EXISTS agenda;
--7.
DROP TABLE agenda;
--8.
CREATE TABLE pelicula(
	nombre VARCHAR(20),
    actor VARCHAR(20),
    duracion INT,
    cantidad_copias INT
);
--8.1.
DROP TABLE IF EXISTS pelicula;
--8.2.
DESC pelicula;
--8.3.
INSERT INTO pelicula(nombre, actor, duracion, cantidad_copias) VALUES("Mision imposible", "Tom Cruise", 120, 3);
INSERT INTO pelicula(nombre, actor, duracion, cantidad_copias) VALUES("Mision imposible II", "Tom Cruise", 180, 2);
INSERT INTO pelicula(nombre, actor, duracion, cantidad_copias) VALUES("Mujer Bonita", "Julia Robert", 90, 3);
--8.4.
SELECT * FROM pelicula;
--9
SELECT nombre, actor FROM pelicula;
--10
SELECT titulo, cantidad_copias FROM pelicula;
--11
SELECT * FROM `agenda` WHERE nombre = "Fernando";
--12
SELECT * FROM `agenda` WHERE domicilio = "Colon 456";
INSERT INTO agenda(nombre, domicilio, telefono) VALUES("Juan", "Colon 456", "46855");
SELECT * FROM `agenda` WHERE domicilio = "Colon 456";
--13
DROP TABLE agenda;
--14
CREATE TABLE articulo(
	codigo INT,
    nombre VARCHAR(20),
    descripcion VARCHAR(30),
    precio FLOAT
);
DESC articulo
INSERT INTO articulo(codigo, nombre, descripcion, precio) VALUES(1, "impresora", "epson", 400.8);
INSERT INTO articulo(codigo, nombre, descripcion, precio) VALUES(2, "impresora", "epson c85", 500);
INSERT INTO articulo(codigo, nombre, descripcion, precio) VALUES(3, "monitor", "samsung", 800);
INSERT INTO articulo(codigo, nombre, descripcion, precio) VALUES(4, "teclado", "en ingles", 100);
INSERT INTO articulo(codigo, nombre, descripcion, precio) VALUES(5, "teclado", "en español", 90);
--15
SELECT * FROM articulo WHERE nombre = "impresora";
--16
SELECT codigo, descripcion, precio FROM articulo WHERE nombre = "teclado";
--17
SELECT * FROM pelicula WHERE duracion <= 90;
--18.
SELECT * FROM pelicula WHERE actor != "Tom Cruise";
--19.
SELECT * FROM `pelicula` WHERE cantidad_copias > 2;
