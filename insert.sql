USE proyecto_final_herrera;

INSERT INTO clientes(nombre, apellido,dni,telefono,direccion) VALUES ("charly","garcia", 28710921, 11375032, "25 De Mayo 771"),
("fito","paez",29971802,114042383,"Pueyrredon 480"),
("ciro","Martinez",33116392,114640786,"Solis 1812"),
("franco","milioti", 40118593, 2610298102, "av libertador 790"),
("jose","gonzalez", 38761023, 2639007654, "garcia 142"),
("marina","castro", 41721923, 112347650, "av chile"),
("julian","aguero", 44129804, 2610993726, "av peru"),
("sofia","andrades", 39125490, 119831476, "av del valle"),
("romina","quiroga", 40112309,118364208, "av regional"),
("bruno ","medina", 43086543, 2610219102, "av españa"),
("emanuel","olivares", 44765921, 2614236478, "av san martin"),
("mariela","dias", 39110245, 119873102, "av peru 345"),
("gimena","atencio", 39210243, 2630119232, "av libertador 546"),
("genaro","vera", 43920921, 11294732, "sarmiento 332"),
("agustin", "dias", 43880923, 2617882309, "junin 910"),
("paula", "vera", 42780912, 11029381, "guemes 776"),
("morena", "tobares", 43482091, 2639001829, "gral paz 110"),
("enzo", "atencio", 45221023,2610991234, "santa fe 123"),
("lautaro", "videla", 42901234, 2612339013, "av italia 1921");


INSERT INTO producto_distribuidor(tipo_producto) VALUES ("Higiene personal"),
("limpieza"),("comestible"),("bebida"),("cigarrillos"),("otros");

INSERT INTO distribuidores(nombre_distribuidor,id_producto_distribuidor,entregado) VALUES ("Maxiconsumo",1,1),
("DEPOSITO ALEM SA",2,1),
("DEPOSITO EL MAYORISTA",3,1),
("DISTRIBUIDORA LP",4,1),
("WyB Distribuidora",5,1),
("Distribuidora del Valle",6,1),
("Distribuidora Colon",4,2),
("Deposito Hawai",1,2),
("Distribuidora Ramirez",2,2),
("Del puente Distribudora",3,2);

INSERT INTO tipo_productos(tipo_producto,precio,stock) VALUES ("Higiene personal",250,1),
("limpieza",330,1),
("comestible",200,1),
("bebida",400,1),
("cigarros",450,1),
("otros",290,1);

INSERT INTO producto_cliente(id_prod,id_client,cantidad,fecha) VALUES (1,5,1, DATE("2023-02-12")),
(2,7,1, DATE("2023-02-12")),
(3,8,1, DATE("2023-02-13")),
(4,9,1, DATE("2023-02-13"));

select * from producto_cliente;
INSERT INTO tipos_pago(descripcion_tipo) VALUES ("EFECTIVO"),("DEBITO"),("CREDITO"),("TRANSFERENCIA");



START TRANSACTION;
INSERT INTO pago(tipo_pago,id_client,precio,fecha_pago,nro_orden ) values (1,12,660,DATE("2023-02-21"),1021),
(4,1,599,DATE("2023-01-06"),800),
(4,2,200,DATE("2022-12-28"),690),
(1,3,1200,DATE("2023-01-15"),867),
(1,2,990,DATE("2023-01-16"),888),
(1,3,100,DATE("2023-01-18"),889),
(1,3,100,DATE("2023-02-18"),900);

SAVEPOINT registros4;	

INSERT INTO pago(tipo_pago,id_client,precio,fecha_pago,nro_orden ) values (2,17,890,DATE("2023-02-25"),1025),
(2,1,320,DATE("2023-02-19"),901),
(3,3,220,DATE("2023-02-19"),902),
(1,4,120,DATE("2023-02-20"),903),
(1,4,400,DATE("2023-02-20"),904);

SAVEPOINT registros8;

ROLLBACK TO registros4;

COMMIT;


INSERT INTO reseña (id__cliente,reseña_cliente,estrellas) VALUES (1,"exelente producto",5),(2,"buena atencion",4),
(3,"buen precio",5),(4,"rapidez",5),(5,"pedido llego tarde",1),(6,"mal trato",1),(8,"tardanza",1),(10,"caro",1),
(13,"producto en mal estado",1);




