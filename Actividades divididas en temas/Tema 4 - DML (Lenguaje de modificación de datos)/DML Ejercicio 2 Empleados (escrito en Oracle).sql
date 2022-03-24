/*alter session set "_oracle_script"=true;  
create user dml_ejercicio2 identified by dml_ejercicio2;
GRANT CONNECT, RESOURCE, DBA TO dml_ejercicio2;*/




/*-----TABLAS-----*/

CREATE TABLE DEPARTAMENTO
(
	codigo			NUMBER(10),
	nombre			VARCHAR2(100),
	presupuesto		NUMBER(8,2),
	gastos			NUMBER(8,2),
	
	CONSTRAINT PK_codigoDepartamento PRIMARY KEY (codigo)
);

CREATE TABLE EMPLEADO
(
	codigo				NUMBER(10),
	nif					VARCHAR2(9),
	nombre				VARCHAR2(100),
	apellido1			VARCHAR2(100),
	apellido2			VARCHAR2(100),
	codigo_departamento	NUMBER(10),
	
	CONSTRAINT PK_codigoEmpleado PRIMARY KEY (codigo),
	CONSTRAINT FK_codigoDepartamento_empleado FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo)
);




/*-----INCORPORACION DE DATOS-----*/

	/*Departamento*/

INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (1, 'Desarrollo', 120000, 6000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (2, 'Sistemas', 150000, 21000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (3, 'Recursos Humanos', 280000, 25000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (4, 'Contabilidad', 110000, 3000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (5, 'I+D', 375000, 380000);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (6, 'Proyectos', 0, 0);
INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (7, 'Publicidad', 0, 1000);


	/*Empleado*/

INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (1, '32481596F', 'Aaron', 'Rivero', 'G�mez', 1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (2, 'Y5575632D', 'Adela', 'Salas', 'D�az', 2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (4, '77705545E', 'Adri�n', 'Su�rez', NULL, 4);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (5, '17087203C', 'Marcos', 'Loyola', 'M�ndez', 5);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (6, '38382980M', 'Mar�a', 'Santana', 'Moreno', 1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (9, '56399183D', 'Juan', 'G�mez', 'L�pez', 2);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (13, '82635162B', 'Juan Antonio','S�ez', 'Guerrero', NULL);





/*-----INSTRUCCIONES ADICIONALES-----*/

	/* 1. Inserta un nuevo departamento indicando su código, nombre y presupuesto.*/

INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto) VALUES (8, 'Departamento Noseque', 20000);


	/* 2. Inserta un nuevo departamento indicando su nombre y presupuesto.*/ /*NO SE PUEDE*/

INSERT INTO DEPARTAMENTO (nombre, presupuesto) VALUES ('Departamento Nosecuantos', 15000);


	/* 3. Inserta un nuevo departamento indicando su código, nombre, presupuesto y gastos.*/

INSERT INTO DEPARTAMENTO (codigo, nombre, presupuesto, gastos) VALUES (9, 'Departamento AunSigoSinSaber', 5000, 3000);

	
	/* 4. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. 
	 * La sentencia de inserción debe incluir: código, nif, nombre, apellido1, 
	 * apellido2 y codigo_departamento.*/

INSERT INTO EMPLEADO (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (14, '12345678A', 'Kazuya', 'Mishima', 'Dorya', 8);

	
	/* 5. Inserta un nuevo empleado asociado a uno de los nuevos 
	departamentos. La sentencia de inserción debe 
	incluir: nif, nombre, apellido1, apellido2 y codigo_departamento.*/ /*NO SE PUEDE*/

INSERT INTO EMPLEADO (nif, nombre, apellido1, apellido2, codigo_departamento) VALUES ('87654321B', 'Roberto', 'García', 'Matamoros', 9);

	
	/* 6. Crea una nueva tabla con el nombre departamento_backup que tenga las 
	mismas columnas que la tabla departamento. Una vez creada copia todos 
	las filas de tabla departamento en departamento_backup.*/

CREATE TABLE DEPARTAMENTO_BACKUP
(
	codigo			NUMBER(10),
	nombre			VARCHAR2(100),
	presupuesto		NUMBER(8,2),
	gastos			NUMBER(8,2),
	
	CONSTRAINT PK_codigoDepartamentoBackup PRIMARY KEY (codigo)
);

INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (1, 'Desarrollo', 120000, 6000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (2, 'Sistemas', 150000, 21000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (3, 'Recursos Humanos', 280000, 25000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (4, 'Contabilidad', 110000, 3000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (5, 'I+D', 375000, 380000);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (6, 'Proyectos', 0, 0);
INSERT INTO DEPARTAMENTO_BACKUP (codigo, nombre, presupuesto, gastos) VALUES (7, 'Publicidad', 0, 1000);
	
	
	/* 7. Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese 
	posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/

/*SELECT * FROM DEPARTAMENTO WHERE (nombre LIKE 'Proyectos%');*/
DELETE FROM DEPARTAMENTO WHERE (nombre LIKE 'Proyectos%');
	
	
	/* 8. Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese 
	posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/

/*SELECT * FROM DEPARTAMENTO; WHERE (nombre LIKE 'Desarrollo%');*/
/*SELECT * FROM EMPLEADO;*/
ALTER TABLE EMPLEADO DROP CONSTRAINT FK_codigoDepartamento_empleado;
DELETE FROM DEPARTAMENTO WHERE (nombre LIKE 'Desarrollo%');
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_codigoDepartamento_empleado FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo);
	
	/* 9. Actualiza el código del departamento Recursos Humanos y asignale el valor 
	30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería 
	realizar para que fuese actualizarlo?*/

/*SELECT * FROM DEPARTAMENTO; WHERE nombre like 'Recursos ;*/
UPDATE DEPARTAMENTO SET codigo = 20 WHERE nombre LIKE 'Recursos Humanos%';
	
	
	/* 10.Actualiza el código del departamento Publicidad y asignale el valor 40. 
	¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería 
	realizar para que fuese actualizarlo?
	*/

UPDATE DEPARTAMENTO SET codigo = 40 WHERE nombre LIKE 'Publicidad%';

	
	/*11.Actualiza el presupuesto de los departamentos sumándole 50000 € al
	valor del presupuesto actual, solamente a aquellos departamentos que
	tienen un presupuesto menor que 20000 €.*/

UPDATE DEPARTAMENTO SET presupuesto = presupuesto + 50000 WHERE (presupuesto < 20000);

	
	/*12.Realiza una transacción que elimine todas los empleados que no tienen
	un departamento asociado.*/

DELETE FROM EMPLEADO WHERE codigo_departamento IS NULL;




