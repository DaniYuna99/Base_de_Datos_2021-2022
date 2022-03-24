/************************************/
/*       DML - Simulacro DML        */
/************************************/

/*alter session set "_oracle_script"=true;  
create user dml_simulacrodml identified by dml_simulacrodml;
GRANT CONNECT, RESOURCE, DBA TO dml_simulacrodml;*/


/* APARTADO 1 */
CREATE TABLE PROFESOR 
(
	idProfesor			VARCHAR2(10),
	nif_p				VARCHAR2(10),
	nombre				VARCHAR2(30),
	telefono			NUMBER(15),
	
	CONSTRAINT PK_idProfesor PRIMARY KEY (idProfesor)
);

CREATE TABLE ASIGNATURA
(
	codAsignatura			VARCHAR2(5),
	nombre					VARCHAR2(30),
	idProfesor				VARCHAR2(10),
	
	CONSTRAINT PK_codAsignatura PRIMARY KEY (codAsignatura),
	CONSTRAINT FK_idProfesor_asignatura FOREIGN KEY (idProfesor) REFERENCES PROFESOR (idProfesor)
);

CREATE TABLE ALUMNO
(
	numMatricula			NUMBER(5),
	nombre					VARCHAR2(30),
	fechaNacimiento			DATE,
	telefono				NUMBER(15),
	
	CONSTRAINT PK_numMatricula PRIMARY KEY (numMatricula)
);

CREATE TABLE RECIBE
(
	numMatricula			NUMBER(5),
	codAsignatura			VARCHAR2(5),
	cursoEscolar			VARCHAR2(10),
	
	CONSTRAINT PK_numMatricula_y_demas_Recibe PRIMARY KEY (numMatricula, codAsignatura, cursoEscolar),
	CONSTRAINT FK_numMatricula_Recibe FOREIGN KEY (numMatricula) REFERENCES ALUMNO (numMatricula),
	CONSTRAINT FK_codAsignatura FOREIGN KEY (codAsignatura) REFERENCES ASIGNATURA (codAsignatura)
);

/* SELECT * FROM PROFESOR; */
/* SELECT * FROM ASIGNATURA; */
/* SELECT * FROM ALUMNO; */
/* SELECT * FROM RECIBE; */

/* APARTADO 2 */
INSERT INTO PROFESOR (idProfesor, nif_p, nombre, telefono) VALUES ("98765432", "12345678A", "Oak", 23452345);
INSERT INTO PROFESOR (idProfesor, nif_p, nombre, telefono) VALUES ("12312312", "23456234B", "Elm", 90909090);

INSERT INTO ASIGNATURA VALUES ("1", "Matem�ticas", "98765432");
INSERT INTO ASIGNATURA VALUES ("2", "Ingl�s", "12312312");
INSERT INTO ASIGNATURA VALUES ("3", "Lengua", "98765432");
INSERT INTO ASIGNATURA VALUES ("4", "Combates Pok�mon", "12312312");

