use academico
select * from nota 
select * from Asignatura
select * from Alumno
select * from AsignatXProfesor

--4.  Los datos de los alumnos que pueden habilitar
select * from alumno where DocIdent in (select DocIdent from nota 
where definitiva between 2 and 2.94)

--5.  Los datos de los alumnos que perdieron, al menos, una asignatura
select * from alumno where DocIdent in (select DocIdent from nota 
where definitiva < 2.95)

--6.  Los datos de los alumnos que ganaron SQL
select * from alumno where DocIdent in (select DocIdent from nota 
where CodAsig in (select CodAsig from Asignatura where nombre = 'sql') and definitiva >= 3)

--7.  Las asignaturas que se pueden habilitar
select * from asignatura where CodAsig in (select CodAsig from nota
where definitiva between 2 and 2.94)

--8.  Las notas del alumno Felipe Sanchez, solo para SQL
select * from nota where DocIdent in (select Docident from alumno 
where CodAsig in (select CodAsig from Asignatura where nombre = 'sql') 
and (nombres ='Felipe' and apellidos = 'sanchez'))

--9.  Los datos de los alumnos que tienen un 5.0 en Visual Basic
select * from alumno where DocIdent in (select DocIdent from nota
where CodAsig in (select CodAsig from Asignatura where nombre = 'lenguaje de programación')
and definitiva = 5)

--10.  Los alumnos cuyo promedio supera el promedio de Visual Basic
select * from alumno where DocIdent in (select DocIdent from nota 
where CodAsig in (select CodAsig from Asignatura where nombre = 'lenguaje de programación')
and avg(definitiva)>4)



