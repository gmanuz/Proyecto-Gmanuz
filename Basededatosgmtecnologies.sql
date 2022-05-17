CREATE DATABASE gmtecnologies;
USE gmtecnologies;

DROP TABLE IF EXISTS empleados;
CREATE TABLE empleados (
dni char (9)    NOT NULL PRIMARY KEY,
nombre varchar (20) NOT NULL,
apellido1 varchar (20) NOT NULL,
apellido2 varchar (20) NOT NULL,
puesto varchar (20) NOT NULL,
correo varchar (20) NOT NULL
)engine=innodb;

DROP TABLE IF EXISTS jefes;
CREATE TABLE jefes (
dni char (9)   NOT NULL PRIMARY KEY,
nombre varchar (20) NOT NULL,
apellido1 varchar (20) NOT NULL,
apellido2 varchar (20) NOT NULL,
correo varchar (20) NOT NULL
)engine=innodb;

DROP TABLE IF EXISTS equipos;
 CREATE TABLE equipos (
sistemas varchar (20) NOT NULL,
BBDD varchar (20) NOT NULL,
soporte_tecnico varchar (20) NOT NULL,
administracion varchar (20) NOT NULL,
programacion varchar (20) NOT NULL
);

CREATE TABLE sistemas (
empleado  char (9)  NOT NULL,
jefe       char (9)  NOT NULL,
CONSTRAINT FK_sistemas_EMPLEADO FOREIGN KEY (empleado) REFERENCES empleados(dni),
CONSTRAINT FK_sistemas_JEFE FOREIGN KEY (jefe) REFERENCES jefes(dni),
primary key (empleado, jefe)
)engine=innodb;


CREATE TABLE BBDD (
empleado  char (9)  NOT NULL,
jefe       char (9)  NOT NULL,
CONSTRAINT FK_BBDD_EMPLEADO FOREIGN KEY (empleado) REFERENCES empleados(dni),
CONSTRAINT FK_BBDD_JEFE FOREIGN KEY (jefe) REFERENCES jefes(dni),
primary key (empleado, jefe)
)engine=innodb;

CREATE TABLE soporte_tecnico (
empleado  char (9)  NOT NULL,
jefe       char (9)  NOT NULL,
CONSTRAINT FK_SOPORTE_TECNICO_EMPLEADO FOREIGN KEY (empleado) REFERENCES empleados(dni),
CONSTRAINT FK_SOPORTE_TECNICO_JEFE FOREIGN KEY (jefe) REFERENCES jefes(dni),
primary key (empleado, jefe)
)engine=innodb;

CREATE TABLE administracion (
empleado  char (9)  NOT NULL,
jefe       char (9)  NOT NULL,
CONSTRAINT FK_administracion_EMPLEADO FOREIGN KEY (empleado) REFERENCES empleados(dni),
CONSTRAINT FK_administracion_JEFE FOREIGN KEY (jefe) REFERENCES jefes(dni),
primary key (empleado, jefe)
)engine=innodb;

CREATE TABLE programacion (
empleado  char (9)  NOT NULL,
jefe       char (9)  NOT NULL,
CONSTRAINT FK_programacion_EMPLEADO FOREIGN KEY (empleado) REFERENCES empleados(dni),
CONSTRAINT FK_programacion_JEFE FOREIGN KEY (jefe) REFERENCES jefes(dni),
primary key (empleado, jefe)
)engine=innodb;
