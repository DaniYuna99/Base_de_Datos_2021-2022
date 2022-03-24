create database db_ejercicio2;
create user 'ejercicio2'@'%' identified by 'ejercicio2';
grant all on db_ejercicio2.* to 'ejercicio2'@'%';

CREATE TABLE CLIENTE
(
	id				INT(10),
	nombre			VARCHAR(100),
	apellido1		VARCHAR(100),
	apellido2		VARCHAR(100),
	ciudad			VARCHAR(100),
	categoria		INT(10),
	
	CONSTRAINT PK_id_cliente PRIMARY KEY (id)

);

CREATE TABLE COMERCIAL
(
	id				INT(10),
	nombre			VARCHAR(100),
	apellido1		VARCHAR(100),
	apellido2		VARCHAR(100),
	ciudad			VARCHAR(100),
	comision		FLOAT(5,2),
	
	CONSTRAINT PK_id_comercial PRIMARY KEY (id)

);

CREATE TABLE PEDIDO
(
	id				INT(10),
	cantidad		DOUBLE(6,2),
	fecha			DATE,
	id_cliente		INT(10),
	id_comercial	INT(10),
	
	CONSTRAINT PK_id_pedido PRIMARY KEY (id),
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id),
	CONSTRAINT FK_id_comercial FOREIGN KEY (id_comercial) REFERENCES COMERCIAL (id)

);