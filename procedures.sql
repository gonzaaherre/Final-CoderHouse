USE proyecto_final_herrera;

DELIMITER //
create procedure clientess()
begin
select * from cliente where id_cliente = 3;
end;
//
call clientess();






/*  
	*este procedimiento nos deja ordenar los monto de `pago` en forma ascendente o descendente. 
	*como primer parametro, se pasa la columna precio como tipo STRING.
    *como segundo parametro la forma que quiera(ascendente o descendente ) tambien como tipo STRING.
    *se pasan los parametro en tipo string ya que el procedimiento convierte los string en tipo
    clausula entendible por el motor SQL.
*/
DELIMITER //
create procedure ordenar_pagos(in campo varchar(20), in orden varchar(4))
begin
declare mensaje varchar(250);
set @mensaje = concat('select * from `pago` order by ',campo," ", orden ,' ;'	);
prepare runSQL FROM @mensaje;
execute runSQL;
deallocate prepare runSQL;
end;
//

call ordenar_pagos("precio","desc");	





/*  
	*Este procedimiento nos ayuda a insertar clientes
    *recibe los parametros con los datos del cliente
    *inserta de a un cliente
*/

DELIMITER //
create procedure insertar_clientes( in nombre varchar(30),in apellido varchar(30), in dni varchar(30), in telefono varchar(12),in direccion varchar(30)  )
begin
		insert into `clientes` ( nombre,apellido,dni,telefono,direccion )
        values ( nombre,apellido,dni,telefono,direccion);
								
end;
//
call insertar_clientes("matias","sarmiento","42691256","112346865","sanmartin");



/*  
	*Este procedimiento nos ayuda a insertar distribuidores
    *recibe los parametros con los datos del distribuidor
    *inserta de a un distribuidor
*/

DELIMITER //
create procedure insertar_distribuidor( in nombre_distribuidor varchar(45),in id_producto_distribuidor varchar (200), in entregado varchar (30) )
begin
		insert into `distribuidores`(nombre_distribuidor,id_producto_distribuidor,entregado)
        values ( nombre_distribuidor,id_producto_distribuidor,entregado);
								
end;
//

call insertar_distribuidor("deposito avenida","4","1");
 
 
 
 
 /*
	este procedimiento nos ayuda a sumar el total de 
    ventas que se generan en un año, se pasa como 
	parametro de tipo string el año que se quiere 
    ver el total de ventas que se produjeron
    ya que el procedimiento convierte los string en tipo
    clausula entendible por el motor SQL
    
 */
 DELIMITER //
create procedure total_ventas( in año varchar(20))
begin
declare mensaje varchar(250);
set @mensaje = concat('select sum(precio) from pago where fecha_pago LIKE "',año,'%";'	);
prepare runSQL FROM @mensaje;
execute runSQL;
deallocate prepare runSQL;
end;							
//
call total_ventas('2022');


/*
	Este procedimiento nos ayuda a eliminar distribuidores
    pasandoles el id del distribuidor
*/

DELIMITER //
create procedure eliminar_distribuidor (in id int)
begin
delete from distribuidores where id_distribuidor = id;
end;
//

call eliminar_distribuidor("8");