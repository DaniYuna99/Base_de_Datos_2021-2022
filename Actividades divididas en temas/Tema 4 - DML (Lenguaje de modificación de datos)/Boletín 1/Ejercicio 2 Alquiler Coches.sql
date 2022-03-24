CREATE TABLE VEHICULOS
(matricula			VARCHAR2(7),
marca				VARCHAR2(10) NOT NULL,
modelo				VARCHAR2(10) NOT NULL,
fecha_compra		DATE,
precio_por_dia		NUMBER(5,2),
total_kilometros	NUMBER(6,2),

CONSTRAINT PK_matricula PRIMARY KEY (matricula)

);


CREATE TABLE CLIENTES
(dni				VARCHAR2(9),
nombre				VARCHAR2(30) NOT NULL,
nacionalidad		VARCHAR2(30),
fecha_nacimiento	DATE,
direccion			VARCHAR2(50),

CONSTRAINT PK_dni PRIMARY KEY (dni)

);


CREATE TABLE ALQUILERES
(matricula			VARCHAR2(7) NOT NULL,
dni					VARCHAR2(10) NOT NULL,
fecha_hora			DATE,
num_dias			NUMBER(2) NOT NULL,
kilometros			NUMBER(4),

CONSTRAINT PK_matricula_dni_fechaHora PRIMARY KEY (matricula, dni, fecha_hora)

);