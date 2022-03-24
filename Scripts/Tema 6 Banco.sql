/*********************************************************/
/*          TEMA 6: SUBCONSULTAS - BANCO.sql             */
/*********************************************************/

----------------------------------------------------------
				/* Creacion usuario */
/*
alter session set "_oracle_script"=true;  
create user tema6_banco identified by tema6_banco;
GRANT CONNECT, RESOURCE, DBA TO tema6_banco;
*/
----------------------------------------------------------
				/* Borrado de tablas */
/*
DROP TABLE MOVIMIENTO;
DROP TABLE TIPO_MOVIMIENTO;
DROP TABLE CUENTA;
DROP TABLE SUCURSAL;
DROP TABLE CLIENTE;
*/
----------------------------------------------------------
				/* Creacion de tablas */
/* Para crearlas, borra las barras de comentario del codigo */

/*
CREATE TABLE CLIENTE(
  COD_CLIENTE VARCHAR(20) CONSTRAINT PK_CLIENTE PRIMARY KEY,
  APELLIDOS VARCHAR(50) NOT NULL,
  NOMBRE VARCHAR (30) NOT NULL,
  DIRECCION VARCHAR (50) NOT NULL
);

CREATE TABLE SUCURSAL(
  COD_SUCURSAL NUMBER(6) CONSTRAINT PK_SUCURSAL PRIMARY KEY,
  DIRECCION VARCHAR (50) NOT NULL,
  CAPITAL_ANIO_ANTERIOR NUMBER(14,2)
);

CREATE TABLE TIPO_MOVIMIENTO(
  COD_TIPO_MOVIMIENTO VARCHAR(6) CONSTRAINT PK_TIPO_MOVIMIENTO PRIMARY KEY,
  DESCRIPCION VARCHAR(200),
  SALIDA VARCHAR(3) CHECK(SALIDA='Si' OR SALIDA='No'));

CREATE TABLE CUENTA(
  COD_CUENTA NUMBER(10) CONSTRAINT PK_CUENTA PRIMARY KEY,
  SALDO NUMBER (10,2) NOT NULL,
  INTERES NUMBER (5,4) NOT NULL CHECK (INTERES < 1),
  COD_CLIENTE VARCHAR(20),
  COD_SUCURSAL NUMBER(6)
 );

CREATE TABLE MOVIMIENTO(
  COD_CUENTA NUMBER(10),
  MES NUMBER (2) CHECK (MES >= 1 AND MES <= 12),
  NUM_MOV_MES NUMBER(6),
  IMPORTE NUMBER(12,2) NOT NULL,
  FECHA_HORA TIMESTAMP NOT NULL,
  COD_TIPO_MOVIMIENTO VARCHAR(6),
  CONSTRAINT PK_MOVIMIENTO PRIMARY KEY(COD_CUENTA, MES, NUM_MOV_MES)
  
);
  
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('ARUBIO', 'Rubio Caballero', 'Ana', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('ASOTILLO', 'Sotillo Roda', '�ngeles', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CALONSO', 'Alonso Cordero', 'Carlos', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CLUENGO', 'Luengo G�mez', 'Cristina', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('EPEREZ', 'P�rez Honda', 'Eusebio', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('FSANTOS', 'Santos P�rez', 'Fernando', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('IBUADES', 'Buades Avaro', 'Ignacio', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JALONSO', 'Alonso Alfaro', 'Jer�nimo', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JARANAZ', 'Aranaz Rodr�guez', 'Juan Luis', 'C/ Virgen del ?guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JBECERRA', 'Becerra S�nchez', 'Jos�', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JGOMEZ', 'G�mez Trillar', 'Joaqu�n', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JMARTINEZ', 'Mart�nez Moraes', 'Juan', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('JSALINAS', 'Salinas del Mar', 'Javier', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JSANTOS', 'Santos P�rez', 'Jaime', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MCARDO', 'Cardo Merita', 'Mar�a', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MFRANCO', 'Franco Alonso', 'Mar�a', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MGUTIERREZ', 'Guti�rrez Carro', 'Mar�a', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('OLUENGO', 'Luengo Casta�o', 'Ofelia', 'C/ Virgen del �guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('PALVAREZ', '�lvarez Morr�n', 'Paloma', 'C/ Virgen del �guila, 8');

INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (1, 'Avda. Juan Carlos I, 10', 120347);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (2, 'Paseo Castellana, 230', 259089);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (3, 'Ctra. De la Playa, 67', 100786);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (4, 'C/ Lepanto, 17', 70531);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (5, 'C / Juan de la Cosa', 500000);

INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('IE', 'Ingreso en efectivo', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PR', 'Pago de recibo', 'Si');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PT', 'Pago con tarjeta', 'Si');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('RC', 'Retirada por cajero autom�tico', 'Si');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-E', 'Transferencia-Entrada', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-S', 'Transferencia-Salida', 'Si' );

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121229, 'EPEREZ', 12300, 0.12, '1');

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121221, 'EPEREZ', 12300, 0.12, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121222, 'CLUENGO', 3690, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121231, 'ASOTILLO', 31980, 0.06, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121236, 'ARUBIO', 36900, 0.05, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121237, 'CALONSO', 12300, 0.07, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121255, 'EPEREZ', 36900, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121574, 'JBECERRA', 184500, 0.1, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (124334, 'IBUADES', 15375, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (131274, 'EPEREZ', 14760, 0.11, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (156234, 'JALONSO', 4920, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (185964, 'EPEREZ', 36900, 0.025, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (199234, 'FSANTOS', 49200, 0.11, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (331234, 'FSANTOS', 15375, 0.01, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (881234, 'ASOTILLO', 7380, 0.031, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (921234, 'FSANTOS', 29520, 0.2, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (961234, 'JARANAZ', 73800, 0.014, 1);

INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 1, 'IE', 120, TO_TIMESTAMP('23/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 3, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 4, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 5, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 6, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 7, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 8, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 9, 'PT', 100, TO_TIMESTAMP('12/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 10, 'IE', 240, TO_TIMESTAMP('12/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 11, 'TR-S', 400, TO_TIMESTAMP('11/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 5, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 1, 'PR', 300, TO_TIMESTAMP('1/1/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 2, 'IE', 30, TO_TIMESTAMP('11/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 1, 'RC', 260, TO_TIMESTAMP('2/2/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 3, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 4, 'IE', 40, TO_TIMESTAMP('20/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 1, 'TR-S', 100, TO_TIMESTAMP('3/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 2, 'RC', 125, TO_TIMESTAMP('13/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 1, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 1, 'PT', 1500, TO_TIMESTAMP('22/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 2, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 3, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 1, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 2, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 1, 'RC', 60, TO_TIMESTAMP('13/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 2, 'IE', 240, TO_TIMESTAMP('12/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 3, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 4, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 5, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 6, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 7, 'PT', 1500, TO_TIMESTAMP('22/3/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 8, 'IE', 600, TO_TIMESTAMP('21/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 9, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 1, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 2, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 3, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 4, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 5, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 6, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 1, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 3, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 5, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 6, 'TR-S', 400, TO_TIMESTAMP('11/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 7, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 8, 'TR-S', 300, TO_TIMESTAMP('28/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 1, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 2, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 3, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 4, 'TR-S', 125, TO_TIMESTAMP('1/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 1, 'TR-S', 400, TO_TIMESTAMP('2/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 2, 'TR-S', 150, TO_TIMESTAMP('11/1/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 1, 'IE', 100, TO_TIMESTAMP('3/3/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 2, 'IE', 300, TO_TIMESTAMP('12/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));


ALTER TABLE CUENTA ADD CONSTRAINT FK_CUENTA_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE);
ALTER TABLE CUENTA ADD CONSTRAINT FK_CUENTA_SUCURSAL FOREIGN KEY (COD_SUCURSAL) REFERENCES SUCURSAL (COD_SUCURSAL);

ALTER TABLE MOVIMIENTO ADD CONSTRAINT FK_MOVIMIENTO_CUENTA FOREIGN KEY (COD_CUENTA) REFERENCES CUENTA(COD_CUENTA) ON DELETE CASCADE;
ALTER TABLE MOVIMIENTO ADD CONSTRAINT FK_MOVIMIENTO_TIPO_MOVIMIENTO FOREIGN KEY (COD_TIPO_MOVIMIENTO) REFERENCES TIPO_MOVIMIENTO (COD_TIPO_MOVIMIENTO);


COMMIT;
*/
-------------------------------------------------------------------