INSERT INTO ALUMNO VALUES (1, "Titania", TO_DATE('01/06/1993', 'DD/MM/YYYY'), 678678678);
INSERT INTO ALUMNO VALUES (2, "Eliwood", TO_DATE('02/07/1994', 'DD/MM/YYYY'), 34343434);
INSERT INTO ALUMNO VALUES (3, "Soren", TO_DATE('03/08/1997', 'DD/MM/YYYY'), 13131313;
INSERT INTO ALUMNO VALUES (4, "Hector", TO_DATE('04/08/1994', 'DD/MM/YYYY'), 76767676;
INSERT INTO ALUMNO VALUES (5, "Oscar", TO_DATE('05/03/1998', 'DD/MM/YYYY'), 43434343;
INSERT INTO ALUMNO VALUES (6, "Mist", TO_DATE('06/11/2004', 'DD/MM/YYYY'), 89898989;
INSERT INTO ALUMNO VALUES (7, "Kieran", TO_DATE('09/01/2001', 'DD/MM/YYYY', 35353535);
INSERT INTO ALUMNO VALUES (8, "Oliver", TO_DATE('22/02/2003', 'DD/MM/YYYY'), 80808080;
INSERT INTO ALUMNO VALUES (9, "Mia", TO_DATE('24/03/2007', 'DD/MM/YYYY'), 10101010;
INSERT INTO ALUMNO VALUES (10, "Ramza", TO_DATE('30/04/1998', 'DD/MM/YYYY'), 57575757;

ALTER TABLE ALUMNO ADD codAsignatura1 VARCHAR2(5);
ALTER TABLE ALUMNO ADD codAsignatura2 VARCHAR2(5);
UPDATE ALUMNO SET (codAsignatura1 = 1) AND (codAsignatura2 = 2) WHERE numMatricula = 1;
UPDATE ALUMNO SET (codAsignatura1 = 3) AND (codAsignatura2 = 2) WHERE numMatricula = 2;
UPDATE ALUMNO SET (codAsignatura1 = 1) AND (codAsignatura2 = 2) WHERE numMatricula = 3;
UPDATE ALUMNO SET (codAsignatura1 = 2) AND (codAsignatura2 = 4) WHERE numMatricula = 4;
UPDATE ALUMNO SET (codAsignatura1 = 3) AND (codAsignatura2 = 1) WHERE numMatricula = 5;
UPDATE ALUMNO SET (codAsignatura1 = 1) AND (codAsignatura2 = 3) WHERE numMatricula = 6;
UPDATE ALUMNO SET (codAsignatura1 = 2) AND (codAsignatura2 = 1) WHERE numMatricula = 7;
UPDATE ALUMNO SET (codAsignatura1 = 1) AND (codAsignatura2 = 2) WHERE numMatricula = 8;
UPDATE ALUMNO SET (codAsignatura1 = 4) AND (codAsignatura2 = 3) WHERE numMatricula = 9;
UPDATE ALUMNO SET (codAsignatura1 = 3) AND (codAsignatura2 = 4) WHERE numMatricula = 10;


/* APARTADO 3 */
	/*No fu*/
INSERT INTO ALUMNO VALUES (11, "Ephraim", TO_DATE('29/03/2002', 'DD/MM/YYYY'), 85858585);
INSERT INTO ALUMNO VALUES (11, "Eirika", TO_DATE('29/03/2002', 'DD/MM/YYYY'), 85858585);


/* APARTADO 4 */
INSERT INTO ALUMNO VALUES (13, "Serra", TO_DATE('10/01/1996', 'DD/MM/YYYY'), NULL;
INSERT INTO ALUMNO VALUES (14, "Agrias", TO_DATE('10/11/1992', 'DD/MM/YYYY'), NULL;
INSERT INTO ALUMNO VALUES (15, "Delita", TO_DATE('30/04/1995', 'DD/MM/YYYY'), NULL;


/* APARTADO 5 */
UPDATE ALUMNO SET (telefono = 18181818) WHERE (nombre LIKE 'Serra');
UPDATE ALUMNO SET (telefono = 23232323) WHERE (nombre LIKE 'Agrias');
UPDATE ALUMNO SET (telefono = 29292929) WHERE (nombre LIKE 'Delita');


/* APARTADO 6 */
UPDATE ALUMNO SET (fechaNacimiento = TO_DATE('22/07/1981', 'DD/MM/YYYY') WHERE EXTRACT (YEAR FROM fechaNacimiento) > 2000;


/* APARTADO 7 */
 /*SELECT * FROM PROFESOR WHERE nif_p NOT LIKE '9%' AND telefono IS NOT NULL;*/
UPDATE PROFESOR SET especialidad = "informatica" WHERE nif_p NOT LIKE '9%' AND telefono IS NOT NULL;


/* APARTADO 8 */
--SELECT * FROM ASIGNATURA WHERE codAsignatura = '80066';
DELETE FROM ASIGNATURA WHERE codAsignatura = '80066';


/* APARTADO 9*/
	--Incompleto, no hecho.


/* APARTADO 10 */
ALTER TABLE RECIBE DROP CONSTRAINT FK_numMatricula_Recibe;
ALTER TABLE RECIBE ADD CONSTRAINT FK_numMatricula_Recibe FOREIGN KEY (codAsignatura) REFERENCES ASIGNATURA (codAsignatura);

--Incompleto, no hecho.


/* APARTADO 11 */
--SELECT * FROM PROFESOR;
DELETE FROM PROFESOR WHERE idProfesor = 555;
DELETE FROM PROFESOR WHERE idProfesor = 666;


/* APARTADO 12 */
SELECT * FROM ALUMNO;
UPDATE ALUMNO SET nombre = UPPER(nombre);


/* APARTADO 13 */
CREATE TABLE ALUMNO_BACKUP
(
	numMatricula			NUMBER(5),
	nombre					VARCHAR2(30),
	fechaNacimiento			DATE,
	telefono				NUMBER(15),
	
	CONSTRAINT PK_numMatricula PRIMARY KEY (numMatricula)
);

INSERT INTO ALUMNO_BACKUP SELECT * FROM ALUMNO;
ALTER TABLE ALUMNO_BACKUP ADD especialidad VARCHAR2(20);


/* EXTRA: Los alumnos que hayan nacido en 1998 
 * deben de tener la especialidad "Informática*/
UPDATE ALUMNO SET (especialidad = 'Informática') WHERE EXTRACT(YEAR FROM fechaNacimiento) = 1998;

/* EXTRA: Los alumnos que no hayan nacido en 1998
 * no deben tienen especialidad*/
UPDATE ALUMNO SET (especialidad = "No tiene") WHERE EXTRACT(YEAR FROM fechaNacimiento) != 1998;


/* secuencia para incrementar un número cada vez */
CREATE SEQUENCE sq_codCaladero
	START WITH 1
	INCREMENT BY 1;






















