/* alter session set "_oracle_script"=true;  
create user ejercicio4boletinmysql identified by ejercicio4boletinmysql;
GRANT CONNECT, RESOURCE, DBA TO ejercicio4boletinmysql; */

CREATE TABLE GAMA_PRODUCTO
(
	gama				VARCHAR2(50),
	descripcion_texto	VARCHAR2(500),
	descripcion_html	VARCHAR2(500),
	imagen				VARCHAR2(256),
	
	CONSTRAINT PK_gamaproducto PRIMARY KEY (gama)
);

CREATE TABLE PRODUCTO
(
	codigo_producto				VARCHAR2(15),
	nombre						VARCHAR2(70),
	dimensiones					VARCHAR2(25),
	proveedor					VARCHAR2(50),
	descripcion					VARCHAR2(500),
	cantidad_en_stock			VARCHAR2(6),
	precio_venta				NUMBER(15,2),
	precio_proveedor			NUMBER(15,2),
	gama						VARCHAR2(50),
	
	CONSTRAINT PK_codigoproducto PRIMARY KEY (codigo_producto),
	CONSTRAINT FK_gamaproducto FOREIGN KEY (gama) REFERENCES GAMA_PRODUCTO (gama)
);

CREATE TABLE DETALLE_PEDIDO
(
	codigo_pedido				NUMBER(11),
	codigo_producto				VARCHAR2(15),
	cantidad					NUMBER(11),
	precio_unidad				NUMBER(15,2),
	numero_linea				NUMBER(6),

	CONSTRAINT FK_codigoproducto_detallepedido FOREIGN KEY (codigo_producto) REFERENCES PRODUCTO (codigo_producto)
);

CREATE TABLE PEDIDO
(
	codigo_pedido				NUMBER(11),
	fecha_pedido				DATE,
	fecha_esperada				DATE,
	fecha_entrega				DATE,
	estado						VARCHAR2(15),
	comentarios					VARCHAR2(1000),
	codigo_cliente				NUMBER(11),
	
	CONSTRAINT PK_codigopedido PRIMARY KEY (codigo_pedido)
);

CREATE TABLE CLIENTE
(
	codigo_cliente				NUMBER(11),
	nombre_cliente				VARCHAR2(50),
	nombre_contacto				VARCHAR2(30),
	apellido_contacto			VARCHAR2(30),
	telefono					VARCHAR2(15),
	fax							VARCHAR2(15),
	linea_direccion1			VARCHAR2(50),
	linea_direccion2			VARCHAR2(50),
	ciudad						VARCHAR2(50),
	region						VARCHAR2(50),
	pais						VARCHAR2(50),
	codigo_postal				VARCHAR2(10),
	codigo_empleado_rep_ventas 	NUMBER(11),
	limite_credito				NUMBER(15,2),
	
	CONSTRAINT PK_codigocliente PRIMARY KEY (codigo_cliente)
);

CREATE TABLE PAGO
(
	id_transaccion				VARCHAR2(50),
	forma_pago					VARCHAR2(40),
	fecha_pago					DATE,
	total						NUMBER(15,2),
	codigo_cliente				NUMBER(11),
	
	CONSTRAINT PK_id_transaccion PRIMARY KEY (id_transaccion),
	CONSTRAINT FK_codigocliente_pago FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente)
);

CREATE TABLE EMPLEADO
(
	codigo_empleado				NUMBER(11),
	nombre						VARCHAR2(50),
	apellido1					VARCHAR2(50),
	apellido2					VARCHAR2(50),
	extension					VARCHAR2(10),
	email						VARCHAR2(100),
	codigo_jefe					NUMBER(11),
	puesto						VARCHAR2(50),
	codigo_oficina				VARCHAR2(10),
	
	CONSTRAINT PK_codigoempleado PRIMARY KEY (codigo_empleado),
	CONSTRAINT FK_codigojefe FOREIGN KEY (codigo_jefe) REFERENCES EMPLEADO (codigo_empleado)
);

CREATE TABLE OFICINA
(
	codigo_oficina				VARCHAR2(10),
	ciudad						VARCHAR2(30),
	pais						VARCHAR2(50),
	region						VARCHAR2(50),
	codigo_postal				VARCHAR2(10),
	telefono					VARCHAR2(20),
	linea_direccion1			VARCHAR2(50),
	linea_direccion2			VARCHAR2(50),
	
	CONSTRAINT PK_codigooficina PRIMARY KEY (codigo_oficina)
);


ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT FK_codigopedido_detallepedido FOREIGN KEY (codigo_pedido) REFERENCES PEDIDO (codigo_pedido);
ALTER TABLE PEDIDO ADD CONSTRAINT FK_codigocliente_pedido FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo_cliente);
ALTER TABLE CLIENTE ADD CONSTRAINT FK_codigoempleado_repventas_cliente FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES EMPLEADO (codigo_empleado);
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_codigooficina_empleado FOREIGN KEY (codigo_oficina) REFERENCES OFICINA (codigo_empleado);