/*********************************************************/
/*      			 EJERCICIOS                          */
/*********************************************************/

/* 1. Mostrar el saldo medio de todas las cuentas de la entidad bancaria con dos decimales y
la suma de los saldos de todas las cuentas bancarias.*/
SELECT AVG(saldo), SUM(saldo) 
FROM cuenta;

/* 2. Mostrar el saldo mínimo, máximo y medio de todas las cuentas bancarias.*/
SELECT MIN(saldo), MAX(saldo), AVG(saldo) 
FROM cuenta;

/* 3. Mostrar la suma de los saldos y el saldo medio de las cuentas bancarias por cada
código de sucursal.*/
SELECT SUM(c.saldo), AVG(c.saldo)
FROM cuenta c, sucursal s
WHERE c.cod_sucursal = s.cod_sucursal;

/* 4. Para cada cliente del banco se desea conocer su código, la cantidad total que tiene
depositada en la entidad y el número de cuentas abiertas.*/
SELECT c2.cod_cliente, c.saldo, COUNT(c2.cod_cliente) AS "Cuentas totales"
FROM cliente c2, cuenta c
WHERE c2.cod_cliente = c.cod_cliente
GROUP BY c2.cod_cliente, c.saldo;

/* 5. Retocar la consulta anterior para que aparezca el nombre y apellidos de cada cliente en
vez de su código de cliente.*/
SELECT c2.nombre || ' ' || c2.apellidos AS "Cliente", c.saldo, COUNT(c2.cod_cliente) AS "Cuentas totales"
FROM cliente c2, cuenta c
WHERE c2.cod_cliente = c.cod_cliente
GROUP BY c2.nombre, c2.apellidos, c.saldo;

