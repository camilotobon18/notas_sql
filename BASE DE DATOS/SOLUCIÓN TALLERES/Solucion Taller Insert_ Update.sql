use Contabilidad
select * from LineaTransacc
select * from Transaccion
--1. Agregar un comprobante, con código cualquiera y nombre Ajuste.
insert Comprobante values ('06','Ajuste')

--2. Agregar un tercero con todos sus datos.
insert Tercero values ('890900850','Parce Sport')

/*3. Agregar el tercero, del numeral anterior, a la tabla COPIATERCERO, utilizando la
cláusula SELECT.*/

--4. Adicionar una transacción solo con los datos número de documento y fecha.
insert Transaccion(nrodocumento, fecha) values ('105','20050101')

--5. Asigne el código del comprobante a la transacción ingresada en el numeral anterior.
update Transaccion set NroComp=05 where NroDocumento = '105'

/*6. Adicionar una línea de transacción con todos sus datos, utilizando variables de
memoria.*/
insert LineaTransacc(NroDocumento,CodCuenta,valor) values ('99','150001','950000')

--7. Cambiar el valor de la transacción, por 65800, para la cuenta de caja.
update lineatransacc set valor=65800 from lineatransacc inner join cuenta on LineaTransacc.CodCuenta =
cuenta.codcuenta where cuenta.nombre='caja'

/*8. Cambiar el número del documento 777, por 989, en las tablas: TRANSACCION y
LINEATRANSACCION (2 transacciones).*/

9. Eliminar el comprobante ingresado en el numeral 1.
10. Eliminar las líneas de transacción de la cuenta CAJA.
11. Eliminar todos los registros de la tabla COPIATERCERO.
12. Cambiar el código de la cuenta y el valor a la línea de transacción ingresada en el
numeral 6.
13. Eliminar la transacción ingresada en el numeral 4.