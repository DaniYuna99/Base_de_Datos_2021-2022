/* alter session set "_oracle_script"=true;  
create user UD05_consultas_uni_ejer2 identified by UD05_consultas_uni_ejer2;
GRANT CONNECT, RESOURCE, DBA TO UD05_consultas_uni_ejer2; */

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
/*         UNIVERSIDAD EJERCICIOS 2           */
/**********************************************/

--1. Para cada titulación ordenar por coste mostrando primero las asignaturas más caras y para las asignaturas 
--del mismo coste mostrar por orden alfabético de nombre de asignatura. 
SELECT nombre, costebasico 
FROM asignatura
ORDER BY costebasico DESC, nombre ASC;

--2. Mostrar el nombre y los apellidos de los profesores. 
SELECT p.nombre, p.apellido 
FROM persona p, profesor p2 
WHERE p.dni = p2.dni;

--3. Mostrar el nombre de las asignaturas impartidas por profesores de Sevilla. 
SELECT a.nombre
FROM asignatura a, profesor p, persona p2
WHERE a.idasignatura = p.idprofesor 
AND p.dni = p2.dni 
AND UPPER(p2.ciudad) LIKE 'SEVILLA';			--No aparece nada.
				
--4. Mostrar el nombre y los apellidos de los alumnos.
SELECT p.nombre, p.apellido
FROM persona p, alumno a 
WHERE p.dni = a.dni;

--5. Mostrar el DNI, nombre y apellidos de los alumnos que viven en Sevilla. 
SELECT a.dni, p.nombre, p.apellido 
FROM alumno a, persona p
WHERE a.dni = p.dni 
AND UPPER(p.ciudad) LIKE 'SEVILLA';
							
--6. Mostrar el DNI, nombre y apellidos de los alumnos matriculados en la asignatura "Seguridad Vial". 
SELECT a.dni, p.nombre, p.apellido 
FROM alumno a, persona p, profesor p2, asignatura a2 
WHERE a.dni = p.dni 
AND p.dni = p2.dni 
AND p2.idprofesor = a2.idprofesor
AND UPPER(a2.nombre) LIKE 'SEGURIDAD VIAL';
									 
--7. Mostrar el Id de las titulaciones en las que está matriculado el alumno con DNI 20202020A. Un alumno está 
--matriculado en una titulación si está matriculado en una asignatura de la titulación.
SELECT DISTINCT a.idtitulacion 
FROM asignatura a, alumno_asignatura aa, alumno a2 
WHERE a.idasignatura(+) = aa.idasignatura 
AND a.idasignatura IS NOT NULL
AND aa.idalumno = a2.idalumno
AND a2.dni LIKE '20202020A';

--8. Obtener el nombre de las asignaturas en las que está matriculada Rosa Garcia.
SELECT a.nombre 
FROM asignatura a, alumno_asignatura aa, alumno a2, persona p 
WHERE a.idasignatura = aa.idasignatura 
AND aa.idalumno = a2.idalumno 
AND a2.dni = p.dni 
AND p.nombre LIKE 'Rosa'
AND p.apellido LIKE 'Garcia';
						 					
--9. Obtener el DNI de los alumnos a los que le imparte clase el profesor Jorge Saenz. 
SELECT a.dni 
FROM alumno a, persona p, profesor p2 
WHERE a.dni = p.dni 
AND p.dni = p2.dni 
AND p.nombre LIKE 'Jorge'
AND p.apellido LIKE 'Saenz';			--No sale nada.
					 						  						 				
--10. Obtener el DNI, nombre y apellido de los alumnos a los que imparte clase el profesor Jorge Saenz. 
SELECT a.dni, p.nombre, p.apellido 
FROM alumno a, persona p, profesor p2 
WHERE a.dni = p.dni 
AND p.dni = p2.dni 
AND p.nombre LIKE 'Jorge'
AND p.apellido LIKE 'Saenz';			--No sale nada.

