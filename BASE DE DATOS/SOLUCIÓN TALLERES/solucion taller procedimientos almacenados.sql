use Academico
--Crear procedimientos almacenados para:
--1. Listar los alumnos que perdieron SQL
create procedure sp_perdieronsqlcat
as
select * from alumno inner join nota on alumno.DocIdent=nota.DocIdent 
inner join asignatura on nota.codasig=asignatura.codasig where nombre='sql' and  definitiva < 3
 
execute sp_perdieronsqlcat

--2. Listar los alumnos que perdieron, al menos, una asignatura.
create procedure sp_perdieroncat
as 
select * from Alumno inner join nota on Alumno.DocIdent=nota.DocIdent
where definitiva < 3

execute sp_perdieroncat

/*3. Retornar e imprimir la cantidad de alumnos que perdieron cualquier asignatura,
indicando el código de la asignatura*/
create procedure sp_cantidadperdieron
@codasig nvarchar (3),
@cantidad real output
as 
select count(CodAsig), codasig from nota group by codasig having  Definitiva < 3 

4. Retornar e imprimir la cantidad que pueden habilitar cualquier asignatura, indicando el
nombre de la asignatura.
5. Devolver e imprimir los nombres y apellidos de los alumnos que tienen la mejor nota
en cualquier asignatura, indicando el nombre de ésta.
6. Mostrar la cantidad de alumnos de cualquier programa, indicando el nombre del
programa.
7. Listar los alumnos que pueden habilitar, por los datos: Apellidos, Nombres, Nombre de
la asignatura y definitiva.
8. Listar las notas de cualquier alumno, por los datos: Apellidos, Nombres, Nombre de la
asignatura y definitiva.
9. Retornar e imprimir el promedio de los alumnos de cualquier asignatura, indicando el
nombre de la asignatura.
10. Devolver e imprimir la cantidad de asignaturas que debe habilitar un alumno
cualquiera, indicando su identificación. Se debe verificar que la cantidad de
asignaturas no supere a 2.
11. Agregar un nuevo programa
12. Cambiar la definitiva de cualquier alumno, indicando el código, en cualquier
asignatura, indicando el nombre de la asignatura.
13. Eliminar cualquier programa, indicando el nombre del programa (se sugiere el
programa anexado en el numeral 11.)