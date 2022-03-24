/*********************************************************/
/*          UD05 Ejercicio Repaso Ej 1 MySQL             */
/*********************************************************/

/*--------------------------------------------------------*/
				/* CREACION USUARIO */
/*
MYSQL  (Al principio, iba a hacerlo en MySQL, pero TO_DATE no funciona en MySQL, y en Oracle sí. Por lo que cambié y no miré atrás.)
create database db_ud05_repaso_ej1;
create user 'db_ud05_repaso_ej1'@'%' identified by 'db_ud05_repaso_ej1';
grant all on db_ud05_repaso_ej1.* to 'db_ud05_repaso_ej1'@'%';
*/

/*
ORACLE (of Ages)
alter session set "_oracle_script"=true;  
create user db_ud05_repaso_ej1 identified by db_ud05_repaso_ej1;
GRANT CONNECT, RESOURCE, DBA TO db_ud05_repaso_ej1;
*/

/*--------------------------------------------------------*/
				/* BORRADO TABLAS */
/*
DROP TABLE EMPLE CASCADE CONSTRAINT;
DROP TABLE DEPART CASCADE CONSTRAINT;
*/

/*--------------------------------------------------------*/
				/* CREACION TABLAS */
/*
CREATE TABLE EMPLE 
(
	emp_no			NUMBER(4),
	apellido		VARCHAR2(15),
	oficio			VARCHAR2(15),
	dir				NUMBER(4),
	fecha_alt		DATE,
	salario			NUMBER(15),
	comision		NUMBER(15),
	dept_no			NUMBER(2),
	
	CONSTRAINT PK_empno PRIMARY KEY (emp_no)
	
);


CREATE TABLE DEPART 
(
	dept_no			NUMBER(2),
	dnombre			VARCHAR2(15),
	loc 			VARCHAR2(15),
	
	CONSTRAINT PK_deptno PRIMARY KEY (dept_no)
);


INSERT INTO EMPLE VALUES (7369, 'Sanchez', 'Empleado', 7902, TO_DATE('17/12/1980','DD/MM/YYYY'), 104000, NULL, 20);
INSERT INTO EMPLE VALUES (7499, 'Arroyo', 'Vendedor' , 7698, TO_DATE('20/02/1980','DD/MM/YYYY'), 208000, 39000, 30);
INSERT INTO EMPLE VALUES (7521, 'Sala', 'Vendedor', 7698, TO_DATE('22/02/1981', 'DD/MM/YYYY'), 162500, 162500, 30);
INSERT INTO EMPLE VALUES (7566, 'Jimenez', 'Director', 7839 , TO_DATE('02/04/1981', 'DD/MM/YYYY'), 386750, NULL, 20); 
INSERT INTO EMPLE VALUES (7654, 'Martin', 'Vendedor', 7698, TO_DATE('29/09/1981', 'DD/MM/YYYY'), 162500, 182000, 30); 
INSERT INTO EMPLE VALUES (7698, 'Negro', 'Director', 7839, TO_DATE('01/05/1981', 'DD/MM/YYYY'), 370500, NULL, 30); 
INSERT INTO EMPLE VALUES (7788, 'Gil', 'Analista', 7566, TO_DATE('22/02/1981', 'DD/MM/YYYY'), 390000, NULL, 20); 
INSERT INTO EMPLE VALUES (7839, 'Rey', 'Presidente', NULL, TO_DATE('17/11/1981', 'DD/MM/YYYY'), 650000, NULL, 10); 
INSERT INTO EMPLE VALUES (7844, 'Tovar', 'Vendedor', 7698, TO_DATE('08/09/1981', 'DD/MM/YYYY'), 195000, 0, 30); 
INSERT INTO EMPLE VALUES (7876, 'Alonso', 'Empleado', 7788, TO_DATE('23/09/1981', 'DD/MM/YYYY'), 143000, NULL, 20); 
INSERT INTO EMPLE VALUES (7900, 'Jimeno', 'Empleado', 7698, TO_DATE('03/12/1981', 'DD/MM/YYYY'), 1235000, NULL, 30); 
INSERT INTO EMPLE VALUES (7902, 'Fernandez', 'Analista', 7566, TO_DATE('03/12/1981', 'DD/MM/YYYY'), 390000, NULL, 20); 
INSERT INTO EMPLE VALUES (7934, 'Munoz', 'Empleado', 7782, TO_DATE('23/01/1981', 'DD/MM/YYYY'), 169000, NULL, 10); 


INSERT INTO DEPART VALUES (10, 'Contabilidad', 'Sevilla');
INSERT INTO DEPART VALUES (20, 'Investigacion', 'Madrid');
INSERT INTO DEPART VALUES (30, 'Ventas', 'Barcelona');
INSERT INTO DEPART VALUES (40, 'Produccion', 'Bilbao');


ALTER TABLE EMPLE 
ADD CONSTRAINT FK_deptno_emple FOREIGN KEY (dept_no) REFERENCES DEPART(dept_no);
*/

