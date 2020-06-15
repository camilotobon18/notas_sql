use academico
/*subconsulta: es una instruccion SELECT anidada en otra instruccion
(SELECT, INSERT, UPDATE, DELETE) que permite recuperar datos de una tabla
con condicion hacia otra (s) tabla (s).
la subconsulta devuelve el contenido de un campo.
se debe tener en cuenta el campo comun entre las tablas.
Sintaxis:
SELECT <lista_columna(s)> FROM <tabla1> WHERE <campo_comun_tabla1>
IN (SELECT <campo_comun_tabla2> FROM <tabla2> WHERE <campo_comun_tabla2>
[IN (SELECT <campo_comun_tablaN> FROM <tablaN> WHERE <campo_comun_tablaN>)])
*/

select * from alumno
select * from nota

--cuales son las notas de Ernesto Alvarado?
select * from nota Where DocIdent In (Select DocIdent from Alumno
Where Apellidos = 'Alvarado' and Nombres = 'Ernesto')

--cuales alumnos tienen una definitiva superior a 4.5, en el periodo 1-2005
select * from alumno where docident in (select docident 
from nota where definitiva > 4.5 and Periodo = '1-2005') 

--Cuantas asignaturas habilita habilita Julian Gomez
select count(Codasig) as Cantidad_Asignaturas from nota 
where Docident in (select DocIdent from alumno where nombres='julian'
and apellidos='gomez') and definitiva between 2 and 2.94

--cuales asignaturas habilita Julian Gomez
select nombre from Asignatura where codasig in(select Codasig  from nota 
where Docident in (select DocIdent from alumno where nombres='julian'
and apellidos='gomez') and definitiva between 2 and 2.94)

/*Consulta Interna (Inner Join):
Permite recuperar registros coincidentes, respecto al campo común entre
dos o mas tablas.
Sintaxis:
SELECT <lista_columnas> FROM <tabla1> INNER JOIN <tabla2> ON 
<tabla1.campo_comun>=<tabla2.campo_comun> 
[INNER JOIN <tablaN> ON <tabla2.campo_comun>=<tablaN.campo_comun> WHERE <condicion>]
*/

select * from alumno
select * from nota
select * from Asignatura

/*Listar el codigo de asignatura, el nombre de la asignatura, periodo
y definitiva para todos los alumnos*/
select nota.codasig, nombre, periodo, definitiva from nota inner join asignatura 
on Asignatura.CodAsig = nota.CodAsig

/*listar las notas por los datos:
identificacion del alumno, apellidos, nombres, nombre de la asignatura, periodo
y definitiva para la asignatura SQL*/
select nota.DocIdent, alumno.apellidos, alumno.Nombres,
asignatura.Nombre, nota.periodo, nota.definitiva
from alumno inner join nota 
on nota.DocIdent = Alumno.DocIdent inner join Asignatura
on nota.codasig = Asignatura.CodAsig
where asignatura.nombre ='sql'

--alias
select n.DocIdent, al.apellidos, al.Nombres,
asg.Nombre, n.periodo, n.definitiva
from alumno as al inner join nota as n
on n.DocIdent = Al.DocIdent inner join Asignatura as asg
on n.codasig = Asg.CodAsig
where asg.nombre ='sql'
