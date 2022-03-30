/* alter session set "_oracle_script"=true;  
create user UD05_consultas_uni_ejer3 identified by UD05_consultas_uni_ejer3;
GRANT CONNECT, RESOURCE, DBA TO UD05_consultas_uni_ejer3; */

-------------------
--ELIMINAR TABLAS--
-------------------
/*
drop table alumno_asignatura cascade constraint;
drop table asignatura cascade constraint;
drop table alumno cascade constraint;
drop table profesor cascade constraint;
drop table persona cascade constraint;
drop table titulacion cascade constraint;
*/

-------------------
--CREACION TABLAS--
-------------------
/*
Create table titulacion (
Idtitulacion varchar2(6) primary key,
Nombre varchar2(30)
);


Create table persona (
dni varchar2(11) primary key,
Nombre varchar2(30),
Apellido varchar2(30),
Ciudad varchar2(15),
Direccioncalle varchar2(30),
Direccionnum number,
Telefono varchar2(9),
Fecha_nacimiento date,
Varon number
);



create table alumno (
idalumno varchar2(7) primary key,
dni varchar2(11),
foreign key (dni) references persona(dni)
);

Create table profesor (
Idprofesor varchar2(4) primary key,
Dni varchar2(11),
Foreign key(dni) references persona(dni)
);

Create table asignatura (
Idasignatura varchar2(6) primary key,
Nombre varchar2(20),
Creditos number,
Cuatrimestre number,
Costebasico number,
Idprofesor varchar2(4),
Idtitulacion varchar2(6),
Curso number,
Foreign key(idprofesor) references profesor(idprofesor),
Foreign key (idtitulacion) references titulacion(idtitulacion)
);

Create table  alumno_asignatura (
Idalumno varchar2(7),
Idasignatura varchar2(6),
Numeromatricula number,
  PRIMARY KEY(idalumno,idasignatura,numeromatricula),
Foreign key(idalumno) references alumno(idalumno),
Foreign key(idasignatura) references asignatura(idasignatura)
);


insert into persona values ('16161616A','Luis','Ramirez','Haro','Pez','34','941111111',to_date('1/1/1969','dd/mm/yyyy'),'1');
insert into persona values ('17171717A','Laura','Beltran','Madrid','Gran Va','23','912121212',to_date('8/8/1974','dd/mm/yyyy'),'0');
insert into persona values ('18181818A','Pepe','Perez','Madrid','Percebe','13','913131313',to_date('2/2/1980','dd/mm/yyyy'),'1');
insert into persona values ('19191919A','Juan','Sanchez','Bilbao','Melancola','7','944141414',to_date('3/2/1966','dd/mm/yyyy'),'1');
insert into persona values ('20202020A','Luis','Jimenez','Najera','Cigea','15','941151515',to_date('3/3/1979','dd/mm/yyyy'),'1');
insert into persona values ('21212121A','Rosa','Garcia','Haro','Alegra','16','941161616',to_date('4/4/1978','dd/mm/yyyy'),'0');
insert into persona values ('23232323A','Jorge','Saenz','Sevilla','Luis Ulloa','17','941171717',to_date('9/9/1978','dd/mm/yyyy'),'1');
insert into persona values ('24242424A','Mara','Gutierrez','Sevilla','Avda. de la Paz','18','941181818',to_date('10/10/1964','dd/mm/yyyy'),'0');
insert into persona values ('25252525A','Rosario','Diaz','Sevilla','Percebe','19','941191919',to_date('11/11/1971','dd/mm/yyyy'),'0');
insert into persona values ('26262626A','Elena','Gonzalez','Sevilla','Percebe','20','941202020',to_date('5/5/1975','dd/mm/yyyy'),'0');


insert into alumno values ('A010101','21212121A');
insert into alumno values ('A020202','18181818A');
insert into alumno values ('A030303','20202020A');
insert into alumno values ('A040404','26262626A');
insert into alumno values ('A121212','16161616A');
insert into alumno values ('A131313','17171717A');


insert into profesor values ('P101','19191919A');
insert into profesor values ('P117','25252525A');
insert into profesor values ('P203','23232323A');
insert into profesor values ('P204','26262626A');
insert into profesor values ('P304','24242424A');


insert into titulacion values ('130110','Matematicas');
insert into titulacion values ('150210','Quimicas');
insert into titulacion values ('160000','Empresariales');


insert into asignatura values ('000115','Seguridad Vial','4','1','30 ','P204',null,null);
insert into asignatura values ('130113','Programacion I', '9','1','60 ','P101','130110','1');
insert into asignatura values ('130122','Analisis II',    '9','2','60 ','P203','130110','2');
insert into asignatura values ('150212','Quimica Fisica','4','2','70','P304','150210','1');
insert into asignatura values ('160002','Contabilidad','6','1','70','P117','160000','1');


insert into alumno_asignatura values('A010101','150212','1');
insert into alumno_asignatura values('A020202','130113','1');
insert into alumno_asignatura values('A020202','150212','2');
insert into alumno_asignatura values('A030303','130113','3');
insert into alumno_asignatura values('A030303','150212','1');
insert into alumno_asignatura values('A030303','130122','2');
insert into alumno_asignatura values('A040404','130122','1');
insert into alumno_asignatura values('A121212','000115','1');
insert into alumno_asignatura values('A131313','160002','4');
*/



