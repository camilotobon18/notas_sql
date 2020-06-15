use Academico
/*Funciones de agregado:
	Count (<campo>): permite contar
	Sum (<campo_numérico>): permite sumar
	Avg (<campo_numérico>): permite promediar
	Max (<campo_numérico>): permite hallar el valor mas alto
	Min (<campo_numérico>): permite hallar el valor mas bajo
*/
--Cuánto alumnos?
select count (email) as cantidad from alumno
select count (docident) as Cantidad from alumno

--Cuántas Mujeres?
select Cantidad_Mujeres = count (DocIdent) from Alumno where Genero = 'F'

--Hallar el valor total de las cuotas mensuales
select 'Valor total Cuotas' = sum (vlrcuota) from Alumno

--cual es el tota lde las cuotas mensuales de los alumnos de Cali
select sum (vlrcuota) as 'Total cuotas de Cali' from alumno 
where Ciudad='cali' and genero = 'M'

--cual es el promedio del valor cuota de las mujeres de Medellin
select avg(vlrcuota) as Promedio_Cuota_Mujeres from Alumno

--cual es el promedio de edad de los alumnos?
select avg(year(getdate())-year(fechanacim)) As Promedio_Edad_Alumnos from alumno

--cual es la cuota mas alta de los hombres?
select MAX(vlrcuota) as cuota_mas_alta_hombres from alumno where Genero ='M'

--cual es la edad mayor?
select MAX(year(getdate())-year(fechanacim)) as edad_mayor from alumno 

--cual es la edad mas baja de las mujeres?
select MIN(year(getdate())-year(fechanacim)) as Edad_Menor_Mujeres from Alumno
where Genero ='F'

/*Agrupación de Registros 
	Cláusula Group By: agrupa por uno o varios campos
	Cláusula Having: Condiciona los registros agrupados
*/
--Cuántos alumnos por ciudad?
select Ciudad, count(DocIdent) as Cantidad_alumnos from alumno Group By Ciudad

--Cuántos alumnos por ciudad y genero?
select Ciudad, Genero, count(DocIdent) as Cantidad_alumnos from alumno Group By Ciudad, Genero

select Genero,Ciudad, count(DocIdent) as Cantidad_alumnos from alumno Group By Genero, Ciudad

select Ciudad, Genero,estadoCivil, count(DocIdent) as Cantidad_alumnos from alumno Group By Ciudad, Genero, EstadoCivil

--Cuántos alumnos por Sexo?
select Genero as Sexo, count(DocIdent) as Alumnos_Por_Sexo from alumno group by genero

--Con Selector múltiple
select case genero
	when 'F' then 'Femenino'
	when 'M' then 'Masculino'
	end as Sexo
, cantidad_por_sexo = count (docident) from alumno group by genero

--Alumnos por sexo y ciudad
select ciudad, case genero
	when 'F' then 'Femenino'
	when 'M' then 'Masculino'
	end as Sexo
, cantidad_por_sexo = count (docident) from alumno group by ciudad, genero

/*listar la cantidad de alumnos y el promedio de cuota por ciudad, 
solo si la cantidad de alumnos supera a 2*/
select count(docident) as cantidad, AVG(vlrcuota) as Promedio_Cuota, Ciudad
from Alumno Group by Ciudad Having COUNT(DocIdent)>2

select * from alumno
/*listar la cantidad de alumnos por ciudad, suma del valor de la cuota supere 200.000*/
select COUNT(docident) as Cantidad, Ciudad,
 sum(vlrcuota) from alumno group by ciudad having SUM(vlrcuota)>200000
 
 /*listar la cantidad de mujeres por ciudad, donde la suma del valor de la cuota no supere 200.000*/
 select COUNT(docident) as Cantidad, ciudad, sum(vlrcuota),genero from Alumno
 group by ciudad, genero having sum(vlrcuota)<200000 and genero = 'F'