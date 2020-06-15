use academico
select * from alumno
select * from Asignatura
select * from nota

--
select * from alumno left join nota on alumno.docident = nota.DocIdent

select * from alumno right join nota on alumno.docident = nota.DocIdent

select * from nota left join alumno on alumno.docident = nota.DocIdent

--listar los alumnos que no tienen nota
select * from alumno left join nota on Alumno.DocIdent = Nota.DocIdent 
where nota.DocIdent is null

--alumno.* muestra solo los datos de la tabla alumno
select alumno.* from nota right join alumno on nota.DocIdent = alumno.DocIdent 
where nota.DocIdent is null

--cuales asignaturas no tienen notas
select * from Asignatura left join nota on asignatura.CodAsig = nota.CodAsig
where nota.CodAsig is null

select * from nota right join Asignatura on asignatura.CodAsig = nota.CodAsig
where nota.CodAsig is null

--cuales documentos de identidad tienen notas y no existen en alumnos
select * from nota left join alumno on alumno.DocIdent = nota.DocIdent
where alumno.DocIdent is null

select * from alumno right join nota on alumno.DocIdent = nota.DocIdent
where alumno.DocIdent is null

--agregar un alumno con todos lo datos.
--se debe respetar el orden de las columnas de la tabla, para ingresar los datos
insert alumno values ('7111119','zuluaga gonzalez','maria adelaida','19920101','2552020',
'kra 89','ibague','F','Soltera','Zugoma@gmail.com',null,null,98000)

select * from Alumno
insert Alumno(apellidos,nombres,FechaNacim,DocIdent)
values ('restrepo solano', 'juan esteban', '19870303', '4333338')

--cambiar direccion, telefono y valor cuota con el 10% para el alumno con identificacion 7111119
update alumno set direccion = 'trans 23 # 20-20', telefono = '7888888',
VlrCuota = vlrcuota * 110/100 where DocIdent ='7111119'

--Cambiar la nota del periodo 1, con 2.8, para el alumno Ernesto Alvarado
--Con subconsulta
update nota set NotaPeriodo1=3.8 where DocIdent in
(select DocIdent from alumno where nombres = 'Ernesto' and Apellidos = 'Alvarado')

--con Consulta Interna
update nota set NotaPeriodo1=4.8 from alumno inner join nota on alumno.DocIdent = nota.DocIdent
where alumno.nombres = 'Ernesto' and alumno.Apellidos= 'Alvarado'

--Eliminar todos los registros
--con manejo de transacciones, inicio la transaccion y puedo desacerla despues
--si aplico el delete sin begin transaction no puedo desacer el delete
begin transaction
delete Alumno
select * from alumno
rollback transaction --desacer la transaction, ctrl Z
commit transaction --Confirma la transaccion

--eliminar el cliente con identificacion 7111111
delete Alumno where DocIdent ='7111119'

--eliminar las notas de Ernesto Alvarado
delete nota from alumno inner join nota
on alumno.DocIdent = nota.DocIdent
where alumno.apellidos = 'alvarado' and Alumno.Nombres ='ernesto'
