use cartera
select * from factura
--1. Listar el nit del cliente y el total de todas sus facturas
select nitocc as NIT_Cliente, Total_Facturas = sum (vlrfactura) from factura group by NITOCC

/*2. Listar el nit del cliente y el total de todas sus facturas, solo para 
las facturas a credito (0)*/
select nitocc as NIT_Cliente, Total_Facturas = sum (vlrfactura) from factura 
group by NITOCC, formapago having FORMAPAGO=0

/*3. Listar el nit del cliente y el total de todas sus facturas, solo para 
las facturas a credito (0) del cliente con nit 71000000*/
select nitocc as NIT_cliente, total_Factura =sum (vlRfactura) from factura
group by NITOCC, formapago having FORMAPAGO=0 and NITOCC = 71000000  

/*4. Listar el nit del cliente y el total de todas sus facturas, solo si el total 
de sus facturas supera a 6000000.*/
select nitocc as NIT_cliente, total_Factura =sum (vlRfactura) from factura
group by NITOCC having SUM (vlRfactura) > 6000000 

/*5. Listar el nit del cliente y el total de todas sus facturas, solo si la 
cantidad de facturas es superior a 2.*/
select nitocc as NIT_cliente, total_Factura =sum (vlRfactura) from factura
group by NITOCC having count (nitocc) >2

/*6. Listar el nit del cliente y el promedio de sus factura solo si las 
facturas son a crédito.*/
select nitocc as NIT_cliente, avg (vlRfactura) as promedio_factura from factura
group by NITOCC,FORMAPAGO having FORMAPAGO=0

/*7. Listar el nit del cliente, el total de todas sus factura y la cantidad de 
facturas.*/
select nitocc as NIT_cliente, total_Factura =sum (vlRfactura), count  (nitocc) as cantidad_facturas from factura
group by NITOCC

/*8. Listar el nit del cliente, el total de todas sus factura y la cantidad de 
facturas solo para las facturas de contado (1) y el total de las facturas 
supere a 3000000.*/
select nitocc as NIT_cliente, total_Factura =sum (vlRfactura), count  (nitocc) as cantidad_facturas from factura
group by  NITOCC, FORMAPAGO having FORMAPAGO=1 and sum (vlRfactura) >3000000


/*9. Listar el número de factura y la cantidad de abonos realizados a la 
factura 100 o 101 solo si el total de abonos supera a 100000*/
select * from pago
select NROFACT,count (NROFACT) FROM pago group by NROFACT having ( NROFACT between
 100 and 101) and sum (VALORABONO)>100000


/*10. Listar el número de factura y el valor maximo del valor de abono 
para las facturas 100 o 102 solo si el promedio del valor de abono 
supera 48000*/
select nrofact, max (valorabono) from pago group by NROFACT having (nrofact between 100 and 102)
and avg(valorabono)>48000