/**********************************************/
/*         UNIVERSIDAD EJERCICIOS 3           */
/**********************************************/

SELECT * FROM ASIGNATURA;

--1. Cuantos costes básicos hay.
SELECT COUNT(costebasico) 
FROM ASIGNATURA;   
	   
--2. Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.
SELECT t.nombre, COUNT(a.idasignatura)
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion 
GROUP BY t.nombre;

--3. Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.
SELECT t.nombre, SUM(a.costebasico)
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion 
GROUP BY t.nombre;

--4. Cual sería el coste global de cursar la titulación de Matemáticas si el 
--coste de cada asignatura fuera incrementado en un 7%. 
SELECT DISTINCT t.nombre, (a.costebasico * 1.07) AS "Coste + 7%" 
FROM asignatura a, titulacion t
WHERE a.idtitulacion = t.idtitulacion
AND t.nombre LIKE 'Matematicas';                                  

--5. Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. 
SELECT a.idasignatura, COUNT(aa.idalumno)
FROM asignatura a, alumno_asignatura aa 
WHERE a.idasignatura = aa.idasignatura 
GROUP BY a.idasignatura;

--6. Igual que el anterior pero mostrando el nombre de la asignatura.
SELECT a.nombre, COUNT(aa.idalumno)
FROM asignatura a, alumno_asignatura aa 
WHERE a.idasignatura = aa.idasignatura 
GROUP BY a.nombre;

--7. Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar
--por el total de todas las asignaturas en las que está matriculado. Recuerda que 
--el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado. 
SELECT p.nombre || ' ' || p.apellido AS "Nombre de alumno", 
	   SUM((a2.costebasico * (1.00 + (10 * aa.numeromatricula)))) AS "Precio de matricula"
FROM persona p, alumno a, alumno_asignatura aa, asignatura a2
WHERE p.dni = a.dni 
AND a.idalumno = aa.idalumno 
AND aa.idasignatura = a2.idasignatura
GROUP BY p.nombre, p.apellido;

--8. Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el 
--coste total de la 1ª matrícula sea mayor que 60 euros. 
SELECT t.nombre, AVG(a.costebasico)
FROM asignatura a, titulacion t
WHERE a.idtitulacion = t.idtitulacion
HAVING SUM(a.costebasico * 1.10) > 60
GROUP BY t.nombre; 

--9. Nombre de las titulaciones que tengan más de tres alumnos.
SELECT t.nombre 
FROM titulacion t, asignatura a, alumno_asignatura aa 
WHERE t.idtitulacion = a.idtitulacion 
AND a.idasignatura = aa.idasignatura 
HAVING COUNT(aa.idalumno) > 3
GROUP BY t.nombre;

--10. Nombre de cada ciudad junto con el número de personas que viven en ella.
SELECT ciudad, COUNT(*)
FROM persona 
GROUP BY ciudad;

--11. Nombre de cada profesor junto con el número de asignaturas que imparte.
SELECT p.nombre || ' ' || p.apellido AS "Nombre de profesor", COUNT(a.idasignatura)
FROM persona p, profesor p2, asignatura a 
WHERE p.dni = p2.dni 
AND p2.idprofesor = a.idprofesor
GROUP BY p.nombre, p.apellido;

