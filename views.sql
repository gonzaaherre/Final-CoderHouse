USE proyecto_final_herrera;

/*
	Esta view lo que hace es traer todos
    los pedidos que el almacen ha recibido
	utilizando la tabla distribuidor
*/
DROP VIEW Pedidos_recibidos ;
CREATE VIEW Pedidos_recibidos AS 
SELECT nombre_distribuidor nombre 
FROM distribuidores
 WHERE entregado = TRUE;

SELECT * FROM Pedidos_recibidos; 

/*
	esta vista lo que hace es traer los 
    clientes que han comprado/pagado en 
    2023, a traves de un inner join
    compuesta por las tablas de: `pago` y `cliente`
*/


DROP VIEW pagos_en_2023 ;
CREATE VIEW pagos_en_2023 AS
SELECT p.id_client, p.fecha_pago, c.nombre, c.apellido 
FROM pago P
INNER JOIN clientes C
ON p.id_client = c.id_cliente WHERE fecha_pago LIKE '2023%' 
order by id_cliente;


SELECT * FROM pagos_en_2023; 


DROP VIEW pago_transferencia;
CREATE VIEW pago_transferencia AS
SELECT  c.nombre, c.apellido, p.precio, p.tipo_pago
FROM clientes c 
JOIN pago p 
ON c.id_cliente = p.id_client WHERE tipo_pago = 4
;


SELECT * FROM pago_transferencia; 