/* 6. Para cada sucursal del banco se desea conocer su dirección, el número de cuentas que
tiene abiertas y la suma total que hay en ellas.*/
SELECT s.cod_sucursal, COUNT(c.cod_cuenta), SUM(NVL(c.saldo, 0)) 
FROM cuenta c, sucursal s 
WHERE c.cod_sucursal = s.cod_sucursal
GROUP BY s.cod_sucursal;

/* 7. Mostrar el saldo medio y el interés medio de las cuentas a las que se le aplique un
interés mayor del 10%, de las sucursales 1 y 2.*/
SELECT AVG(c.saldo), AVG(c.interes) 
FROM cuenta c, sucursal s
WHERE c.cod_sucursal = s.cod_sucursal
AND c.interes >= 10 
AND (s.cod_sucursal = 1 OR s.cod_sucursal = 2);

/* 8. Mostrar los tipos de movimientos de las cuentas bancarias, sus descripciones y el
volumen total de dinero que se manejado en cada tipo de movimiento.*/
SELECT tp.cod_tipo_movimiento, tp.descripcion, SUM(m.importe)
FROM tipo_movimiento tp, movimiento m   
WHERE tp.COD_TIPO_MOVIMIENTO = m.COD_TIPO_MOVIMIENTO
GROUP BY tp.cod_tipo_movimiento, tp.descripcion;

