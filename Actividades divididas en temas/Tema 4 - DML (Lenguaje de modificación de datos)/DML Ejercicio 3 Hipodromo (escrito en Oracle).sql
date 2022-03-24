/************************************************/
/*	    DML - EJERCICIO 3 - HIPODROMO 		    */
/************************************************/


/*----- CREACION USUARIO -----*/

/* alter session set "_oracle_script"=true;  
create user dml_ejercicio3hipodromo identified by dml_ejercicio3hipodromo;
GRANT CONNECT, RESOURCE, DBA TO dml_ejercicio3hipodromo; */



/*----- TABLAS -----*/

CREATE TABLE CABALLOS 
(
	codCaballo				VARCHAR2(4),
	nombre					VARCHAR2(20) NOT NULL,
	peso					NUMBER(3),
	fecha_nacimiento		DATE,
	propietario				VARCHAR2(25),
	nacionalidad			VARCHAR2(20),
	
	CONSTRAINT PK_codCaballo PRIMARY KEY (codCaballo),
	CONSTRAINT CHK1_peso_caballos CHECK (peso > 240) AND (peso < 300),
	CONSTRAINT CHK2_nacionalidad_caballos CHECK (nacionalidad = UPPER(nacionalidad))
);


CREATE TABLE PARTICIPACIONES
(
	codCaballo				VARCHAR2(4),
	codCarrera				VARCHAR2(4),
	dorsal					NUMBER(2) NOT NULL,
	jockey					VARCHAR2(10) NOT NULL,
	posicionFinal			NUMBER(2),
	
	CONSTRAINT PK_codCaballoYcodCarrera PRIMARY KEY (codCaballo, codCarrera),
	CONSTRAINT CHK3_posicionFinal CHECK (posicionFinal > 0)
);


CREATE TABLE CARRERAS 
(
	codCarrera				VARCHAR2(4),
	fecha_y_hora			DATE,
	importe_premio			NUMBER(6),
	apuesta_limite			NUMBER(5,2),
	
	CONSTRAINT PK_codCarrera PRIMARY KEY (codCarrera),
	/*CONSTRAINT CHK4_fechayhora CHECK (TO_CHAR (fecha_hora, 'hh:mi') BETWEEN '09:00' AND '14:20'),*/
	CONSTRAINT CHK5_apuestalimite CHECK (apuesta_limite < 20000)
);


CREATE TABLE APUESTAS
(
	dniCliente				VARCHAR2(10),
	codCaballo				VARCHAR2(4),
	codCarrera				VARCHAR2(4),
	importe					NUMBER(6) NOT NULL DEFAULT 300,
	tantoporuno				NUMBER(4,2),
	
	CONSTRAINT PK_dniCliente_y_demas PRIMARY KEY (dniCliente, codCaballo, codCarrera),
	CONSTRAINT CHK6_tantoporuno CHECK (tantoporuno > 1)
);