/*--------------------------------------------------------*/
					/*Ejercicios*/

/*1 Mostrar el apellido, oficio y numero de departamento de cada empleado.*/
SELECT apellido, oficio, dept_no 
FROM emple;

/*2 Mostrar el numero, nombre y localizacion de cada departamento.*/
SELECT dept_no, dnombre, loc 
FROM depart;

/*3 Mostrar todos los datos de todos los empleados.*/
SELECT *
FROM emple;

/*4 Datos de los empleados ordenados por apellidos.*/
SELECT * 
FROM emple 
ORDER BY apellido;

/*5 Datos de los empleados ordenados por numero de departamento
descendentemente.*/
SELECT * 
FROM emple 
ORDER BY dept_no DESC;

/*6 Datos de los empleados ordenados por numero de departamento
descendentemente y dentro de cada departamento ordenados por apellido
ascendentemente.*/
SELECT * 
FROM emple 
ORDER BY dept_no DESC, apellido ASC;

/*7 Mostrar los datos de los empleados cuyo salario sea mayor que 200000.*/
SELECT * 
FROM emple 
WHERE salario >= 200000;

/*8 Mostrar los datos de los empleados cuyo oficio sea ANALISTA.*/
SELECT * 
FROM emple 
WHERE UPPER(oficio) LIKE 'ANALISTA';

/*9 Seleccionar el apellido y oficio de los empleados del departamento numero
20.*/
SELECT apellido, oficio
FROM emple 
WHERE dept_no = 20;

/*10 Mostrar todos los datos de los empleados ordenados por apellido.*/ /*REPETIDO, ES IGUAL QUE EL 4*/
SELECT * 
FROM emple 
ORDER BY apellido;

/*11 Seleccionar los empleados cuyo oficio sea VENDEDOR. Mostrar los datos
ordenados por apellido.*/
SELECT * 
FROM emple 
WHERE UPPER(oficio) LIKE 'VENDEDOR'
ORDER BY apellido ASC;

/*12 Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea
ANALISTA. Ordenar el resultado por apellido.*/
SELECT * 
FROM emple 
WHERE dept_no = 10
AND UPPER(oficio) LIKE 'ANALISTA'
ORDER BY apellido;

/*13 Mostrar los empleados que tengan un salario mayor que 200000 o que
pertenezcan al departamento numero 20.*/
SELECT * 
FROM emple 
WHERE salario >= 200000 
OR dept_no = 20;

/*14 Ordenar los empleados por oficio, y dentro de oficio por nombre.*/
SELECT *
FROM emple 
ORDER BY oficio ASC, emp_no ASC;

/*15 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por
A.*/
SELECT * 
FROM emple 
WHERE UPPER(apellido) LIKE 'A%';

/*16 Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por Z.*/
SELECT * 
FROM emple 
WHERE UPPER(apellido) LIKE '%Z';

/*17 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por
A y el OFICIO tenga una E en cualquier posicion.*/
SELECT * 
FROM emple 
WHERE UPPER(apellido) LIKE 'A%'
AND UPPER(oficio) LIKE '%E%';

/*18 Seleccionar los empleados cuyo salario esta entre 100000 y 200000. Utilizar
el operador BETWEEN.*/
SELECT * 
FROM emple 
WHERE salario BETWEEN 100000 AND 200000;

/*19 Obtener los empleados cuyo oficio sea VENDEDOR y tengan una comision
superior a 100000.*/
SELECT *
FROM emple 
WHERE comision >= 100000
AND UPPER(oficio) LIKE 'VENDEDOR';

/*20 Seleccionar los datos de los empleados ordenados por numero de
departamento, y dentro de cada departamento ordenados por apellido.*/ /*REPETIDO*/
SELECT *
FROM emple 
ORDER BY dept_no ASC, apellido ASC;

/*21 Numero y apellidos de los empleados cuyo apellido termine por Z y tengan
un salario superior a 300000.*/
SELECT emp_no, apellido 
FROM emple 
WHERE UPPER(apellido) LIKE '%Z'
AND salario >= 300000;

