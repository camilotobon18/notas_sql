use contabilidad
select * from comprobante
select * from cuenta
select * from lineatransacc
select * from tercero
select * from transaccion

--11. Las líneas de transacciones que se dieron el 23 de mayo.
select * from LineaTransacc where NroDocumento in (select NroDocumento from 
Transaccion where fecha like '%0523')

/*12. El nombre del comprobante que se dio el 23 de mayo de 2003, en el número de
documento 333*/
select * from comprobante where NroComp in (select NroComp from Transaccion
where NroDocumento=333 and fecha='20030523')

/*13. La cantidad de cuentas que se movieron en el número de documento 222, del
comprobante INGRESOS*/
select COUNT(codcuenta) from LineaTransacc where NroDocumento in (select NroDocumento 
from Transaccion where NroComp in (select NroComp from comprobante where nombre='ingresos')
and NroDocumento=222)

--14. Cuál es el valor total del comprobante 01 en abril de 2003?
select sum(valor) from LineaTransacc where NroDocumento in (select NroDocumento from Transaccion
where fecha ='20030401')

--15. Cuáles comprobantes se movieron el 23 de mayo 2003?
select * from Comprobante where NroComp in (select NroComp from Transaccion 
where fecha='20030523')

--16. Las líneas de transacción donde se haya movido el comprobante de INGRESOS
select * from LineaTransacc where NroDocumento in (select NroDocumento from transaccion where NroComp 
in (select NroComp from Comprobante where nombre='ingresos'))


--17. Cuánto se ha abonado a las cuentas por pagar (CXP)?
select sum(valor) from LineaTransacc where CodCuenta in (select codcuenta from cuenta 
where Nombre='CxP')
