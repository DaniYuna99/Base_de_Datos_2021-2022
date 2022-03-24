CREATE TABLE EQUIPOS
(cod_equipo		VARCHAR2(4),
nombre			VARCHAR2(30) NOT NULL,
localidad		VARCHAR2(15),

CONSTRAINT pk_cod_equipo PRIMARY KEY (cod_equipo)

);

CREATE TABLE JUGADORES
(cod_jugador		VARCHAR2(4),
nombre				VARCHAR2(30) NOT NULL,
fecha_nacimiento	DATE,
demarcacion			VARCHAR2(10),
cod_equipo			VARCHAR2(4),	

CONSTRAINT pk_cod_jugador PRIMARY KEY (cod_jugador),
CONSTRAINT fk_cod_equipo FOREIGN KEY (cod_equipo) REFERENCES EQUIPOS(cod_equipo)

);


CREATE TABLE PARTIDOS
(cod_partido			VARCHAR2(4),
cod_equipo_local		VARCHAR2(4),
cod_equipo_visitante	VARCHAR2(4),
fecha					DATE,
competicion				VARCHAR2(4),
jornada					VARCHAR2(20),

CONSTRAINT pk_cod_partido PRIMARY KEY (cod_partido),
CONSTRAINT fk_cod_equipo_local FOREIGN KEY (cod_equipo_local) REFERENCES EQUIPOS (cod_equipo),
CONSTRAINT fk_cod_equipo_visitante FOREIGN KEY (cod_equipo_visitante) REFERENCES EQUIPOS (cod_equipo)

);


CREATE TABLE INCIDENCIAS
(num_incidencia			VARCHAR2(6),
cod_partido				VARCHAR2(6),
cod_jugador				VARCHAR2(4),
minuto					NUMBER(2),
tipo					VARCHAR2(20) NOT NULL,

CONSTRAINT PK_num_incidencia PRIMARY KEY (num_incidencia),
CONSTRAINT FK_cod_partido FOREIGN KEY (cod_partido) REFERENCES PARTIDOS (cod_partido),
CONSTRAINT FK_cod_jugador FOREIGN KEY (cod_jugador) REFERENCES JUGADORES (cod_jugador)

);


ALTER TABLE EQUIPOS
ADD goles_marcados NUMBER(3);

	