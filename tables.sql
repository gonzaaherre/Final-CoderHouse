DROP DATABASE IF EXISTS `proyecto_final_herrera`;

CREATE DATABASE IF NOT EXISTS `proyecto_final_herrera`;

USE proyecto_final_herrera;

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE IF NOT EXISTS `clientes` (-- creamos los clientes.
	id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(24) NOT NULL,
	apellido VARCHAR(24) NOT NULL,
	dni VARCHAR(9) NOT NULL UNIQUE,
	telefono VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(30) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS `producto_distribuidor`;

CREATE TABLE IF NOT EXISTS `producto_distribuidor` (-- 
    id_prod INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	tipo_producto varchar(25) NOT NULL
);

select * from producto_distribuidor;

DROP TABLE IF EXISTS `distribuidores`;

CREATE TABLE IF NOT EXISTS `distribuidores` (-- creamos los distribuidores.
	id_distribuidor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	nombre_distribuidor VARCHAR(24) NOT NULL,
	id_producto_distribuidor INT NOT NULL ,    
    entregado INT NOT NULL, 
    foreign key(id_producto_distribuidor) REFERENCES producto_distribuidor(id_prod)
);


DROP TABLE IF EXISTS `tipo_productos`;

CREATE TABLE IF NOT EXISTS `tipo_productos` (-- esta tabla contiene los tipos de productos disponibles
	id_producto INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
	tipo_producto VARCHAR(25) NOT NULL,
	precio INT NOT NULL,
	stock INT
);

DROP TABLE IF EXISTS `producto_cliente`;

CREATE TABLE IF NOT EXISTS `producto_cliente` (-- Producto que compra el cliente, y los vamos a extraer de la tabla: tipo_productos
    id_prod INT NOT NULL,
	id_client INT NOT NULL,
	cantidad INT NOT NULL,
	fechaproducto_cliente DATE NOT NULL,
	foreign key(id_prod) references tipo_productos(id_producto),-- 
	foreign key(id_client) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `tipos_pago`;


CREATE TABLE IF NOT EXISTS `tipos_pago` (-- Aca guardaremos los tipos de pago disponibles
    id_tipo_pago INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	descripcion_tipo VARCHAR (15) NOT NULL
);

DROP TABLE IF EXISTS `pago`;

CREATE TABLE IF NOT EXISTS `pago`(-- en esta tabla tenemos el pago del cliente
	id_pago int auto_increment UNIQUE primary key,
	tipo_pago INT NOT NULL,
	id_client INT NOT NULL,
	precio INT NOT NULL,
	fecha_pago DATE,
	nro_orden INT,
    foreign key (tipo_pago) REFERENCES tipos_pago(id_tipo_pago),
	foreign key (id_client) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `reseña`;	

CREATE TABLE IF NOT EXISTS `reseña`(-- reseña del cliente
	id__cliente INT NOT NULL,
	reseña_cliente VARCHAR(200) NOT NULL,
    estrellas int(5) NOT NULL,
	foreign key (id__cliente) references clientes(id_cliente) ON DELETE CASCADE
);


DROP TABLE IF EXISTS `hora_de_pago`;
	
CREATE TABLE IF NOT EXISTS `hora_de_pago`(
	id_ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	accion VARCHAR(24),
	FECHA DATETIME,
    id_client INT NOT NULL,
    precio INT NOT NULL,
    nro_orden INT NOT NULL UNIQUE
);


DROP TABLE IF EXISTS `CLIENTES_DELETED`;

CREATE TABLE IF NOT EXISTS `CLIENTES_DELETED`(
	id_cliente INT NOT NULL UNIQUE,
	nombre VARCHAR(24) NOT NULL,
	apellido VARCHAR(24) NOT NULL,
    fecha_eliminacion DATETIME,
	dni VARCHAR(9) NOT NULL UNIQUE,
	telefono VARCHAR(15) NOT NULL UNIQUE,
    direccion VARCHAR(30) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS `DISTRIBUIDORES_DELETED`;

CREATE TABLE IF NOT EXISTS `DISTRIBUIDORES_DELETED`(
	accion VARCHAR(50),
	id_distribuidor INT NOT NULL UNIQUE,
    nombre_distribuidor VARCHAR(24) NOT NULL,
    id_producto_distribuidor INT NOT NULL,
    entregado boolean NOT NULL,
    fecha_eliminacion DATETIME
);
select * from CLIENTES_DELETED;

select * from reseña;

select  reseñas_positivas(estrellas) from reseña;