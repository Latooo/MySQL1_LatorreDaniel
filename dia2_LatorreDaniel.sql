##################################
### Dia #2 - Comandos Generales###
##################################

-- Comando general para revision de bases de datos creadas
show databases;

-- crear base de datos
create database dia2;

-- Utilizar base de datos dia2
use dia2;

-- Mostrar tablas
show tables;

-- Crear tabla departamento
create table departamento(
id int auto_increment primary key,
nombre varchar(50) not null
);

-- Crear tabla persona
create table persona(
id int auto_increment primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9),
fecha_nacimiento DATE not null,
sexo enum('H', 'M') not null,
tipo enum ('profesor', 'alumno') not null
);

-- Crear la tabla de profesor
create table profesor(
    id_profesor int primary key,
    id_departamento int not null,
    foreign key (id_profesor) references persona(id),
    foreign key (id_departamento) references departamento(id)
); 

-- Crear la tabla grado
create table grado (
id int(10) primary key,
nombre varchar (50) not null
);

-- Crear la tabla curso escolar
create table curso_escolar(
id int(10) primary key,
anyo_inicio year(4) not null,
anyo_fin year(4) not null
);

-- Crear tabla asignatura
create table asignatura (
id int(10) primary key ,
nombre varchar (100) not null,
creditos float not null,
tipo ENUM ('BASICA','OPTATIVA','OBLIGATORIA') not null,
curso tinyint(3) not null,
cuatrimestre tinyint(3) not null,
id_profesor int(10),
id_grado int(10) not null,
foreign key (id_profesor) references persona(id),
foreign key (id_grado) references grado(id)
);

-- Crear tabla alumno se matricula asignatura
create table alumno_se_matricula_asignatura(
id_alumno int (10) primary key,
id_asignatura int(10),
id_curso_escolar int(10),
foreign key (id_asignatura) references asignatura(id),
foreign key (id_curso_escolar) references curso_escolar(id),
foreign key (id_alumno) references persona(id)
);
-- Desarrollado por Daniel Latorre / CC 1.005.257.201