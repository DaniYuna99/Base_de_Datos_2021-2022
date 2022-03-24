---Oracle (creacion de usuarios)

alter session set "_oracle_script"=true;  
create user alumnos identified by alumnos;
GRANT CONNECT, RESOURCE, DBA TO alumnos;


---MySQL (creacion de usuarios)
---
---		IMPORTANTE: En MySQL debe ponerse como primer
---		script porque las bases de datos van enlazadas
---		a usuarios

create database db_exampleName;
create user 'dummy'@'%' identified by 'dummy';
grant all on db_exampleName.* to 'dummy'@'%';