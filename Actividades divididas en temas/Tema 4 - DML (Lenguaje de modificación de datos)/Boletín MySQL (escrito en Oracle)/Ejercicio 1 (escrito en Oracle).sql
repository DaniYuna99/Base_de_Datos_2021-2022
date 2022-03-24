CREATE TABLE DEPARTAMENTO
(
	codigo			VARCHAR2(10),
	nombre			VARCHAR2(100),
	presupuesto		NUMBER(10,2),
	
	CONSTRAINT PK_codigo_departamento PRIMARY KEY (codigo)

);

CREATE TABLE EMPLEADO
(
	codigo				VARCHAR2(10),
	nif					VARCHAR2(9),
	nombre				VARCHAR2(100),
	apellido1			VARCHAR2(100),
	apellido2			VARCHAR2(100),
	codigo_departamento	VARCHAR2(10),
	
	CONSTRAINT PK_codigo_empleado PRIMARY KEY (codigo),
	CONSTRAINT FK_codigo_departamento FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo)

);

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT CHK_nombre CHECK (nombre like '%S');
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT CHK_presupuesto CHECK (presupuesto > 0);
ALTER TABLE EMPLEADO MODIFY codigo_departamento NOT NULL;
ALTER TABLE DEPARTAMENTO DISABLE CONSTRAINT PK_codigo_departamento;
ALTER TABLE DEPARTAMENTO MODIFY codigo VARCHAR2(10);
ALTER TABLE EMPLEADO MODIFY codigo_departamento VARCHAR2(10);