CREATE TABLE CLIENTES
(
	dni						VARCHAR2(10),
	nombre					VARCHAR2(20),
	nacionalidad			VARCHAR2(20),
	
	CONSTRAINT PK_dni_clientes PRIMARY KEY (dni),
	CONSTRAINT CHK7_dni CHECK (regexp_like (dni, '[0-9] {8}', '[A-Z] {1}'),
	CONSTRAINT CHK8_nacionalidad CHECK (nacionalidad = UPPER(nacionalidad))
);


/*----- FOREIGN KEYS -----*/

ALTER TABLE PARTICIPACIONES ADD CONSTRAINT FK_codCaballo_participaciones FOREIGN KEY (codCaballo) REFERENCES CABALLOS (codCaballo);
ALTER TABLE PARTICIPACIONES ADD CONSTRAINT FK_codCarrera_participaciones FOREIGN KEY (codCarrera) REFERENCES CARRERAS (codCarrera);

ALTER TABLE APUESTAS ADD CONSTRAINT FK_dniCliente_apuestas FOREIGN KEY (dniCliente) REFERENCES CLIENTES (dni) ON DELETE CASCADE;
ALTER TABLE APUESTAS ADD CONSTRAINT FK_codCaballo_apuestas FOREIGN KEY (codCaballo) REFERENCES CABALLOS (codCaballo) ON DELETE CASCADE;
ALTER TABLE APUESTAS ADD CONSTRAINT FK_codCarrera_apuestas FOREIGN KEY (codCarrera) REFERENCES CARRERAS (codCarrera) ON DELETE CASCADE;



/*----- EJERCICIOS -----*/    


/*1. Inserta el registro o registros necesarios para guardar la siguiente informacion:
       
	El cliente escoces realiza una apuesta al caballo mas pesado de la primera carrera que se corra en 
	el verano de 2009 por un importe de 2000 euros. En ese momento ese caballo en esa carrera se paga 30 a 1.
	Si es necesario algun dato inventatelo, pero solo los datos que sean estrictamente necesaria.*/

INSERT INTO CLIENTES (dni, nombre, nacionalidad) VALUES ('12345678A', 'Demoman', 'Escocesa');
INSERT INTO CABALLOS (codCaballo, peso) VALUES ('1234', 299);
INSERT INTO CARRERAS (codCarrera, fecha_y_hora) VALUES ('4321', '');


/*2. Inscribe a 2 caballos en la carrera cuyo codigo es C6. La carrera aun no se ha celebrado. 
 * Inventate los jockeys y los dorsales y los caballos.*/
       
INSERT INTO CABALLOS VALUES ('C6', TO_DATE('10/10/2001', 'DD/MM/YYYY'), 'Manolo' , 'Arabe');
INSERT INTO CABALLOS (codCaballo) VALUES ('C6');

INSERT INTO CARRERAS VALUES ('2341');

INSERT INTO PARTICIPACIONES (codCaballo, codCarrera, dorsal, jockey) VALUES ('C6', '2341', 9, 'Elisabeth');
INSERT INTO PARTICIPACIONES (codCaballo, codCarrera, dorsal, jockey) VALUES ('C6', '2341', 10, 'Gyro');


/*3. Inserta dos carreras con los datos que creas necesario.*/

INSERT INTO CARRERAS (codCarrera, fecha_y_hora, importe_premio, apuesta_limite) VALUES ('QWER', TO_DATE('2O10-05-10 10:30', 'YYYY-MM-DD HH24:MI'), 1500, 20);
INSERT INTO CARRERAS (codCarrera, fecha_y_hora, importe_premio, apuesta_limite) VALUES ('TYUI', TO_DATE('2O11-08-13 01:30', 'YYYY-MM-DD HH24:MI'), 2500, 10);


/*4. Quita el campo propietario de la tabla caballos*/
ALTER TABLE CABALLOS DROP COLUMN propietario;

/*5. Anadir las siguientes restricciones a las tablas:
 NO HECHO	- En la Tabla Participaciones los nombres de los jockeys tienen siempre las iniciales en mayusculas.
 NO HECHO   - La temporada de carreras transcurre del 10 de Marzo al 10 de Noviembre.
 		    
 		    
 		    
 		    - La nacionalidad de los caballos solo puede ser Espanola, Britanica o Arabe.
      		 Si los datos que has introducidos no cumplen las restricciones haz los cambios necesarios para ellos.*/
      
UPDATE CABALLOS SET nacionalidad = "Arabe" WHERE nacionalidad = 'Española';
UPDATE CABALLOS SET nacionalidad = "Arabe" WHERE nacionalidad = 'Inglesa';
UPDATE CABALLOS SET nacionalidad = "Arabe" WHERE nacionalidad = 'Arabe';

/*6. Borra las carreras en las que no hay caballos inscritos.*/
    
DELETE FROM 


/*7. Anade un campo llamado codigo en el campo clientes, que no permita valores nulos ni repetidos*/
    
ALTER TABLE CLIENTES ADD codigo VARCHAR2(10) UNIQUE NOT NULL;


/*8. Nos hemos equivocado y el codigo C6 de la carrera en realidad es C66.*/
    

/*9. Anade un campo llamado premio a la tabla apuestas.*/

ALTER TABLE APUESTAS ADD premio NUMBER(5);


/*10. Borra todas las tablas y datos con el numero menor de instrucciones posibles.*/
DROP TABLE CABALLOS CASCADE CONSTRAINT;
DROP TABLE PARTICIPACIONES CASCADE CONSTRAINT;
DROP TABLE CARRERAS CASCADE CONSTRAINT;
DROP TABLE APUESTAS CASCADE CONSTRAINT;
DROP TABLE CLIENTES CASCADE CONSTRAINT;






