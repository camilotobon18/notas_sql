use cartera

select * from cliente
select * from factura
select * from pago
--Para este taller tenga en cuenta la base de datos CARTERA

--1. Listar el nit del cliente y el total de todas sus facturas
select NITOCC, sum (VLRFACTURA) as TOTAL_FACTURAS from FACTURA GROUP BY NITOCC

/*2. Listar el nit del cliente y el total de todas sus facturas, solo para
las facturas a credito (0)*/
Select NITOCC, FORMAPAGO, sum (VLRFACTURA) as TOTAL_FACTURAS_A_CREDITO from FACTURA GROUP BY NITOCC, FORMAPAGO HAVING FORMAPAGO = 0

/*3. Listar el nit del cliente y el total de todas sus facturas, solo para
las facturas a credito (0) del cliente con nit 71000000*/
select NITOCC,FORMAPAGO, SUM (VLRFACTURA) AS TOTAL_FACTURAS_A_CREDITO from FACTURA 
GROUP BY NITOCC, FORMAPAGO HAVING FORMAPAGO = 0 AND NITOCC = 71000000

/*4. Listar el nit del cliente y el total de todas sus facturas, solo si el total
de sus facturas supera a 6000000.*/
Select NITOCC, SUM (VLRFACTURA) as TOTAL_FACTURAS from FACTURA GROUP BY NITOCC HAVING SUM (VLRFACTURA)>6000000

/*5. Listar el nit del cliente y el total de todas sus facturas, solo si la
cantidad de facturas es superior a 2.*/
select NITOCC, SUM (VLRFACTURA) as TOTAL_FACTURAS from FACTURA GROUP BY NITOCC HAVING COUNT (NROFACT) >2

/*6. Listar el nit del cliente y el promedio de sus factura solo si las
facturas son a crédito.*/
select NITOCC,FORMAPAGO, AVG (VLRFACTURA) as PROMEDIO_FACTURAS from FACTURA GROUP BY NITOCC, FORMAPAGO HAVING FORMAPAGO = 0

/*7. Listar el nit del cliente, el total de todas sus factura y la cantidad de
facturas.*/
select NITOCC, SUM (VLRFACTURA) as TOTAL_FACTURAS, COUNT (NROFACT) as CANTIDAD_FACTURAS from FACTURA GROUP BY NITOCC

/*8. Listar el nit del cliente, el total de todas sus factura y la cantidad de
facturas solo para las facturas de contado (1) y el total de las facturas
supere a 3000000.*/
select NITOCC, SUM (VLRFACTURA) as TOTAL_FACTURAS, COUNT (NROFACT) as CANTIDAD_FACTURAS from FACTURA 
GROUP BY NITOCC, FORMAPAGO HAVING FORMAPAGO = 1 and SUM (VLRFACTURA) > 3000000

/*9. Listar el número de factura y la cantidad de abonos realizados a la
factura 100 o 101 solo si el total de abonos supera a 100000*/
select NROFACT, COUNT (VALORABONO) as CANTIDAD_ABONOS, SUM (VALORABONO) AS TOTAL_ABONOS  from PAGO GROUP BY NROFACT, VALORABONO HAVING (NROFACT BETWEEN 100 and 101) and sum(VALORABONO) > 100000

/*10. Listar el número de factura y el valor maximo del valor de abono
para las facturas 100 o 102 solo si el promedio del valor de abono
supera 48000*/

