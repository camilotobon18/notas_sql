--1 si existe, elimine la tabla usuario
drop table if exists usuario;
--2 cree la tabla usuario con los siguientes campos:
	--nombre varchar(30)
	--clave varchar(10)
create table usuario(
	nombre varchar(30),
	clave varchar(10)
);
--3 muestre la estructura de la tabla usuario
desc usuario;
--4 información a digitar
	--("Leonardo", "Payaso")
	--("Mario Perez" ,"Marito")
	--("Marcelo", "Boca Junior")
	--("Gustavo", "Boca Junior")
insert into usuario(nombre, clave) values("Leonardo", "Payaso");
insert into usuario(nombre, clave) values("Mario Perez" ,"Marito");
insert into usuario(nombre, clave) values("Marcelo", "Boca Junior");
insert into usuario(nombre, clave) values("Gustavo", "Boca Junior");
--5 consultas
	--muestre todo el contenido de la tabla usuario
	--muestre toda la informacion de leonardo
	--muestre todos los usuarios que tienen por clave boca junior
	--muestre todos los usuarios que tiene por clave river
select * from usuario;
select * from usuario where nombre = "Leonardo";
select * from usuario where clave = "Boca Junior";
select * from usuario where clave = "River";
