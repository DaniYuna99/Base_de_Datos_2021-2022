CREATE TABLE BARCOS
(matricula			VARCHAR2(7),
nombre				VARCHAR2(30),
clase				VARCHAR2(30),
armador				VARCHAR2(30),
capacidad			NUMBER(5,2),
nacionalidad		VARCHAR2(30),

CONSTRAINT PK_matricula_barcos PRIMARY KEY (matricula)
CONSTRAINT CH_barcos CHECK (regexp_like (matricula, '[A-Z] {2} [-] {1} [0-9] {4}'))

);

INSERT INTO BARCOS (nacionalidad) VALUES ('español');


CREATE TABLE LOTES
(codigo					VARCHAR2(15),
matricula				VARCHAR2(7),
numkilos				NUMBER(5,2),
precioporkilosalida		NUMBER(4,2),
precioporkiloadjudicado	NUMBER(4,2),
fechaventa				DATE NOT NULL,
cod_especie				VARCHAR2(15),

CONSTRAINT PK_codigo_lotes PRIMARY KEY (codigo)

);


CREATE TABLE ESPECIE
(codigo					VARCHAR2(15),
nombre					VARCHAR2(30),
tipo					VARCHAR2(30),
cupoporbarco			NUMBER(5,2),
caladero_principal		VARCHAR2(30),

CONSTRAINT PK_codigo_especie PRIMARY KEY (codigo)

);

INSERT INTO ESPECIE (nombre) VALUES ('pez espada');


CREATE TABLE CALADERO
(codigo					VARCHAR2(15),
nombre					VARCHAR2(30),
ubicacion				VARCHAR2(50),
especie_principal		VARCHAR2(30),

CONSTRAINT PK_codigo_caladero PRIMARY KEY (codigo)
CONSTRAINT CH_caladero CHECK (nombre = UPPER(NOMBRE)),
CONSTRAINT CH_caladero1 CHECK (ubicacion = UPPER (UBICACION))

);


CREATE TABLE FECHAS_CAPTURAS_PERMITIDAS
(cod_especie			VARCHAR2(15),
cod_caladero			VARCHAR2(15),
fecha_inicial			DATE,
fecha_final				DATE,

CONSTRAINT PK_cod_especie_caladero PRIMARY KEY (cod_especie, cod_caladero)
CONSTRAINT CH_fechas_capturas_permitidas CHECK ((fecha_inicial >= to_date('02/02/2022', 'DD/MM/YYYY') AND (fecha_final <= to_date('28/03/2022'))

);


ALTER TABLE LOTES
ADD CONSTRAINT FK_matricula_barcos FOREIGN KEY (matricula) REFERENCES BARCOS (matricula);

ALTER TABLE LOTES
ADD CONSTRAINT FK_cod_especie FOREIGN KEY (cod_especie) REFERENCES ESPECIE (codigo);

ALTER TABLE ESPECIE
ADD CONSTRAINT FK_caladero_principal FOREIGN KEY (caladero_principal) REFERENCES CALADERO (codigo);

ALTER TABLE CALADERO
ADD CONSTRAINT FK_especie_principal FOREIGN KEY (especie_principal) REFERENCES ESPECIE (codigo) ON DELETE SET NULL;
 
ALTER TABLE FECHAS_CAPTURAS_PERMITIDAS
ADD CONSTRAINT FK_cod_especie_fechas FOREIGN KEY (cod_especie) REFERENCES ESPECIE (codigo);

ALTER TABLE FECHAS_CAPTURAS_PERMITIDAS
ADD CONSTRAINT FK_cod_caladero FOREIGN KEY (cod_caladero) REFERENCES CALADERO (codigo);


ALTER TABLE CALADERO
ADD nombre_cientifico VARCHAR2(30);

ALTER TABLE BARCOS
DROP COLUMN armador;


DROP TABLE BARCOS 

DROP TABLE CALADERO 

DROP TABLE ESPECIE

DROP TABLE FECHAS_CAPTURAS_PERMITIDAS 

DROP TABLE LOTES


TO_CHAR(fechafinal, 'DD/MM')
TO_DATE('02/02/2022', 'DD/MM/YYYY')

CONSTRAINT ejer61 CHECK

SELECT TO_DATE('02/02', 'DD/MM') FROM DUAL;






















�




