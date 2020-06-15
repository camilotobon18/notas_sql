use facturacion06
select * from CLIENTE
select * from FACTURA
select * from PRODUCTO	
select * from ITEMXFACTURA
select * from ITEMXCOMPRA

/*crear un trigger de manera que al agregar un itemxfactura se disminuyta la existencia del producto respectivo*/

create trigger tg_adicItemxFactura on ItemxFactura
for insert 
as
update producto set EXISTENCIA=EXISTENCIA -(select Cantidad from inserted) where referencia 
in (select referencia from inserted)

insert ITEMXFACTURA values ('236', 'a01', 5, 890000);

/*Crear un desencadenador de manera que al agregar un itemxcompra se incremente la existencia del
producto respectivo*/

create trigger tg_adicitemxcompra99 on itemxcompra
for insert
as
update producto set existencia = existencia +
(select cantidad from inserted) where referencia in
(select REFERENCIA from inserted)

insert ITEMXCOMPRA values ('452', 'a01', 20, 1200000)

/*actualiza la tabla producto, realiza un registro en la tabla itemxcompra y el registro mueve el inventario. 
para cada insert en itemxcompra que actualice el inventario de la tabla producto*/

/*crear un desencadenador de manera que al cambiar la identificacion de un cliente, se actualice
esta en la tabla factura*/
select * from cliente
select * from factura

create trigger tg_cambiarident on cliente
for insert
as
update factura set NITOCC= (select nitocc from inserted)
where NITOCC in (select nitocc from deleted) 
/*se actualiza en la tabla factura, cuando actualizo cliente.*/

update cliente set NITOCC = 555555 where  nitocc = 90000000

/*si se borra un cliente, q se borren todas las facturas*/
create trigger tg_borrarfactura on cliente
for insert 
as
delete factura where nitocc in (select nitocc from deleted)

delete cliente where nitocc = 555555


