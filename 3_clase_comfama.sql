/*INCUBE2, para certificarse. se pueden repetir los examenes*/
/*Motores de BD 
MySQL q evoluciono a MariaDB, liviano, robusto, facil de trabajar. lo compro Oracle
		aplicaciones de escritorio
		Apps (IOS, Android)
		Web, su maxima potencia esta aca
				AppServer, XamppServer, LampServer, WampServer
SQL Server, inseguro, consumo de recursos, robusto.
Postgresql, dificil conexion desde diferentes ambientes.
Oracle, exageradamente costoso, seguro, requiere maquina potente, 
se puede retroceder lo que se ha hecho, si no se ha hecho el commit.


Apache: convierte el computador en servidor
MySQL-Front, se debe tener el servidor
recomendable hacer la consulta en una copia local de la BD

SERVIDOR - BD - TABLAS - REGISTROS
*/

------------------instrucciones DDL--------------------
SHOW DATABASES;
CREATE DATABASE comfama;
SHOW TABLES;

--creacion de tablas
CREATE TABLE usuario( 
	nombre VARCHAR(100),
    clave VARCHAR(50)
);

--Estructura de la tabla
DESCRIBE usuario;
DESC usuario;

--Eliminar tabla
--no se puede eliminar una tabla hasta q no se eliminen las tablas dependientes. siempre y cuando tengamos las conexiones entre tablas
DROP TABLE usuario;

------------------instrucciones DML----------------------
INSERT INTO usuario(nombre, clave) values('Maria Garcia', 'Mary');
INSERT INTO usuario values('Diego Rodriguez', 'z8080');
INSERT INTO usuario(clave, nombre) values('Marito', 'Mario Perez');

select * from usuario 
