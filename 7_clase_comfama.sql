--la clave primaria con autoincremento. si se registro uno manual, el continua a partir de ese consecutivo
/*	1000 papitas
	2000 chiclets //se ingreso manual el consecutivo
					cheetos, el sistema le asigna el 2001
*/

/*si se borra toda la informacion de la tabla, el nuevo registro lo ingresa 
con el consecutivo en el que iba, para poder resetear el autoincremental se debe 
hacer un truncate */

--no se debe eliminar, sino cambiar el estado a deshabilitado, campo control

update usuario set nombre = "Mario" where clave = 1010;

CREATE TABLE persona(
	nombre varchar(40),
	clave varchar(40),
	estado_persona boolean,
	primary key(nombre)
);

/*cuando un campo se define como autoincremental, este se debe definir como clave primaria. de lo contrario no permite crear la tabla */
CREATE TABLE persona(
	codigo int AUTO_INCREMENT,
	nombre varchar(40),
	clave varchar(40),
	estado_persona boolean,
	primary key(codigo)
);

--clave primaria compuesta, dos campos como clave primaria

create table LIBRO(
    idLibro int(10) AUTO_INCREMENT,
    titulo varchar(50) not null,
    autor varchar(50) not null,
    editorial varchar(15),
    precio float,
    cantidad integer,
    PRIMARY KEY(idLibro)
);

INSERT INTO libro(titulo, autor) values('100 años de soledad', "Gabo");

--Traer nulos 
select * from libro where autor is null

--traer los q no son nulos
select * from libro where autor is not null

--traer los que tienen vacio
select * from libro where autor = ""


--unsigned, lo lleva al valor positivo mas cercano, en este caso 0
create table persona
(
	idPersona 	int(15) AUTO_INCREMENT,
    nombre		varchar(100) not null,
    edad 		int(3) unsigned,
    PRIMARY KEY(idPersona)
)

insert into persona(nombre, edad) values("camilo", 35);
insert into persona(nombre, edad) values("Andres", -28);
