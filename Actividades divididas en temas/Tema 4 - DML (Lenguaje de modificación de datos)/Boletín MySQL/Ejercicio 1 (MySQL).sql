create database db_ejercicio1;
create user 'ejercicio1'@'%' identified by 'ejercicio1';
grant all on db_ejercicio1.* to 'ejercicio1'@'%';


CREATE TABLE DEPARTAMENTO
(
	codigo			INT(10),
	nombre			VARCHAR(100),
	presupuesto		DOUBLE(10,2),
	
	CONSTRAINT PK_codigo_departamento PRIMARY KEY (codigo)

);

CREATE TABLE EMPLEADO
(
	codigo				INT(10),
	nif					VARCHAR(9),
	nombre				VARCHAR(100),
	apellido1			VARCHAR(100),
	apellido2			VARCHAR(100),
	codigo_departamento	INT(10),
	
	CONSTRAINT PK_codigo_empleado PRIMARY KEY (codigo),
	CONSTRAINT FK_codigo_departamento FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo)

);