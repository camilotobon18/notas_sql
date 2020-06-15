use Contabilidad
select * from LineaTransacc
select * from Transaccion
--1. Agregar un comprobante, con c�digo cualquiera y nombre Ajuste.
insert Comprobante values ('06','Ajuste')

--2. Agregar un tercero con todos sus datos.
insert Tercero values ('890900850','Parce Sport')

/*3. Agregar el tercero, del numeral anterior, a la tabla COPIATERCERO, utilizando la
cl�usula SELECT.*/

--4. Adicionar una transacci�n solo con los datos n�mero de documento y fecha.
insert Transaccion(nrodocumento, fecha) values ('105','20050101')

--5. Asigne el c�digo del comprobante a la transacci�n ingresada en el numeral anterior.
update Transaccion set NroComp=05 where NroDocumento = '105'

/*6. Adicionar una l�nea de transacci�n con todos sus datos, utilizando variables de
memoria.*/
insert LineaTransacc(NroDocumento,CodCuenta,valor) values ('99','150001','950000')

--7. Cambiar el valor de la transacci�n, por 65800, para la cuenta de caja.
update lineatransacc set valor=65800 from lineatransacc inner join cuenta on LineaTransacc.CodCuenta =
cuenta.codcuenta where cuenta.nombre='caja'

/*8. Cambiar el n�mero del documento 777, por 989, en las tablas: TRANSACCION y
LINEATRANSACCION (2 transacciones).*/

9. Eliminar el comprobante ingresado en el numeral 1.
10. Eliminar las l�neas de transacci�n de la cuenta CAJA.
11. Eliminar todos los registros de la tabla COPIATERCERO.
12. Cambiar el c�digo de la cuenta y el valor a la l�nea de transacci�n ingresada en el
numeral 6.
13. Eliminar la transacci�n ingresada en el numeral 4.