--12. Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos.
SELECT p.nombre || ' ' || p.apellido AS "Nombre de profesor", COUNT(aa.idalumno)
FROM persona p, profesor p2, asignatura a, alumno_asignatura aa 
WHERE p.dni = p2.dni 
AND p2.idprofesor = a.idprofesor
AND a.idasignatura = aa.idasignatura
HAVING COUNT(aa.idalumno) >= 2
GROUP BY p.nombre, p.apellido;

--13. Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre
SELECT p.*	
FROM (SELECT cuatrimestre, SUM(costebasico)
	 FROM asignatura 
	 GROUP BY cuatrimestre) p
WHERE ROWNUM = 1;

--14. Suma del coste de las asignaturas
SELECT SUM(costebasico) 
FROM ASIGNATURA;

--15. ¿Cuántas asignaturas hay?
SELECT COUNT(idasignatura) 
FROM ASIGNATURA;

--16. Coste de la asignatura más cara y de la más barata
SELECT MAX(costebasico), MIN(costebasico) 
FROM asignatura;

--17. ¿Cuántas posibilidades de créditos de asignatura hay?
SELECT nombre, COUNT(creditos) 
FROM asignatura
GROUP BY nombre;	

SELECT nombre, creditos 
FROM asignatura;				--¿?

--18. ¿Cuántos cursos hay?
SELECT COUNT(curso) 
FROM asignatura;

--19. ¿Cuántas ciudades hay?
SELECT COUNT(ciudad) 
FROM persona;

--20. Nombre y número de horas de todas las asignaturas.
SELECT nombre, (creditos * 10) AS "Horas" 
FROM asignatura;

--21. Mostrar las asignaturas que no pertenecen a ninguna titulación.
SELECT a.nombre 
FROM asignatura a, titulacion t 
WHERE a.idtitulacion = t.idtitulacion(+) 
AND t.idtitulacion IS NULL;

--22. Listado del nombre completo de las personas, sus teléfonos y sus direcciones, 
--llamando a la columna del nombre "NombreCompleto" y a la de direcciones "Direccion".
SELECT nombre || ' ' || apellido AS "Nombre completo", 
	   telefono AS "Telefono",
	   direccioncalle || ', ' || direccionnum AS "Direccion"
FROM persona;

--23. Cual es el día siguiente al día en que nacieron las personas de la B.D.
SELECT (fecha_nacimiento + 1)
FROM persona;

--24. Años de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento.
SELECT EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM fecha_nacimiento)
FROM persona;			--No es exacto, pero es una aproximacion.

--25. Listado de personas mayores de 25 años ordenadas por apellidos y nombre, esta consulta tiene que valor para cualquier momento.
SELECT nombre || ' ' || apellido AS "Persona"
FROM persona 
WHERE EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM fecha_nacimiento) >= 25;

--26. Nombres completos de los profesores que además son alumnos.
SELECT p.nombre || ' ' || p.apellido AS "Nombre de profesor/alumno" 
FROM persona p, profesor p2, alumno a 
WHERE p.dni = a.dni 
AND p2.dni = p.dni;

--27. Suma de los créditos de las asignaturas de la titulación de Matemáticas.
SELECT SUM(a.creditos)
FROM asignatura a, titulacion t
WHERE a.idtitulacion = t.idtitulacion 
AND UPPER(t.nombre) LIKE 'MATEMATICAS';

--28. Número de asignaturas de la titulación de Matemáticas.       
SELECT COUNT(a.idasignatura) 
FROM asignatura a, titulacion t 
WHERE a.idtitulacion = t.idtitulacion 
AND UPPER(t.nombre) LIKE 'MATEMATICAS';

--29. ¿Cuánto paga cada alumno por su matrícula?
SELECT aa.idalumno, 
	   SUM((a.costebasico * (1.00 + (10 * aa.numeromatricula)))) AS "Precio de matricula"
FROM alumno_asignatura aa, asignatura a
WHERE aa.idasignatura = a.idasignatura
GROUP BY aa.idalumno;

--30. ¿Cuántos alumnos hay matriculados en cada asignatura?
SELECT a.nombre, COUNT(aa.idalumno)
FROM alumno_asignatura aa, asignatura a
WHERE aa.idasignatura = a.idasignatura
GROUP BY a.nombre;


















