create table persona(
	idPersona int(15) AUTO_INCREMENT;
    edad int(3) unsigned,
    primary key(idPersona)
);

--UNSIGNED unicamente se utiliza en campos numericos
--Lo aproxima al numero sin signo mas cercano, en este caso 0
create table libros(
	codigo integer unsigned AUTO_INCREMENT,
    titulo varchar(50) not null,
    autor varchar(50),
    editorial varchar(25),
    precio float unsigned,
    cantidad integer unsigned,
    primary key (codigo)
);

CREATE TABLE autos(
	patente varchar(6),
    marca varchar(20),
    modelo varchar(4),
    precio float unsigned,
    primary key(patente)
);


INSERT INTO autos(patente, marca, modelo, precio) values("ACD123", "Fiat 128", '1970', 15000);
INSERT INTO autos(patente, marca, modelo, precio) values("ACG234", "Renault 11", '1990', 40000);
INSERT INTO autos(patente, marca, modelo, precio) values("BCD333", "Peugeot 505", '1990', 80000);
INSERT INTO autos(patente, marca, modelo, precio) values("GCD123", "Renault Clio", '1990', 70000);
INSERT INTO autos(patente, marca, modelo, precio) values("BCC333", "Renault Megane", '1990', 95000);
INSERT INTO autos(patente, marca, modelo, precio) values("BVF543", "Fiat 128", '1975', 20000);

--autos del año 1990
select * from autos where modelo = "1990"
--autos precio mayor a 50000
SELECT * FROM autos where precio > 50000

create table pedidos(
	numPedido int(3) AUTO_INCREMENT,
    nombre varchar(25),
    tipo varchar(25),
    precio float(2,2) unsigned,
    cantidad int(3) unsigned,
    domicilio varchar(50)
    primary key(numPedido)
);

--BLOB, tipo de dato para texto grande y enrriquecido

