--comentario
/*este es un comentario de varias lineas 
*/
--activar, abrir o contextualizar la BD ACADEMICO
Use academico
--activar la BD BANCO
use BANCO
Use academico
/*recuperacion de datos:
se hace a través de la instrucción SELECT
Sintaxis:
SElECT [TOP n] <Lista_columnas> FROM <tabla(s)>
[WHERE <condición>]
[GROUP BY <columnas_agrupación>]
[HAVING <condición_agrupación>]
[ORDER BY <lista_columnas> [ASC|DESC]
*/
use Academico
--Mostrar todos los datos de todos los alumnos
select * from Alumno -- *representa todos los campos
select Nombres, Apellidos, docident, ciudad from Alumno --con algunos campos
select docident, apellidos, nombres, genero, telefono
from alumno		

--listar los alumnos de sexo femenino
select nombres,apellidos,genero from Alumno where genero='F'
select nombres from alumno where genero!='F'
select apellidos from alumno where genero <>'F'
--listar las mujeres de Medellín
select nombres, apellidos from alumno where genero='F' and Ciudad='Medellin'
--listar los alumnos que nacieron despues de 1990
select * from alumno where fechanacim >'19901231'
select * from alumno where fechanacim >='19910101' and fechanacim < '20001231'
select nombres,vlrcuota from alumno where VlrCuota=75000
--listar las alumnas de medellin o de cali, se deben utilizar parentesis para los operadores lógicos 
select * from alumno where genero='f' and (ciudad='medellin' or ciudad='cali')

--con la cláusula In
select * from alumno where ciudad in ('medellin','cali') and genero='f'
--listar los datos de los alumnos
select * from alumno order by docident  desc
/*listar los 2 últimos alumnos, ordenados por apellidos
en forma descendente*/
select top 2 * from alumno order by apellidos desc
/*listar el alumno que tiene la cuota mas alta*/
select top 1 * from alumno order by vlrcuota desc
/*listar el alumno que tiene la cuota mas baja*/
select top 1 * from alumno order by vlrcuota asc
/*cual es el alumno mas joven*/
select top 1 * from alumno order by FechaNacim desc 
/*cual es el alumno con mas edad*/
select top 1 * from alumno order by FechaNacim asc
/*cual es ela mujer de medellin mas joven*/
select top 1 * from alumno where genero='f' and ciudad='medellin' order by FechaNacim desc
/*cual es la alumna de mayor edad de cali cuya cuota supera 75000*/
select top 1 * from Alumno where genero='f' and Ciudad='cali' and VlrCuota>75000 order by FechaNacim asc

use BANCO
/*cual es el cliente mas antiguo*/

/*cual es el cliente mas nuevo*/

/*cual es la cuenta con mas saldo*/

/*cual ses la cuenta con menos saldo*/

/*cual es la cuenta con menos saldo del cliente con identificacion 4444*/

/*cuales son las 2 cuentas mas altas en el saldo*/

/*cuales son las 3 cuentas mas bajas en el saldo*/


