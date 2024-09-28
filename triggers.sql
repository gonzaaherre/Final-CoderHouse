USE proyecto_final_herrera;


DROP TRIGGER pagos_guardados_;
DELIMITER //
CREATE TRIGGER pagos_guardados_
AFTER INSERT ON `pago`
FOR each row
BEGIN 
	INSERT INTO hora_de_pago(accion,FECHA,id_client,precio,nro_orden)
    VALUES ('PAGO APROBADO', NOW(),NEW.id_client,NEW.precio,NEW.nro_orden);
END;
//


DELIMITER // 
CREATE TRIGGER clientes_eliminados
BEFORE DELETE ON `clientes`
FOR EACH ROW
BEGIN
	INSERT INTO CLIENTES_DELETED(id_cliente,nombre,apellido,fecha_eliminacion,dni,telefono,direccion)
    VALUES (old.id_cliente,old.nombre,old.apellido,NOW(),old.dni,old.telefono,old.direccion); 
END;
//

delete from clientes where id_cliente=11;
//
select * from CLIENTES_DELETED;



DELIMITER //
CREATE TRIGGER distribuidores_eliminados
AFTER DELETE ON `distribuidores`
FOR each row
BEGIN 
	INSERT INTO DISTRIBUIDORES_DELETED(accion,id_distribuidor,nombre_distribuidor,id_producto_distribuidor,entregado,fecha_eliminacion)
    VALUES ('DISTRIBUIDOR ELIMINADO', OLD.id_distribuidor,OLD.nombre_distribuidor,OLD.id_producto_distribuidor,OLD.entregado,NOW());
END;
//




