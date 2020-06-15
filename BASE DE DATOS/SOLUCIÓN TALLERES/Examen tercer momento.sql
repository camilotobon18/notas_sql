USE BANCO
select * from CuentaxCliente
select * from cliente 

--1. Listar las cuentas de cualquier cliente, indicando el nombre del cliente.
Create procedure sp_listarcuentacte
@nombre nvarchar(30)
as
select * from CuentaxCliente inner join cliente on 
cuentaxcliente.DocIdent=cliente.DocIdent where cliente.nombre= @nombre

--ejecucion
execute sp_listarcuentacte 'teresa'

/*2. Retornar e imprimir el saldo total y el promedio del saldo, 
de las transacciones por cuentas, de cualquier cliente indicando su identificación.*/select * from TransacCuentacreate procedure sp_transaccionesxcuentas@identificacion nvarchar(12),@promedio real output,@saldo real outputasselect @promedio = avg(saldo), @saldo = sum(saldo)from CuentaxCliente where docident=@identificacion group by DocIdent declare @promedio real, @saldo realexecute sp_transaccionesxcuentas '4444', @promedio output, @saldo output print 'El promedio del saldo es ' + ltrim(str(@promedio)) + ' y el total del saldo es ' + ltrim(str(@saldo))
