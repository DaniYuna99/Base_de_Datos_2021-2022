/* alter session set "_oracle_script"=true;  
create user practicaexamen28enero identified by practicaexamen28enero;
GRANT CONNECT, RESOURCE, DBA TO practicaexamen28enero; */

CREATE TABLE FAMILIA 
(
	nombre					VARCHAR2(30),
	caracteristicas			VARCHAR2(300),
	
	CONSTRAINT PK_nombreFamilia PRIMARY KEY (nombre)
);

CREATE TABLE GENERO
(
	nombre					VARCHAR2(30),
	caracteristicas 		VARCHAR2(300),
	nombreFamilia			VARCHAR2(30),
	
	CONSTRAINT PK_nombreGenero PRIMARY KEY (nombre),
	CONSTRAINT FK_nombreFamilia_genero FOREIGN KEY (nombreFamilia) REFERENCES FAMILIA (nombre)
);

CREATE TABLE ESPECIE
(
	nombre 					VARCHAR2(30),
	caracteristicas 		VARCHAR2(300),
	nombreGenero			VARCHAR2(30),
	
	CONSTRAINT PK_nombreEspecie PRIMARY KEY (nombre),
	CONSTRAINT FK_nombreGenero_especie FOREIGN KEY (nombreGenero) REFERENCES GENERO (nombre)
);

CREATE TABLE ZONA
(
	nombre					VARCHAR2(30),
	localidad				VARCHAR2(30),
	extension				NUMBER(5,2),
	protegida				VARCHAR2(2),
	
	CONSTRAINT PK_nombreZona PRIMARY KEY (nombre),
	CONSTRAINT CHK1_protegida CHECK (protegida = UPPER(PROTEGIDA)),
	CONSTRAINT CHK2_protegida CHECK ((protegida LIKE 'SI') OR (protegida LIKE 'NO'))
);

CREATE TABLE PERSONA
(
	dni						VARCHAR2(9),
	nombre					VARCHAR2(30),
	direccion				VARCHAR2(30),
	telefono				NUMBER(15),
	usuario					VARCHAR2(30) UNIQUE,
	
	CONSTRAINT PK_dni PRIMARY KEY (dni)
);

CREATE TABLE COLECCION
(
	precio					NUMBER(4,2),
	fecha_inicio			DATE,
	numEjemplares			NUMBER(3),
	dniPersona				VARCHAR2(9) NOT NULL,
	
	CONSTRAINT PK_dniPersona_coleccion PRIMARY KEY (dniPersona),
	CONSTRAINT FK_dniPersona FOREIGN KEY (dniPersona) REFERENCES PERSONA (dni),
	CONSTRAINT CHK1_numEjemplares CHECK ((1 <= numEjemplares) AND (numEjemplares <= 150))
);

CREATE TABLE EJEMPLAR_MARIPOSA
(
	fecha_captura			DATE,
	hora_captura			TIMESTAMP,
	nombre_comun			VARCHAR2(30),
	precio_ejemplar			NUMBER(4,2),
	nombreEspecie			VARCHAR2(30) NOT NULL,
	nombreZona				VARCHAR2(30) NOT NULL,
	dniPersona				VARCHAR2(9) NOT NULL,
	fecha_coleccion			DATE,
	dniPersonaColeccion		VARCHAR2(9),
	
	CONSTRAINT PK_ejemplarMariposa_varios PRIMARY KEY (fecha_captura, hora_captura, nombreEspecie, nombreZona, dniPersona),
	CONSTRAINT FK_nombreEspecie_ejemplarMari FOREIGN KEY (nombreEspecie) REFERENCES ESPECIE (nombre),
	CONSTRAINT FK_nombreZona_ejemplarMari FOREIGN KEY (nombreZona) REFERENCES ZONA (nombre),
	CONSTRAINT FK_dniPersona_ejemplarMari FOREIGN KEY (dniPersona) REFERENCES PERSONA (dni),
	CONSTRAINT FK_dniPersonaColeccion_ejemplarMari FOREIGN KEY (dniPersonaColeccion) REFERENCES COLECCION (dniPersona),
	CONSTRAINT CHK1_precioEjemplar CHECK (precio_ejemplar > 0)
);		


ALTER TABLE PERSONA ADD apellidos VARCHAR2(60);
ALTER TABLE ZONA ADD CONSTRAINT CHK1_extension CHECK ((100 <= extension) AND (extension <= 1500));
ALTER TABLE EJEMPLAR_MARIPOSA DROP CONSTRAINT CHK1_precioEjemplar;








