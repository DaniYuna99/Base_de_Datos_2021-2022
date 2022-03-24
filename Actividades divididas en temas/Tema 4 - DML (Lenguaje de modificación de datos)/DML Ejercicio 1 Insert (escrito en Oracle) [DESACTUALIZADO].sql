/************************************************/
/*	  DML - EJERCICIO 1 INSERT - ACADEMIA		*/
/************************************************/


/*----- CREACI�N USUARIO -----*/

/* alter session set "_oracle_script"=true;  
create user dml_ejercicio1insert identified by dml_ejercicio1insert;
GRANT CONNECT, RESOURCE, DBA TO dml_ejercicio1insert; */



/*----- TABLAS -----*/

CREATE TABLE PROFESORES 
(
	dni					VARCHAR2(9),
	nombre				VARCHAR2(30),
	apellido1			VARCHAR2(30),
	apellido2			VARCHAR2(30),
	direccion			VARCHAR2(30),
	titulo				VARCHAR2(30),
	gana				NUMBER(5),
	
	CONSTRAINT PK_dniProfesores PRIMARY KEY (dni)
);

CREATE TABLE CURSOS
(	
	cod_curso			NUMBER(1),
	nombre_curso		VARCHAR2(30),
	maximo_alumnos		VARCHAR2(2),
	fecha_inicio		DATE,
	fecha_fin			DATE,
	num_horas			NUMBER(4),
	dni_profesor		VARCHAR2(9),
	
	CONSTRAINT PK_codcursoCursos PRIMARY KEY (cod_curso),
	CONSTRAINT FK_dniProfesor_cursos FOREIGN KEY (dni_profesor) REFERENCES PROFESORES (dni)
);

CREATE TABLE ALUMNOS
(
	dni					VARCHAR2(9),
	nombre				VARCHAR2(30),
	apellido1			VARCHAR2(30),
	apellido2			VARCHAR2(30),
	direccion			VARCHAR2(30),
	sexo				VARCHAR2(1),
	fecha_nacimiento	DATE,
	curso				NUMBER(1),
	
	CONSTRAINT PK_dniAlumnos PRIMARY KEY (dni),
	CONSTRAINT FK_curso_alumnos FOREIGN KEY (curso) REFERENCES CURSOS (cod_curso)
);




/*----- EJERCICIOS COMO TAL -----*/


/* 2. Insertar las siguientes tuplas: */
INSERT INTO PROFESORES (dni, nombre, apellido1, apellido2, direccion, titulo, gana) VALUES ('32432455', 'Juan', 'Arch', 'L�pez', 'Puerta Negra, 4', 'Ing. Inform�tica', 7500);
INSERT INTO PROFESORES (dni, nombre, apellido1, apellido2, direccion, titulo, gana) VALUES ('43215643', 'Mar�a', 'Oliva', 'Rubio', 'Juan Alfonso, 32', 'Lda. Fil. Inglesa', 5400);

INSERT INTO CURSOS (cod_curso, nombre_curso, maximo_alumnos, fecha_inicio, fecha_fin, num_horas, dni_profesor) VALUES (1, 'Ingl�s B�sico', 15, '01/11/00', '22/12/00', 120, '43215643');
INSERT INTO CURSOS (cod_curso, nombre_curso, maximo_alumnos, fecha_inicio, fecha_fin, num_horas, dni_profesor) VALUES (2, 'Administraci�n Linux', NULL, '01/09/00', NULL, 80, '32432455');

INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('123523', 'Lucas', 'Manilva', 'L�pez', 'Alhamar, 3', 'V', '01/11/79', 1);
INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('2567567', 'Antonia', 'L�pez', 'Alcantara', 'Maniqu�, 21', 'M', NULL, 2);
INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('3123689', 'Manuel', 'Alcantara', 'Julian, 2', '2', NULL, 1);
INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('4896765', 'Jos�', 'P�rez', 'Caballar', 'Jarcha, 5', 'V', '03/02/77', 3);


/* 3. Insertar la siguiente tupla en ALUMNOS: */
INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('123523', 'Sergio', 'Navas', 'Retal', NULL, 'P', NULL, 1);


/* 4. Insertar las siguientes tupla en la tabla PROFESORES: */
INSERT INTO PROFESORES (dni, nombre, apellido1, apellido2, direccion, titulo, gana) VALUES ('32432455', 'Juan', 'Arch', 'L�pez', 'Puerta Negra, 4', 'Ing. Inform�tica', NULL);


/* 5. Insertar la siguiente tupla en la tabla ALUMNOS: */
INSERT INTO ALUMNOS (dni, nombre, apellido1, apellido2, direccion, sexo, fecha_nacimiento, curso) VALUES ('789678', 'Mar�a', 'Ja�n', 'Sevilla', 'Martos, 5', 'M', NULL);


/* 6. La fecha de nacimiento de Antonia L�pez est� equivocada. La verdadera es 23 de diciembre de 1976. */
/*SELECT * FROM ALUMNOS;*/
UPDATE ALUMNOS SET fecha_nacimiento = '23/12/76' WHERE nombre = 'Antonia' AND apellido1 = 'L�pez';


/* 7. Cambiar a Antonia L�pez al curso de c�digo 5. */
UPDATE ALUMNOS SET curso = 5 WHERE curso = 2;


/* 8. Eliminar la profesora Laura Jim�nez. */
/* No hay ninguna Laura Jim�nez. Pero podr�a insertar una y luego borrarla.*/


/* 9. Borrar el curso con c�digo 1. */
DELETE FROM CURSOS WHERE cod_curso = 1;


/* 10. A�adir un campo llamado numero_alumnos en la tabla curso. */
ALTER TABLE CURSOS ADD numero_alumnos NUMBER(3);


/* 11. Modificar la fecha de nacimiento a 01/01/2012 en aquellos alumnos que no tengan fecha de nacimiento. */
UPDATE ALUMNOS SET fecha_nacimiento = '01/01/2012' WHERE fecha_nacimiento IS NULL;


/* 12. Borra el campo sexo en la tabla de alumnos. */
ALTER TABLE ALUMNOS DROP sexo;


/* 13. Modificar la tabla profesores para que los profesores de Inform�tica cobren 
 * un 20 por ciento m�s de lo que cobran actualmente. */
UPDATE PROFESORES SET gana = gana * 1.20 WHERE titulo = 'Ing. Inform�tica';


/* 14. Modifica el dni de Juan Arch a 1234567. */
UPDATE PROFESORES SET dni = '1234567' WHERE nombre = 'Juan' AND apellido1 = 'Arch';


/* 15. Modifica el dni de todos los profesores de inform�tica para que tengan el dni 7654321. */
UPDATE PROFESORES SET dni = '7654321' WHERE titulo = 'Ing. Inform�tica';


/* 16. Cambia el sexo de la alumna Mar�a Ja�n a F. */
ALTER TABLE ALUMNOS ADD sexo VARCHAR2(1);
UPDATE ALUMNOS SET sexo = 'F' WHERE nombre = 'Mar�a' AND apellido1 = 'Ja�n';













