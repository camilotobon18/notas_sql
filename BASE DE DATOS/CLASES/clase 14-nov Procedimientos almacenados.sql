use Academico
/*crear un procedimiento almacenado para listar los alumnos de 
cualquier ciudad, indicando el nombre de esta (parametro de entrada*/
create procedure sp_listarxCiudad20
as
select * from alumno where ciudad = 'medellin'  

--borrar procedimiento almacenado
drop procedure sp_listarxCiudad20

--si no lleva la palabra input se asume q es una variable de entrada
--se debe definir el tamaño de la variable segun el tamaño que aparece en la BD
create procedure sp_listarCiudadCat
@ciudad nvarchar (15)
as
select * from Alumno where Ciudad = @ciudad

--Ejecucíon
execute sp_listarCiudadCat 'buga'

--Modificar el procedimiento almacenado
alter procedure sp_listarCiudadCat
@ciudad nvarchar (15)=null --sino se envia la ciudad, queria null
as
--verificar si se envio la ciudad
if @ciudad is not null 
	--buscar la ciudad
	if exists (select ciudad from Alumno where ciudad=@ciudad)
		begin
			select * from Alumno where ciudad=@ciudad
		end
	else
		print 'no hay alumnos para la ciudad ' + @ciudad
else
	print 'por favor, enviar el nombre de la ciudad'

select * from Alumno where Ciudad = @ciudad

	
execute sp_listarCiudadCat 'buga'

--cubos o laps, para simular lo que hacen las tablas dinamicas filas y columnas

/*crear un procedimiento almacenado para listar las notas de cualquier 
alumno, indicando su identificacion*/

create procedure sp_listarnotacat
@identificacion nvarchar (15)
as 
select * from nota where DocIdent=@identificacion

execute sp_listarnotacat '10101010'

select * from nota


/*Crear un procedimiento almacenado para retornar el promedio de cualquier 
alumno, digitando sus apellidos y nombres (parametro de entrada: apellidos, nombres
y parametro de salida que es el promedio)*/

create procedure sp_promedioxalumnocat
@apellidos nvarchar(30), 
@nombres nvarchar(30),
@promedio real output 
as
select @promedio = avg(nota.definitiva) from Alumno inner join 
nota on alumno.DocIdent=nota.DocIdent where alumno.apellidos=@apellidos
and alumno.Nombres=@nombres

--ejecucion
declare @prom real --se declara la variable que recibe el dato
execute sp_promedioxalumnocat 'alvarado', 'ernesto', @prom output
print 'El promedio del alumno es: '+LTrim(str(@prom,3,1)) --STR, sirve para convertir, igual que en C#, el 3,1 define los digitos y decimales
--LTRIN, sirve para quitar los espacios en blanco a la izquierda.

select * from Alumno 