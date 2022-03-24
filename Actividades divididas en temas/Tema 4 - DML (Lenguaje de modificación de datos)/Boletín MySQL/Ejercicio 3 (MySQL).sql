create database db_exampleName;
create user 'dummy'@'%' identified by 'dummy';
grant all on db_exampleName.* to 'dummy'@'%';


CREATE TABLE DEPARTAMENTO
(
	id				INT(10),
	nombre			VARCHAR(50),
	
	CONSTRAINT PK_id_departamento PRIMARY KEY (id)
);


CREATE TABLE GRADO
(
	id				INT(10),
	nombre			VARCHAR(100),
	
	CONSTRAINT PK_id_grado PRIMARY KEY (id)
);


CREATE TABLE CURSO_ESCOLAR
(
	id				INT(10),
	anyo_inicio		YEAR(4),
	anyo_fin		YEAR(4),
	
	CONSTRAINT PK_id_curso_escolar PRIMARY KEY (id)
);


CREATE TABLE PROFESOR
(
	id_profesor			INT(10),
	id_departamento		INT(10),
);


CREATE TABLE PERSONA
(
	id					INT(10),
	nif					VARCHAR(9),
	nombre				VARCHAR(25),
	apellido1			VARCHAR(50),
	apellido2			VARCHAR(50),
	ciudad				VARCHAR(25),
	direccion			VARCHAR(50),
	telefono			VARCHAR(9),
	fecha_nacimiento	DATE,
	sexo				ENUM('H','M'),
	tipo				ENUM(...),
	
	CONSTRAINT PK_id_persona PRIMARY KEY (id)
);

CREATE TABLE ASIGNATURA 
(
	id					INT(10),
	nombre				VARCHAR(100),
	creditos			FLOAT,
	tipo				ENUM(...),
	curso				TINYINT(3),
	cuatrimestre		TINYINT(3),
	id_profesor			INT(10),
	id_grado			INT(10),
	
	CONSTRAINT PK_id_asignatura PRIMARY KEY (id)
);

CREATE TABLE ALUMNOS_SE_MATRICULA_ASIGNATURA 
(
	id_alumno			INT(10),
	id_asignatura		INT(10),
	id_curso_escolar	INT(10),
);

ALTER TABLE PROFESOR ADD CONSTRAINT FK_id_departamento FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO (id);
ALTER TABLE PROFESOR ADD CONSTRAINT FK_id_profesor FOREIGN KEY (id_profesor) REFERENCES PERSONA (id);
ALTER TABLE ASIGNATURA ADD CONSTRAINT FK_id_profesor_asignatura FOREIGN KEY (id_profesor) REFERENCES PROFESOR (id_profesor);
ALTER TABLE ASIGNATURA ADD CONSTRAINT FK_id_grado FOREIGN KEY (id_grado) REFERENCES GRADO (id);
ALTER TABLE ALUMNO_SE_MATRICULA_ASIGNATURA ADD CONSTRAINT FK_id_alumno FOREIGN KEY (id_alumno) REFERENCES PERSONA (id); 
ALTER TABLE ALUMNO_SE_MATRICULA_ASIGNATURA ADD CONSTRAINT FK_id_asignatura FOREIGN KEY (id_asignatura) REFERENCES ASIGNATURA (id);
ALTER TABLE ALUMNO_SE_MATRICULA_ASIGNATURA ADD CONSTRAINT FK_id_curso_escolar FOREIGN KEY (id_curso_escolar) REFERENCES CURSO_ESCOLAR (id);



