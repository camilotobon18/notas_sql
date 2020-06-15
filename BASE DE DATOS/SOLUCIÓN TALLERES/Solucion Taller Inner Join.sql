use contabilidad
select * from comprobante
select * from cuenta
select * from lineatransacc
select * from tercero
select * from transaccion

/*1. Todas las l�neas de transacciones, por los campos: Numero de documento, C�digo de la
cuenta, Nombre de la cuenta y Valor.*/
select LineaTransacc.NroDocumento, LineaTransacc.CodCuenta, cuenta.Nombre, LineaTransacc.Valor
from LineaTransacc inner join cuenta on lineatransacc.CodCuenta = cuenta.CodCuenta

/*2. Todas las l�neas de transacciones, por los campos: N�mero de documento, Fecha de la
transacci�n, C�digo del comprobante, C�digo de la cuenta, Nombre de la cuenta y Valor,
solo si la cuenta empieza por 1.*/
select LineaTransacc.NroDocumento, Transaccion.fecha, comprobante.NroComp, comprobante.nombre,
LineaTransacc.Valor from LineaTransacc inner join Transaccion on Transaccion.nrodocumento = LineaTransacc.NroDocumento 
inner join comprobante on Transaccion.NroComp = Comprobante.NroComp  where lineatransacc.CodCuenta like '1%'

/*3. Todas las transacciones, por los campos: N�mero de documento, C�digo del
comprobante, Nombre del comprobante y Fecha.*/
select LineaTransacc.NroDocumento, comprobante.nrocomp, comprobante.Nombre, Transaccion.fecha
from LineaTransacc inner join Transaccion on LineaTransacc.NroDocumento = Transaccion.NroDocumento
inner join Comprobante on Comprobante.NroComp = Transaccion.NroComp

/*4. Todas las l�neas de transacciones, por los campos: N�mero de documento, C�digo de la
cuenta, Nombre de la cuenta y Valor, cuyo valor de transacci�n exceda de 30000.*/
select LineaTransacc.NroDocumento, LineaTransacc.CodCuenta, cuenta.CodCuenta, LineaTransacc.valor
from LineaTransacc inner join cuenta on LineaTransacc.CodCuenta = cuenta.CodCuenta 
where LineaTransacc.Valor > 30000

/*5. Todas las l�neas de transacciones, por los campos: N�mero de documento, C�digo de la
cuenta, Nombre de la cuenta y Valor, cuyo valor de transacci�n este entre 30000 y 50000.*/
select LineaTransacc.NroDocumento, LineaTransacc.CodCuenta, cuenta.Nombre, LineaTransacc.valor
from LineaTransacc inner join cuenta on LineaTransacc.CodCuenta = cuenta.CodCuenta 
where LineaTransacc.Valor between 30000 and 50000

/*6. Todas las l�neas de transacciones, por los campos: N�mero de documento, C�digo de la
cuenta, Nombre de la cuenta y Valor, emitiendo un subtotal y total por n�mero de
documento (consulte la utilizaci�n de la cl�usula COMPUTE y COMPUTE BY).*/
select LineaTransacc.NroDocumento, LineaTransacc.CodCuenta, Cuenta.Nombre, LineaTransacc.Valor
from LineaTransacc inner join cuenta on LineaTransacc.CodCuenta = cuenta.CodCuenta order by 
lineatransacc.nrodocumento, lineatransacc.valor compute sum(lineatransacc.valor) by lineatransacc.nrodocumento

/*7. El nombre de la cuenta, la cantidad de veces que tuvo transacciones y el promedio del
valor de la transacci�n.*/

/*8. Los nombres de cuentas que no tienen l�neas de transacci�n (consultar y utilizar LEFT JOIN
o RIGHT JOIN).*/
select * from cuenta left join lineatransacc on cuenta.codcuenta = lineatransacc.codcuenta
where LineaTransacc.codcuenta is null 

/*9. Los c�digos de cuenta que no se encuentran en la tabla Cuenta(consultar y utilizar LEFT
JOIN o RIGHT JOIN).*/
select * from cuenta right  join LineaTransacc on lineatransacc.CodCuenta = cuenta.CodCuenta
where cuenta.CodCuenta is null

--10. Cu�nto se ha abonado a las cuentas por pagar (CXP)?
select SUM(valor) from cuenta left join LineaTransacc on LineaTransacc.CodCuenta = Cuenta.CodCuenta
where cuenta.Nombre = 'CxP'