/* 9. Mostrar cuál es la cantidad media que los clientes de nuestro banco tienen en el
epígrafe “Retirada por cajero automático”.*/
SELECT AVG(c2.saldo)
FROM cliente c, cuenta c2, movimiento m, tipo_movimiento tp 
WHERE c.cod_cliente = c2.cod_cliente 
AND c2.cod_cuenta = m.cod_cuenta 
AND m.COD_TIPO_MOVIMIENTO = tp.COD_TIPO_MOVIMIENTO
AND UPPER(tp.DESCRIPCION) LIKE 'RETIRADA POR CAJERO AUTOMATICO';	--Saldria un resultado si no 
																	--fuera por la corrupcion de caracteres.

/* 10. Calcular la cantidad total de dinero que emite la entidad bancaria clasificada según los
tipos de movimientos de salida.*/
SELECT tm.salida, tm.cod_tipo_movimiento, SUM(c.saldo)
FROM cuenta c, movimiento m, tipo_movimiento tm 
WHERE c.cod_cuenta = m.cod_cuenta 
AND m.cod_tipo_movimiento = tm.cod_tipo_movimiento
AND UPPER(tm.salida) LIKE 'SI'
GROUP BY tm.salida, tm.COD_TIPO_MOVIMIENTO;

/* 11. Calcular la cantidad total de dinero que ingresa cada cuenta bancaria clasificada según
los tipos de movimientos de entrada mostrando además la descripción del tipo de
movimiento.*/
SELECT tm.cod_tipo_movimiento, tm.descripcion, SUM(m.importe)
FROM movimiento m, TIPO_MOVIMIENTO tm 
WHERE m.cod_tipo_movimiento = tm.cod_tipo_movimiento
GROUP BY tm.cod_tipo_movimiento, tm.descripcion
ORDER BY tm.cod_tipo_movimiento;

/* 12. Calcular la cantidad total de dinero que sale de la sucursal de Paseo Castellana.*/
SELECT SUM(m.importe) 
FROM movimiento m, cuenta c, sucursal s, TIPO_MOVIMIENTO tm  
WHERE m.cod_cuenta = c.cod_cuenta 
AND c.cod_sucursal = s.cod_sucursal 
AND UPPER(s.direccion) LIKE '%PASEO CASTELLANA%'
AND UPPER(tm.salida) LIKE 'SI';

/* 13. Mostrar la suma total por tipo de movimiento de las cuentas bancarias de los clientes
del banco. Se deben mostrar los siguientes campos: apellidos, nombre, cod_cuenta,
descripción del tipo movimiento y el total acumulado de los movimientos de un
mismo tipo.*/
SELECT c.apellidos || ' ' || c.nombre AS "Cliente", c2.cod_cuenta, tm.descripcion, SUM(c2.saldo)
FROM cliente c, cuenta c2, movimiento m, tipo_movimiento tm 
WHERE c.cod_cliente = c2.cod_cliente 
AND c2.cod_cuenta = m.cod_cuenta 
AND tm.COD_TIPO_MOVIMIENTO = m.COD_TIPO_MOVIMIENTO 
GROUP BY c.apellidos, c.nombre, c2.cod_cuenta, tm.descripcion;

/* 14. Contar el número de cuentas bancarias que no tienen asociados movimientos.*/
SELECT COUNT(c.cod_cuenta) AS "Numero de cuentas" 
FROM cuenta c, movimiento m 
WHERE m.cod_cuenta(+) = c.cod_cuenta 
AND m.cod_cuenta IS NULL;

/* 15. Por cada cliente, contar el número de cuentas bancarias que posee sin movimientos. Se
deben mostrar los siguientes campos: cod_cliente, num_cuentas_sin_movimiento.*/
SELECT c.cod_cliente, COUNT(m.num_mov_mes) AS "Movimientos de cuenta"
FROM cliente c, movimiento m, cuenta c2 
WHERE c.cod_cliente = c2.cod_cliente 
AND c2.cod_cuenta = m.cod_cuenta(+)
AND m.cod_cuenta IS NULL
GROUP BY c.cod_cliente;

