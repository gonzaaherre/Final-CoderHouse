USE proyecto_final_herrera;

/*esta funcion evalua si el cliente tiene descuento por pago en efectivo*/
DROP FUNCTION IF EXISTS evaluacion_descuento;
DELIMITER //
create function evaluacion_descuento (tipo_pago int )
returns VARCHAR(70)
deterministic
begin
declare a varchar(100);
if (tipo_pago=1)
THEN
set a="tienes un descuento del 15%, el total seria: " ;

else
set a="pagando con efectivo tienes 15% de descuento";
end if;
RETURN a;
end;//


/*esta funcion descuenta un 15%*/

DELIMITER //
DROP FUNCTION IF EXISTS descuento;
CREATE function descuento (tipo_pago int ,precio int) returns numeric(10,2)
deterministic
begin
declare a numeric(10,2);
if tipo_pago=1
THEN
set a = precio - precio*0.15;
end if;
return a;
end;//

 select tipo_pago, precio, evaluacion_descuento (tipo_pago) evaluacion, descuento(tipo_pago , precio)descuento from `pago`;
 
/*
	estas dos funciones nos ayuda a encontrar las
    reseñas positivas y negativas de los clientes
    para que el almacen sepa que cosas esta 
    haciendo bien y cuales mal
	
*/

DELIMITER//

CREATE function reseñas_positivas (estrellas int) returns int
deterministic
begin
declare f int;
if estrellas=5
THEN 
set f=estrellas;
end if;
RETURN f;
END;
//

select id__cliente, reseñas_positivas(estrellas) from reseña;



DELIMITER//

CREATE function reseñas_negativas (estrellas int) returns int
deterministic
begin
declare f int;
if estrellas<=3
THEN 
set f=estrellas;
end if;
RETURN f;
END;
//
select id__cliente, reseñas_negativas(estrellas) negativas, reseñas_positivas(estrellas) from reseña;
