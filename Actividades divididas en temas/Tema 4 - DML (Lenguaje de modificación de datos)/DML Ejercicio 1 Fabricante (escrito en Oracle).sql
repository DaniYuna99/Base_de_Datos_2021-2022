/*alter session set "_oracle_script"=true;  
create user dml_ejercicio1 identified by dml_ejercicio1;
GRANT CONNECT, RESOURCE, DBA TO dml_ejercicio1;*/

CREATE TABLE FABRICANTE 
(
	codigo			NUMBER(10),
	nombre			VARCHAR2(100),
	
	CONSTRAINT PK_codigo PRIMARY KEY (codigo)
);

CREATE TABLE PRODUCTO
(
	codigo				NUMBER(10),
	nombre				VARCHAR2(100),
	precio				NUMBER(6,2),
	codigo_fabricante	NUMBER(10),
	
	CONSTRAINT PK_codigoProducto PRIMARY KEY (codigo),
	CONSTRAINT FK_codigo_fabricante FOREIGN KEY (codigo_fabricante) REFERENCES FABRICANTE (codigo)
);


/* Instrucciones obligatorias */

INSERT INTO FABRICANTE (codigo, nombre) VALUES (1, 'Asus');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (2, 'Lenovo');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (3, 'Hewlett-Packard');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (4, 'Samsung');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (5, 'Seagate');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (6, 'Crucial');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (7, 'Gigabyte');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (8, 'Huawei');
INSERT INTO FABRICANTE (codigo, nombre) VALUES (9, 'Xiaomi');

INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (3, 'Disco SSD 1TB', 150.99, 4);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (8, 'Portátil Yoga 520', 559, 2);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



/* Instrucciones adicionales */

INSERT INTO FABRICANTE (codigo, nombre) VALUES (10, 'Capcom');

/*No se puede because no tiene PK y es obligatorio ponerlo.*/
INSERT INTO FABRICANTE (nombre) VALUES ('SNK');

INSERT INTO PRODUCTO (codigo, nombre, precio, codigo_fabricante) VALUES (12, 'Marvel vs. Capcom', 24.99, 10);

/*No se puede because no tiene PK y es obligatorio ponerlo.*/
INSERT INTO PRODUCTO (nombre, precio, codigo_fabricante) VALUES ('Resident Evil', 15.50, 10);

/* Para comprobar si en una columna hay un valor.
 * 
 * SELECT * FROM FABRICANTE WHERE codigo = 1;*/

DELETE FROM FABRICANTE WHERE codigo = 1;
DELETE FROM FABRICANTE WHERE codigo = 9;

UPDATE FABRICANTE SET codigo = 20 WHERE codigo = 2;
UPDATE FABRICANTE SET codigo = 30 WHERE codigo = 8;
UPDATE PRODUCTO SET precio = (precio + 5.00);

DELETE FROM PRODUCTO WHERE codigo = 10;
DELETE FROM PRODUCTO WHERE codigo = 11;