/* 16. Mostrar el código de cliente, la suma total del dinero de todas sus cuentas y el número
de cuentas abiertas, sólo para aquellos clientes cuyo capital supere los 35.000 euros.*/
SELECT c.cod_cliente, SUM(c2.saldo), COUNT(c2.cod_cuenta)
FROM cliente c, cuenta c2 
WHERE c.cod_cliente = c2.cod_cliente 
HAVING SUM(c2.saldo) >= 35000
GROUP BY c.cod_cliente;
	
/* 17. Mostrar los apellidos, el nombre y el número de cuentas abiertas sólo de aquellos
clientes que tengan más de 2 cuentas.*/
SELECT c.apellidos || ' ' || c.nombre AS "Cliente", COUNT(c2.cod_cuenta) AS "Numero de cuenta"
FROM cuenta c2, cliente c 
WHERE c2.cod_cliente = c.cod_cliente 
HAVING COUNT(c2.cod_cuenta) > 2
GROUP BY c.apellidos, c.nombre;

/* 18. Mostrar el código de sucursal, dirección, capital del año anterior y la suma de los
saldos de sus cuentas, sólo de aquellas sucursales cuya suma de los saldos de las
cuentas supera el capital del año anterior ordenadas por sucursal.*/
SELECT s.cod_sucursal, s.direccion, s.capital_anio_anterior, SUM(c.saldo) 
FROM sucursal s, cuenta c 
WHERE s.cod_sucursal = c.cod_sucursal 
HAVING SUM(c.saldo) > s.capital_anio_anterior
GROUP BY s.cod_sucursal, s.direccion, s.capital_anio_anterior
ORDER BY s.cod_sucursal;

/* 19. Mostrar el código de cuenta, su saldo, la descripción del tipo de movimiento y la suma
total de dinero por movimiento, sólo para aquellas cuentas cuya suma total de dinero
por movimiento supere el 20% del saldo.*/
SELECT c.cod_cuenta, c.saldo, tm.descripcion, SUM(m.importe)
FROM cuenta c, tipo_movimiento tm, movimiento m 
WHERE c.cod_cuenta = m.cod_cuenta 
AND m.cod_tipo_movimiento = tm.cod_tipo_movimiento
HAVING SUM(m.importe) > (c.saldo*0.2)
GROUP BY c.cod_cuenta, c.saldo, tm.descripcion;


/* 20. Mostrar los mismos campos del ejercicio anterior pero ahora sólo de aquellas cuentas
cuya suma de importes por movimiento supere el 10% del saldo y no sean de la
sucursal 4.*/
SELECT c.cod_cuenta, c.saldo, tm.descripcion, SUM(m.importe)
FROM cuenta c, tipo_movimiento tm, movimiento m, sucursal s 
WHERE c.cod_cuenta = m.cod_cuenta 
AND m.cod_tipo_movimiento = tm.cod_tipo_movimiento
AND s.cod_sucursal != 4
HAVING (SUM(NVL(m.importe, 0)) > (c.saldo * 0.1))
GROUP BY c.cod_cuenta, c.saldo, tm.descripcion;	

/* 21. Mostrar los datos de aquellos clientes para los que el saldo de sus cuentas suponga al
menos el 20% del capital del año anterior de su sucursal.*/ 
SELECT c.cod_cliente, c.apellidos || ' ' || c.nombre AS "Cliente", c.direccion 
FROM cliente c, cuenta c2, sucursal s 
WHERE c.COD_CLIENTE = c2.COD_CLIENTE 
AND c2.COD_SUCURSAL = s.COD_SUCURSAL
HAVING (SUM(NVL(c2.saldo, 0)) >= (s.capital_anio_anterior * 0.20))
GROUP BY c.cod_cliente, c.apellidos, c.nombre, c.direccion;				--Falla por algo.








































