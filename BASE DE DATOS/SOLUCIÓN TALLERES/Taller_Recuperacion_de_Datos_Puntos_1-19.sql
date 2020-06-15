use academico
select * from Alumno 
--Listar: --
/*1. Los datos de los alumnos por Identificaci�n, Apellidos, Nombres y Valor cuota, 
solo si la cuota est� entre 55000 y 70000.*/
select docident as Identificaci�n, Apellidos, Nombres, VlrCuota as "Valor Cuota" from alumno
where Vlrcuota >=55000 and vlrcuota <=70000

/*2. Las notas de los alumnos que pueden habilitar, teniendo en cuenta 
que habilitan los que hayan tenido una nota definitiva entre 2.0 y 2.9.*/
select DocIdent as Identificaci�n, NotaPeriodo1, NotaPeriodo2, NotaPeriodo3, NotaPeriodo4, 
Definitiva as "Nota Definitiva" from Nota where Definitiva >=2 and Definitiva <= 2.9 

select Alumno.Nombres, Alumno.Apellidos, Nota.definitiva from
Alumno, Nota where Alumno.DocIdent = Nota.DocIdent and (Definitiva >=2 and Definitiva <= 2.9)

/*3.Los alumnos que no tengan Tel�fono*/
select * from alumno where Telefono is null

/*4. Los alumnos que sean mayores de edad.*/
select * from alumno where year (getdate())- year (fechanacim) >= 18

/*5. Los alumnos que sean mayores de edad, tengan una cuota superior a 55000 y 
sean de la ciudad de Medell�n.*/
select * from Alumno where year (getdate())- year (fechanacim) >= 18
and VlrCuota > 55000 and Ciudad = 'Medellin'

/*6. Los alumnos que sean mujeres mayores de edad.*/
select * from Alumno where genero = 'F' and year (getdate())-year (fechanacim) >= 18

/*7.Los alumnos cuya identificaci�n empiece por 6.*/
select * from alumno where docident like '6%'

/*8. La identificaci�n, apellidos, nombres, tel�fono, edad, ciudad, 
mes de nacimiento y d�a de nacimiento, solo para los alumnos que tengan entre 15 a�os y 30 a�os.*/
select DocIdent as Identificacion, Apellidos, Nombres, Telefono, Edad = year(getdate()) - year(fechanacim),
Ciudad, month(fechanacim) as 'Mes de Nacimiento', Day(fechanacim) as 'Dia de Nacimiento' from alumno
where year(getdate()) - year(fechanacim) between 15 and 30

/*9. El alumno de mayor edad*/
select top 1 *, Edad= Year(getdate()) - YEAR(fechanacim) from alumno order by Year(getdate()) - YEAR(fechanacim) desc 

/*10. Los 5 primeros alumnos de menor edad*/
select top 5 *, Edad= Year(getdate()) - YEAR(fechanacim) from alumno order by Year(getdate()) - YEAR(fechanacim) asc

/* 11. Los alumnos que tienen el 5 como segundo y sexto caracter*/
select * from alumno where docident like '_5___5%'

/*12. Los alumnos que no tienen direcci�n y sean menores de edad.*/
select * from alumno where direccion is null and Year(getdate()) - YEAR(fechanacim) < 18

/*13. El alumno que tiene la cuota m�s alta*/
select top 1 * from Alumno order by VlrCuota desc 

/*14.El alumno que tiene la cuota m�s baja*/
select top 1 * from Alumno order by VlrCuota asc

/*15.Las notas para los alumnos que hayan ganado la asignatura con c�digo 02.*/
select * from nota where CodAsig = '02' and Definitiva >= 3

/*16.Las notas para los alumnos que ganaron la asignatura con c�digo 01.*/
select * from nota where CodAsig = '01' and Definitiva >= 3

/*17.Las notas de los 5 mejores alumnos de la asignatura con c�digo 01*/
select top 5 * from nota where codasig = '01' order by Definitiva desc
 
/*18.Las notas del peor alumno de la asignatura con c�digo 02*/
select top 1 * from nota where CodAsig = '01' order by Definitiva asc

/*19.Las notas del mejor alumno de la asignatura con c�digo 01*/
select top 1 * from nota where CodAsig = '01' order by Definitiva desc

20.La cantidad de alumnos por Estado Civil.
21.El promedio y el total de cuotas de las mujeres nacidas despu�s de 1980.
22.El promedio de cuotas de los hombres de Medellin?
23.La cuota m�s alta de los alumnos de Medellin o Cali?
24.La ciudad y el promedio de las cuotas(por ciudad)
25.El documento de identidad y el promedio de la definitiva por cada identificaci�n
26.El documento de identidad y el promedio de la definitiva por cada identificaci�n, solo si el promedio supera a 3.5
27.La ciudad y el promedio de las cuotas (por ciudad) solo si el promedio de las cuotas supera a 60000.
28.El c�digo de asignatura y la cantidad de alumnos, por asignatura, solo si esta cantidad es menor de 3.
29.El c�digo de la asignatura y la nota m�s baja, por asignatura
30.La identificaci�n y el promedio de los 3 mejores alumnos

