USE proyecto_final_herrera;


/*
	creamos el usuario 'lectura_todo' que solamente tiene los permisos para leer datos
*/

CREATE USER 'usuario lec' IDENTIFIED BY '1234';

SELECT * FROM mysql.user WHERE user LIKE 'usuario lec';-- vemos los permisos

SHOW GRANTS FOR 'usuario lec'; -- vemos los grants(tablas que puede acceder)


/*
	le damos los permisos para que solamente pueda utilizar la 
    sentencia SELECT, sobre todas las tablas de la DB 'COMERCIO_GONZALO_HERRERA'
*/
GRANT SELECT ON proyecto_final_herrera.* TO  'usuario lec';  


DROP USER 'usuario lec'; 


/*
	Creamos el usuario 'USER_2' que solamente tiene los permisos de utilizar
    SELECT, INSERT y ALTER dentro de la DB 'COMERCIO_GONZALO_HERRERA'
*/

CREATE USER 'USER_SIA' IDENTIFIED BY 'ASDF';-- creamos el user

SELECT * FROM mysql.user WHERE user LIKE 'USER_SIA';-- vemos los permisos

GRANT SELECT, INSERT, ALTER ON COMERCIO_GONZALO_HERRERA.* TO 'USER_SIA';  