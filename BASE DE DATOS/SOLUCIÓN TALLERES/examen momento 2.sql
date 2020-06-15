use banco
select * from CuentaxCliente
select * from cliente
select * from TipoTransaccion
select * from TransacCuenta
/*1. Las cuentas por cliente y un campo calculado llamado INTERES, que contendr� el 2.5%, del saldo,
para los clientes que est�n activos (Estado es 1), no tengan direcci�n, el tel�fono empiece por 23 y
el a�o de ingreso est� entre 2000 y 2002 (Subconsulta o Consulta Interna).*/
select *, saldo * 0.025 as Interes from CuentaxCliente inner join cliente on (CuentaxCliente.DocIdent = Cliente.DocIdent)
where estado = '1' and Direccion is null and telefono like '23%' and (FechaIngreso between '20000101' and '20021231')

/*2. El promedio y la cantidad de cuentas de las cuentas que se abrieron en los a�os 2000 y 2002, solo si
este promedio supera a 200000.*/
select avg(saldo) as Promedio_Cuentas,  COUNT(nrocuenta) as Cantidad_Cuentas from CuentaxCliente 
where FechaApertura between '20000101' and '20021231'

/*3. Las 2 mejores cuentas que tengan los saldos m�s altos.*/
select top 2 * from CuentaxCliente order by saldo desc 

--4. Agregar un cliente con todos sus datos
insert Cliente (DocIdent, nombre, Apellido, Direccion, Telefono, FechaIngreso, estado)
values ('232323', 'Camilo', 'Tobon','Calle 9', '4061165', '20171107','1')

--5. Actualizar el saldo, de las cuentas por cliente, para el cliente Teresa Valencia, con el 5% m�s.
update cuentaxcliente set saldo= (saldo * 1.05) from CuentaxCliente inner join Cliente on (CuentaxCliente.DocIdent = cliente.DocIdent)
where Nombre = 'teresa' and Apellido = 'valencia'