--11. Mostrar el nombre de las titulaciones que tengan al menos una asignatura de 4 créditos. 
SELECT DISTINCT t.nombre 
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion
AND creditos >= 4;
									 						  						 				
--12. Mostrar el nombre y los créditos de las asignaturas del primer cuatrimestre junto con el 
--nombre de la titulación a la que pertenecen. 
SELECT a.nombre AS "Nombre de asignatura", a.creditos, t.nombre AS "Nombre de titulacion" 
FROM asignatura a, titulacion t 
WHERE a.idtitulacion = t.idtitulacion 
AND a.cuatrimestre = 1;
					
--13. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos junto con el nombre 
--de las personas matriculadas.
SELECT a.nombre AS "Nombre de asignatura", a.costebasico, p.nombre || ' ' || p.apellido AS "Nombre de personas matriculadas"
FROM asignatura a, alumno_asignatura aa, alumno a2, persona p 
WHERE a.idasignatura = aa.idasignatura 
AND aa.idalumno = a2.idalumno 
AND a2.dni = p.dni
AND a.creditos >= 4.5;

--14. Mostrar el nombre de los profesores que imparten asignaturas con coste entre 25 y 35 euros, ambos incluidos
SELECT p.nombre 
FROM persona p, profesor p2, asignatura a
WHERE p.dni = p2.dni 
AND p2.idprofesor = a.idprofesor 
AND a.costebasico BETWEEN 24 AND 36;

--15. Mostrar el nombre de los alumnos matriculados en la asignatura '150212' ó en la '130113' ó en ambas.
SELECT DISTINCT p.nombre || ' ' || p.apellido AS "Nombre de alumno"
FROM persona p, alumno a, alumno_asignatura aa, asignatura a2 
WHERE p.dni = a.dni 
AND a.idalumno = aa.idalumno 
AND aa.idasignatura = a2.idasignatura 
AND (a2.idasignatura = 150212  
OR a2.idasignatura = 130113);

--16. Mostrar el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos, junto con 
--el nombre de la titulación a la que pertenece.
SELECT a.nombre, t.nombre 
FROM asignatura a, titulacion t
WHERE a.cuatrimestre = 2 
AND a.creditos NOT IN (6);

SELECT a.nombre, t.nombre 
FROM asignatura a, titulacion t
WHERE a.cuatrimestre = 2 
AND a.creditos != 6;

--17. Mostrar el nombre y el número de horas de todas las asignaturas. (1cred.=10 horas) junto con 
--el dni de los alumnos que están matriculados.
SELECT a.nombre, (a.creditos * 10) AS "Numero de horas", a2.dni 
FROM asignatura a, alumno_asignatura aa, alumno a2 
WHERE a.idasignatura = aa.idasignatura 
AND aa.idalumno = a2.idalumno;

--18. Mostrar el nombre de todas las mujeres que viven en “Sevilla” y que estén matriculadas en alguna asignatura.
SELECT p.nombre || ' ' || p.apellido AS "Nombre de mujeres"
FROM persona p, alumno a, alumno_asignatura aa, asignatura a2 
WHERE p.dni = a.dni 
AND a.idalumno = aa.idalumno 
AND aa.idasignatura = a2.idasignatura
AND p.ciudad LIKE 'Sevilla'
AND p.varon = 0;

--19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor con identificador p101.
SELECT a.nombre 
FROM asignatura a, profesor p
WHERE a.idprofesor = p.idprofesor 
AND LOWER(p.idprofesor) LIKE 'p101'
AND a.curso = 1;

--20. Mostrar el nombre de los alumnos que se ha matriculado tres o más veces en alguna asignatura.
SELECT DISTINCT p.nombre || ' ' || p.apellido AS "Nombre de alumno"
FROM persona p, alumno a, alumno_asignatura aa, asignatura a2 
WHERE p.dni = a.dni 
AND a.idalumno = aa.idalumno 
AND aa.numeromatricula >= 3;



