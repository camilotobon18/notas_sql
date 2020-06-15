use database;

--la elimina siempre y cuando exista, para evitar los errores en las consultas
drop table if exists usuario;

insert into usuario values("Mario", "marito");
insert into usuario(nombre, clave) values("Carlos", "Carlinho");
insert into usuario(clave, nombre) values("12345", "Juan");
insert into usuario(nombre) values("Ricardo");


select * from usuario;
select nombre, clave from usuario;

create table libro(
    titulo varchar(40),
    autor varchar(20),
    editorial varchar(15),
    precio float,
    cantidad integer
);

--"preferiblemente asi 'cita' forma"

insert into libro (titulo, autor, editorial, precio, cantidad) values ("El aleph", "Borges", "Emece", 45.50, 100);
insert into libro (titulo, autor, editorial, precio, cantidad) values ("Alicia en el pais de las maravillas", "Lewis Carroll", "Planeta", 25, 200);
insert into libro (titulo, autor, editorial, precio, cantidad) values ("Matematicas estas ahi", "Paenza", "Planeta", 15.80, 200);

select titulo, autor, editorial FROM libro

select titulo as Titulo, autor as Autor, editorial as Editorial, precio as Precio, cantidad as "Num Libros" from libro

select clave from usuario where nombre ='Mario'
select * from libro where titulo = 'El aleph'

select clave from usuario where nombre != 'Mario'


--para eliminar la tabla, la diferencia es que cuando crea la tabla con los registro el conteo comienza desde cero

--¿Si deseamos simplemente deshacernos de los datos pero no de la tabla en sí? Para esto, podemos utilizar el comando TRUNCATE TABLE.
truncate usuario;


