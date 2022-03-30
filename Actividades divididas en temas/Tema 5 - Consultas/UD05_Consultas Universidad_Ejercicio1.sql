/* alter session set "_oracle_script"=true;  
create user UD05_consultas_universidad identified by UD05_consultas_universidad;
GRANT CONNECT, RESOURCE, DBA TO UD05_consultas_universidad; */

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


--EJERCICIOS--
    
/*1. Mostrar los nombres y los creditos de cada una de las asignaturas.*/
SELECT nombre, creditos 
FROM asignatura;

/*2. Obtener los posibles distintos creditos de las asignaturas que hay en la base de datos.*/
SELECT DISTINCT creditos 
FROM asignatura;

/*3. Mostrar todos los datos de todas de las personas.*/
SELECT * 
FROM persona;

/*4. Mostrar el nombre y creditos de las asignaturas del primer cuatrimestre.*/
SELECT nombre, creditos 
FROM asignatura 
WHERE cuatrimestre = 1;

/*5. Mostrar el nombre y el apellido de las personas nacidas antes del 1 de enero de 1975.*/
SELECT nombre, apellido 
FROM persona 
WHERE fecha_nacimiento < TO_DATE('1975-01-01', 'YYYY/MM/DD');

SELECT nombre, apellido 
FROM persona 
WHERE EXTRACT(YEAR FROM fecha_nacimiento) < 1975;

/*6. Mostrar el nombre y el coste basico de las asignaturas de mas de 4,5 creditos.*/
SELECT nombre, costebasico 
FROM asignatura 
WHERE creditos NOT IN (4, 5);

/*7. Mostrar el nombre de las asignaturas cuyo coste basico esta entre 25 y 35 euros.*/
SELECT nombre 
FROM asignatura 
WHERE costebasico IN (25, 35);

/*8. Mostrar el identificador de los alumnos matriculados en la asignatura '150212' o en la '130113' o en ambas.*/
SELECT idalumno 
FROM alumno_asignatura 
WHERE idasignatura = 150212 
OR idasignatura = 130113;

/*9. Obtener el nombre de las asignaturas del segundo cuatrimestre que no sean de 6 creditos.*/
SELECT nombre 
FROM asignatura 
WHERE cuatrimestre = 2 
AND creditos NOT IN 6;

/*10. Mostrar el nombre y el apellido de las personas cuyo apellido comience por 'G'.*/
SELECT nombre, apellido 
FROM persona
WHERE apellido LIKE 'G%';

/*11. Obtener el nombre de las asignaturas que no tienen dato para el IdTitulacion.*/ 
SELECT nombre 
FROM asignatura 
WHERE idtitulacion IS NULL;

/*12. Obtener el nombre de las asignaturas que tienen dato para el IdTitulacion.*/
SELECT nombre 
FROM asignatura 
WHERE idtitulacion IS NOT NULL;

/*13. Mostrar el nombre de las asignaturas cuyo coste por cada credito sea mayor de 8 euros.*/ 
SELECT nombre 
FROM asignatura 
WHERE creditos > 8;

/*14. Mostrar el nombre y el numero de horas de las asignaturas de la 
 * base de datos. (1cred.= 10 horas).*/
SELECT nombre, (creditos * 10) AS "Horas asignatura"
FROM asignatura;

/*15. Mostrar todos los datos de las asignaturas del segundo cuatrimestre 
 * ordenados por el identificador de asignatura.*/
SELECT * 
FROM asignatura
WHERE cuatrimestre = 2
ORDER BY idasignatura ASC;

/*16. Mostrar el nombre de todas las mujeres que viven en 'Madrid'.*/
SELECT nombre
FROM persona 
WHERE varon = 0 
AND ciudad LIKE 'Madrid';

/*17. Mostrar el nombre y los telefonos de aquellas 
 * personas cuyo telefono empieza por 91.*/
SELECT nombre, telefono 
FROM persona 
WHERE telefono BETWEEN 910000000 AND 920000000;

SELECT nombre, telefono 
FROM persona 
WHERE telefono LIKE '91%';

/*18. Mostrar el nombre de las asignaturas que contengan la silaba 'pro'.*/
SELECT nombre 
FROM asignatura 
WHERE nombre LIKE '%pro%';

/*19. Mostrar el nombre de la asignatura de primero y que 
 * lo imparta el profesor que tiene codigo P101*/
SELECT nombre 
FROM asignatura 
WHERE curso = 1 
AND idprofesor LIKE 'P101';

/*20. Mostrar el codigo de alumno que se ha matriculado 
 * tres o mas veces de una asignatura, mostrando tambien el 
 * codigo de la asignatura correspondiente.*/
SELECT idalumno 
FROM alumno_asignatura 
WHERE numeromatricula >= 3;

/*21. El coste de cada asignatura va subiendo a medida que se repite la asignatura. Para saber cual seria el precio de las distintas 
 asignaturas en las repeticiones (y asi animar a nuestros alumnos a que estudien) se quiere mostrar un listado en donde esta el 
 nombre de la asignatura, el precio basico, el precio de la primera repeticion (un 10 por ciento mas que el coste basico), 
 el precio de la segunda repeticion (un 30 por ciento mas que el coste basico) y el precio de la tercer repeticion 
 (un 60 por ciento mas que el coste basico).*/
SELECT a.nombre AS "Nombre de asignatura", 
	   a.costebasico AS "Precio basico", 
	   (a.costebasico * 1.10) AS "Primera repeticion",
	   (a.costebasico * 1.30) AS "Segunda repeticion",
	   (a.costebasico * 1.60) AS "Tercera repeticion"
FROM asignatura a;

/*22. Mostrar todos los datos de las personas que tenemos en la base de datos que han nacido antes de la decada de los 70.*/
SELECT * FROM persona 
WHERE fecha_nacimiento < TO_DATE('1970-01-01', 'YYYY-MM-DD');

/*23. Mostrar el identificador de las personas que trabajan como profesor, sin que salgan valores repetidos.*/
SELECT DISTINCT idprofesor 
FROM profesor;

/*24. Mostrar el identificador de los alumnos que se encuentran matriculados en la asignatura con codigo 130122.*/
SELECT idalumno 
FROM alumno_asignatura 
WHERE idasignatura = 130122;

/*25. Mostrar los codigos de las asignaturas en las que se encuentra matriculado algun alumno, sin que salgan codigos repetidos.*/
SELECT DISTINCT a.idasignatura 
FROM asignatura a, alumno_asignatura aa 
WHERE a.idasignatura = aa.idasignatura;

/*26. Mostrar el nombre de las asignaturas que tienen mas de 4 creditos, y ademas, 
 * o se imparten en el primer cuatrimestre o son del primer curso.*/
SELECT nombre 
FROM asignatura 
WHERE creditos > 4 
AND (cuatrimestre = 1
OR curso = 1);

/*27. Mostrar los distintos codigos de las titulaciones en las que hay alguna asignatura en nuestra base de datos.*/
SELECT DISTINCT t.idtitulacion 
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion;

/*28. Mostrar el dni de las personas cuyo apellido contiene la letra G en mayusculas o minusculas.*/
SELECT dni 
FROM persona 
WHERE UPPER(apellido) LIKE 'G%'; 

/*29. Mostrar las personas varones que tenemos en la base de datos que han nacido con posterioridad 
 * a 1970 y que vivan en una ciudad que empieza por M.*/
SELECT *
FROM persona 
WHERE varon = 1 
AND fecha_nacimiento > TO_DATE('01/01/1970', 'DD/MM/YYYY')
AND UPPER(ciudad) LIKE 'M%';




