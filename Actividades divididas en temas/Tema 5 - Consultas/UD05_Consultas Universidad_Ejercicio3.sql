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

--1. Cuantos costes b�sicos hay.
SELECT COUNT(costebasico) FROM ASIGNATURA;   
	   
--2. Para cada titulaci�n mostrar el n�mero de asignaturas que hay junto con el nombre de la titulaci�n.


--3. Para cada titulaci�n mostrar el nombre de la titulaci�n junto con el precio total de todas sus asignaturas.


--4. Cual ser�a el coste global de cursar la titulaci�n de Matem�ticas si el coste de cada asignatura fuera incrementado en un 7%. 
SELECT asignatura.costebasico*0.07 AS coste + 7%, asignatura.idtitulacion, titulacion.idtitulacion, titulacion.nombre 
FROM asignatura, titulacion 
WHERE asignatura.idtitulacion = titulacion.idtitulacion
AND titulacion.nombre LIKE 'Matem%';                                  --EST� MAL

--5. Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. 


--6. Igual que el anterior pero mostrando el nombre de la asignatura.


--7. Mostrar para cada alumno, el nombre del alumno junto con lo que tendr�a que pagar por el total de todas las asignaturas en las que est� matriculada. Recuerda que el precio de la matr�cula tiene un incremento de un 10% por cada a�o en el que est� matriculado. 


--8. Coste medio de las asignaturas de cada titulaci�n, para aquellas titulaciones en el que el coste total de la 1� matr�cula sea mayor que 60 euros. 


--9. Nombre de las titulaciones  que tengan m�s de tres alumnos.


--10. Nombre de cada ciudad junto con el n�mero de personas que viven en ella.


--11. Nombre de cada profesor junto con el n�mero de asignaturas que imparte.


--12. Nombre de cada profesor junto con el n�mero de alumnos que tiene, para aquellos profesores que tengan dos o m�s de 2 alumnos.


--13. Obtener el m�ximo de las sumas de los costesb�sicos de cada cuatrimestre
SELECT SUM(MAX(costebasico)) FROM ASIGNATURA GROUP BY cuatrimestre;

--14. Suma del coste de las asignaturas
SELECT SUM (costebasico) FROM ASIGNATURA;

--15. �Cu�ntas asignaturas hay?
SELECT COUNT(idasignatura) FROM ASIGNATURA;

--16. Coste de la asignatura m�s cara y de la m�s barata
SELECT MAX(costebasico), MIN(costebasico) FROM asignatura;

--17. �Cu�ntas posibilidades de cr�ditos de asignatura hay?
SELECT COUNT(creditos) FROM asignatura;

--18. �Cu�ntos cursos hay?
SELECT COUNT(curso) FROM asignatura;

--19. �Cu�ntas ciudades hay?
SELECT COUNT(ciudad) FROM persona;

--20. Nombre y n�mero de horas de todas las asignaturas.
SELECT nombre, creditos*10 AS horas FROM asignatura;

--21. Mostrar las asignaturas que no pertenecen a ninguna titulaci�n.
SELECT * FROM asignatura WHERE idtitulacion IS NULL;

--22. Listado del nombre completo de las personas, sus tel�fonos y sus direcciones, 
--llamando a la columna del nombre "NombreCompleto" y a la de direcciones "Direccion".


--23. Cual es el d�a siguiente al d�a en que nacieron las personas de la B.D.


--24. A�os de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento.


--25. Listado de personas mayores de 25 a�os ordenadas por apellidos y nombre, esta consulta tiene que valor para cualquier momento.


--26. Nombres completos de los profesores que adem�s son alumnos.


--27. Suma de los cr�ditos de las asignaturas de la titulaci�n de Matem�ticas.


--28. N�mero de asignaturas de la titulaci�n de Matem�ticas.       --EST� MAL
SELECT COUNT(asignatura.idasignatura), titulacion.nombre FROM asignatura, titulacion WHERE titulacion.idtitulacion = asignatura.idtitulacion AND titulacion.nombre LIKE 'Matematicas';

--29. �Cu�nto paga cada alumno por su matr�cula?

--30. �Cu�ntos alumnos hay matriculados en cada asignatura?



--No s� hacer el resto. 


















