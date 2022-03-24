CREATE TABLE TEMA
(cod_tema 		VARCHAR2(10) NOT NULL,
denominacion	VARCHAR2(20) NOT NULL,
cod_tema_padre	VARCHAR2(10) NOT NULL,

CONSTRAINT PK_cod_tema PRIMARY KEY (cod_tema)

);


CREATE TABLE LIBRO
(cod_libro		VARCHAR2(10) NOT NULL,
titulo			VARCHAR2(30) NOT NULL,
f_creacion		DATE,
cod_tema		VARCHAR2(10) NOT NULL,
autor_principal	VARCHAR2(20) NOT NULL,

CONSTRAINT PK_cod_libro PRIMARY KEY (cod_libro)

);


CREATE TABLE AUTOR
(cod_autor		VARCHAR2(10) NOT NULL,
nombre			VARCHAR2(20) NOT NULL,
f_nacimiento	DATE,
libro_principal	VARCHAR2(30) NOT NULL,

CONSTRAINT PK_cod_autor PRIMARY KEY (cod_autor)

);


CREATE TABLE LIBRO_AUTOR
(cod_libro		VARCHAR2(10) NOT NULL,
cod_autor		VARCHAR2(10) NOT NULL,
orden			VARCHAR2(10) NOT NULL,

CONSTRAINT PK_cod_libro_y_autor PRIMARY KEY (cod_libro, cod_autor)

);


CREATE TABLE EDITORIAL
(cod_editorial		VARCHAR2(10) NOT NULL,
denominacion		VARCHAR2(20) NOT NULL,

CONSTRAINT PK_cod_editorial PRIMARY KEY (cod_editorial)

);


CREATE TABLE PUBLICACIONES
(cod_editorial		VARCHAR2(10) NOT NULL,
cod_libro			VARCHAR2(10) NOT NULL,
precio				NUMBER(5,2) NOT NULL,
f_publicacion		DATE,

CONSTRAINT PK_cod_editorial_y_libro PRIMARY KEY (cod_editorial, cod_libro)

);


ALTER TABLE TEMA 
ADD CONSTRAINT FK_cod_tema_padre FOREIGN KEY (cod_tema_padre) REFERENCES TEMA (cod_tema);

ALTER TABLE LIBRO
ADD CONSTRAINT FK_cod_tema FOREIGN KEY (cod_tema) REFERENCES TEMA (cod_tema);

ALTER TABLE LIBRO
ADD CONSTRAINT FK_autor_principal FOREIGN KEY (autor_principal) REFERENCES AUTOR (cod_autor);

ALTER TABLE AUTOR
ADD CONSTRAINT FK_libro_principal FOREIGN KEY (libro_principal) REFERENCES LIBRO (cod_libro);

ALTER TABLE LIBRO_AUTOR
ADD CONSTRAINT FK_cod_libro FOREIGN KEY (cod_libro) REFERENCES LIBRO (cod_libro);

ALTER TABLE LIBRO_AUTOR
ADD CONSTRAINT FK_cod_autor FOREIGN KEY (cod_autor) REFERENCES AUTOR (cod_autor);

ALTER TABLE PUBLICACIONES
ADD CONSTRAINT FK_cod_editorial FOREIGN KEY (cod_editorial) REFERENCES EDITORIAL (cod_editorial);

ALTER TABLE PUBLICACIONES
ADD CONSTRAINT FK_cod_libro_publicaciones FOREIGN KEY (cod_libro) REFERENCES LIBRO (cod_libro);




















