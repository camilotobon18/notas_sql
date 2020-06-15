use academico
select * from alumno

/*19. las notas del mejor alumno de la asignatura con codigo 01*/
select top 1 * from nota where codasig = '01' order by definitiva desc

--20. la cantidad de alumnos por estado civil
select estadocivil, count(docident) as Cantidad_de_alumnos from alumno group by EstadoCivil

--21. el promedio y el total de cuotas de las mujeres nacidas despues de 1980
select avg(vlrcuota) as Promedio_cuotas, sum(vlrcuota) as Total_Cuotas from alumno
where genero = 'f' and FechaNacim > '19800101'

--22. el promedio de cuotas de los hombres de medellin.
select avg(vlrcuota) as Promedio_cuotas from alumno where genero = 'm' and ciudad = 'Medellin'

--23. la cuota mas alta de los alumnos de medellin o cali.
select MAX(vlrcuota) as Cuota_mas_alta from alumno where ciudad = 'cali' or ciudad = 'medellin'

--24. la ciudad y el promedio de las cuotas (por ciudad)
select ciudad, avg(vlrcuota) as Promedio_cuotas from alumno group by ciudad 

--25. el documento de identidad y el promedio de la definitiva por cada identificacion
select docident as Identificacion, avg(definitiva) as Promedio_Definitiva from nota group by DocIdent

--26. el documento de identidad y el promedio de la definitiva por cada identificacion, solo si el promedio supera a 3.5
select docident as Identificacion, avg(definitiva) as Promedio_Definitiva from nota group by DocIdent having avg(definitiva)>3.5

--27. La ciudad y el promedio de las cuotas (por ciudad) solo si el promedio de las cuotas supera a 60000.
select ciudad, avg(vlrcuota) as Promedio_Coutas from alumno group by ciudad having avg(vlrcuota) > 60000

--28. El código de asignatura y la cantidad de alumnos, por asignatura, solo si esta cantidad es menor de 3.
select codasig as Codigo_Asignatura, count(docident) as Cantidad_alumnos from nota group by CodAsig having COUNT(docident) < 3

--29. El código de la asignatura y la nota más baja, por asignatura
select codasig as Codigo_Asignatura, min(definitiva) as Nota_mas_baja from nota group by CodAsig

--30. La identificación y el promedio de los 3 mejores alumnos
select top 3 docident, avg(definitiva)  as Promedio from nota group by docident order by avg(definitiva) desc

select * from nota