/*22. Datos de los departamentos cuya localizacion empiece por B.*/
SELECT *
FROM depart 
WHERE UPPER(loc) LIKE 'B%';

/*23. Datos de los empleados cuyo oficio sea EMPLEADO, tengan un salario
superior a 100000 y pertenezcan al departamento numero 10.*/
SELECT *
FROM emple 
WHERE UPPER(oficio) LIKE 'EMPLEADO'
AND salario >= 100000 
AND dept_no = 10;

/*24. Mostrar los apellidos de los empleados que no tengan comision.*/
SELECT apellido 
FROM emple 
WHERE comision IS NULL;

/*25. Mostrar los apellidos de los empleados que no tengan comision y cuyo
apellido empiece por J.*/
SELECT apellido 
FROM emple 
WHERE comision IS NULL 
AND UPPER(apellido) LIKE 'J%';

/*26. Mostrar los apellidos de los empleados cuyo oficio sea VENDEDOR,
ANALISTA o EMPLEADO.*/
SELECT apellido 
FROM emple 
WHERE UPPER(oficio) LIKE 'VENDEDOR'
OR UPPER(oficio) LIKE 'ANALISTA'
OR UPPER(oficio) LIKE 'EMPLEADO';

/*27. Mostrar los apellidos de los empleados cuyo oficio no sea ni ANALISTA ni
EMPLEADO, y ademas tengan un salario mayor de 200000.*/
SELECT apellido 
FROM emple 
WHERE (UPPER(oficio) NOT LIKE 'ANALISTA'
OR UPPER(oficio) NOT LIKE 'EMPLEADO')
AND salario >= 200000;

/*28 Seleccionar de la tabla EMPLE los empleados cuyo salario esta entre
2000000 y 3000000 (utilizar BETWEEN).*/			
SELECT * 
FROM emple 
WHERE salario BETWEEN 200000 AND 300000;		/*Sobra un 0 para que salga algo.*/

/*29 Seleccionar el apellido, salario y numero de departamento de los empleados
cuyo salario sea mayor que 200000 en los departamentos 10 y 30.*/
SELECT apellido, salario, dept_no 
FROM emple 
WHERE salario >= 200000 
AND (dept_no = 10
OR dept_no = 30);

/*30. Mostrar el apellido y numero de los empleados cuyo salario no esta entre
100000 y 200000 (utilizar BETWEEN).*/
SELECT apellido, emp_no 
FROM emple 
WHERE salario NOT BETWEEN 100000 AND 200000;

/*31.Obtener el apellidos de todos los empleados en minuscula.*/
SELECT LOWER(apellido)
FROM emple;

/*32.En una consulta concatena el apellido de cada empleado con su oficio.*/
SELECT CONCAT(apellido, CONCAT(', ', oficio))
FROM emple;

/*33. Mostrar el apellido y la longitud del apellido (funcion LENGTH) de todos
los empleados, ordenados por la longitud de los apellidos de los
empleados descendentemente.*/
SELECT apellido, LENGTH(apellido) Longitud
FROM emple 
ORDER BY Longitud DESC; 						

/*34.Obtener el ano de contratacion de todos los empleados (funcion YEAR).*/
SELECT EXTRACT(YEAR FROM fecha_alt)
FROM emple;

/*35. Mostrar los datos de los empleados que hayan sido contratados en el
ano 1992.*/
SELECT *
FROM emple
WHERE EXTRACT(YEAR FROM fecha_alt) = 1992;			/*No hay nadie.*/

/*36. Mostrar los datos de los empleados que hayan sido contratados en el
mes de febrero de cualquier ano (funcion MONTHNAME).*/
SELECT *
FROM emple
WHERE EXTRACT(MONTH FROM fecha_alt) = 02;

/*37. Para cada empleado mostrar el apellido y el mayor valor del salario y la
comision que tienen.*/
SELECT apellido
FROM emple
GROUP BY MAX(salario)
ORDER BY apellido;					/*No se hacer este. Aún no entiendo por que las expresiones de grupo no funcionan.*/

/*38. Mostrar los datos de los empleados cuyo apellido empiece por 'A' y
hayan sido contratados en el ano 1990.*/
SELECT * 
FROM emple 
WHERE UPPER(apellido) LIKE 'A%'
AND EXTRACT(YEAR FROM fecha_alt) = 1990;

/*39. Mostrar los datos de los empleados del departamento 10 que no tengan
comision.*/
SELECT *
FROM emple 
WHERE dept_no = 10 
AND comision IS NULL;










