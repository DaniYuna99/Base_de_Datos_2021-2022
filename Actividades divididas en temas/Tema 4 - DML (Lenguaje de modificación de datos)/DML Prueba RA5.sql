SELECT * FROM ALUMNO;
SELECT * FROM ALUMNO_ASIGNATURA;
SELECT * FROM ASIGNATURA;
SELECT * FROM PERSONA;
SELECT * FROM PROFESOR;
SELECT * FROM TITULACION;


--Apartado 1
SAVEPOINT antes_apartado1;

INSERT INTO PERSONA VALUES ('20022002K', 'Daniel', 'Carpintero', 'Sevilla', 'Calle Parroso', 24, 345345344, TO_DATE('30/10/1999', 'DD/MM/YYYY'), 1); 
INSERT INTO ALUMNO VALUES ('A055555', '20022002K');
INSERT INTO ALUMNO_ASIGNATURA VALUES ('A055555', '160002', '20');


--Apartado 2
SAVEPOINT antes_apartado2;

INSERT INTO PERSONA VALUES ('77222122K', 'Marta', 'L�pez Martos', 'Sevilla', 'Calle Tarfia', 9, 615891432, TO_DATE('22/07/1981', 'DD/MM/YYYY'), 0);
INSERT INTO PROFESOR VALUES ('LMAO', '77222122K');
UPDATE ASIGNATURA SET idprofesor = 'LMAO' AND idtitulacion = '130110' WHERE nombre like 'Contabilidad';


--Apartado 3
SAVEPOINT antes_apartado3;

CREATE TABLE ALUMNOS_MUYREPETIDORES
(
	idAsignatura			VARCHAR2(6),
	dni						VARCHAR2(11),
	nombre					VARCHAR2(30),
	apellido				VARCHAR2(30),
	telefono				VARCHAR2(9),
	
	CONSTRAINT PK_dni_alumnosMuyRepetidores PRIMARY KEY (dni)
);

INSERT INTO ALUMNOS_MUYREPETIDORES SELECT * FROM ALUMNO_ASIGNATURA WHERE numeromatricula >= 3;


