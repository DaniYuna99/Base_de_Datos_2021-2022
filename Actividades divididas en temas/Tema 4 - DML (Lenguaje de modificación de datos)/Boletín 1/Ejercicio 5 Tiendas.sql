CREATE TABLE ARTICULOS
(articulo			VARCHAR2(20) NOT NULL,
cod_fabricante		NUMBER(3) NOT NULL,
peso				NUMBER(3) NOT NULL,
categoria			VARCHAR2(10) NOT NULL,
precio_venta		NUMBER(4,2),
precio_costo		NUMBER(4,2),
existencias			NUMBER(5),

CONSTRAINT PK_articulo_codfabricante_peso_categoria PRIMARY KEY (articulo, cod_fabricante, peso, categoria),
CONSTRAINT CHK_categoria CHECK (regexp_like (categoria, '[A-Z] {3}'))

);

CREATE TABLE TIENDAS
(nif			VARCHAR2(10) NOT NULL,
nombre			VARCHAR2(20),
direccion		VARCHAR2(20),
poblacion		VARCHAR2(20),
provincia		VARCHAR2(20),
codpostal		NUMBER(5),

CONSTRAINT PK_nif PRIMARY KEY (nif),
CONSTRAINT CHK_provincia CHECK (provincia = UPPER(PROVINCIA))

);

CREATE TABLE FABRICANTES
(cod_fabricante		NUMBER(3) NOT NULL,
nombre				VARCHAR2(15),
pais				VARCHAR2(15),

CONSTRAINT PK_cod_fabricante PRIMARY KEY (cod_fabricante),
CONSTRAINT CHK_nombre CHECK (nombre = UPPER(NOMBRE)),
CONSTRAINT CHK_pais CHECK (pais = UPPER(PAIS))

);

CREATE TABLE PEDIDOS
(nif				VARCHAR2(10) NOT NULL,
articulo			VARCHAR2(20) NOT NULL,
cod_fabricante		NUMBER(3) NOT NULL,
peso				NUMBER(3) NOT NULL,
categoria			VARCHAR2(10) NOT NULL,
fecha_pedido		DATE NOT NULL,
unidades_pedidas	NUMBER(4),

CONSTRAINT PK_nif_yelresto_pedidos PRIMARY KEY (nif, articulo, cod_fabricante, peso, categoria, fecha_pedido)

);

CREATE TABLE VENTAS	
(nif				VARCHAR2(10) NOT NULL,
articulo			VARCHAR2(20) NOT NULL,
cod_fabricante		NUMBER(3) NOT NULL,
peso				NUMBER(3) NOT NULL,
categoria			VARCHAR2(10) NOT NULL,
fecha_venta			DATE DEFAULT sysdate,
unidades_vendidas	NUMBER(4),

CONSTRAINT PK_nif_yelresto_ventas PRIMARY KEY (nif, articulo, cod_fabricante, peso, categoria, fecha_venta)

);


ALTER TABLE ARTICULOS ADD CONSTRAINT FK_cod_fabricante_articulos FOREIGN KEY (cod_fabricante) REFERENCES FABRICANTES (cod_fabricante);

ALTER TABLE PEDIDOS ADD CONSTRAINT FK_cod_fabricante_pedidos FOREIGN KEY (cod_fabricante) REFERENCES FABRICANTES (cod_fabricante);
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_articulo_pedidos FOREIGN KEY (articulo) REFERENCES ARTICULOS (articulo) ON DELETE CASCADE;
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_cod_fabricante_pedidos2 FOREIGN KEY (cod_fabricante) REFERENCES ARTICULOS (cod_fabricante) DELETE ON CASCADE;
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_peso_pedidos FOREIGN KEY (peso) REFERENCES ARTICULOS (peso) DELETE ON CASCADE;
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_categoria_pedidos FOREIGN KEY (categoria) REFERENCES ARTICULOS (categoria) DELETE ON CASCADE;
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_nif_pedidos FOREIGN KEY (nif) REFERENCES TIENDAS (nif);

ALTER TABLE VENTAS ADD CONSTRAINT FK_cod_fabricante_ventas FOREIGN KEY (cod_fabricante) REFERENCES FABRICANTES (cod_fabricante);
ALTER TABLE VENTAS ADD CONSTRAINT FK_articulo_ventas FOREIGN KEY (articulo) REFERENCES ARTICULOS (articulo) DELETE ON CASCADE;
ALTER TABLE VENTAS ADD CONSTRAINT FK_cod_fabricante_ventas2 FOREIGN KEY (cod_fabricante) REFERENCES ARTICULOS (cod_fabricante) ON DELETE CASCADE;
ALTER TABLE VENTAS ADD CONSTRAINT FK_peso_ventas FOREIGN KEY (peso) REFERENCES ARTICULOS (peso) DELETE ON CASCADE;
ALTER TABLE VENTAS ADD CONSTRAINT FK_categoria_ventas FOREIGN KEY (categoria) REFERENCES ARTICULOS (categoria) DELETE ON CASCADE;
ALTER TABLE VENTAS ADD CONSTRAINT FK_nif_ventas FOREIGN KEY (nif) REFERENCES TIENDAS (nif);


ALTER TABLE PEDIDOS MODIFY (unidades_pedidas NUMBER(6));
ALTER TABLE VENTAS MODIFY (unidades_vendidas NUMBER(6));
ALTER TABLE PEDIDOS ADD (pvp_articulo NUMBER((5,2));
ALTER TABLE VENTAS ADD (pvp_articulo NUMBER((5,2));
ALTER TABLE FABRICANTES DROP COLUMN (pais);
'''unidades_vendidas >= 100'''
'''ALTER TABLE VENTAS DROP CONSTRAINT (unidades_vendidas >= 100)'''
DROP DATABASE;

















