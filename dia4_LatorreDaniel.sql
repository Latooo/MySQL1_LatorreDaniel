##############
### Dia #3 ###
##############

create database dia4;

use dia4;

create table pais(
id int primary key,
nombre varchar(20),
continente varchar(50),
poblacion int
);

create table ciudad(
id int primary key,
nombre varchar(20),
id_pais int,
foreign key (id_pais) references pais(id)
);

create table idioma(
id int primary key,
idioma varchar(50)
);


create table idioma_pais(
id_idioma int,
id_pais int,
es_oficial tinyint(1),
primary key (id_idioma, id_pais),
foreign key (id_idioma) references idioma(id),
foreign key (id_pais) references pais(id)
);

show tables;

INSERT INTO pais (id, nombre, continente, poblacion) VALUES 
(1, 'España', 'Europa', 47000000),
(2, 'México', 'América', 126000000),
(3, 'Japón', 'Asia', 126300000);

INSERT INTO ciudad (id, nombre, id_pais) VALUES 
(1, 'Madrid', 1),
(2, 'Barcelona', 1),
(3, 'Ciudad de México', 2),
(4, 'Guadalajara', 2),
(5, 'Tokio', 3),
(6, 'Osaka', 3);

INSERT INTO idioma (id, idioma) VALUES 
(1, 'Español'),
(2, 'Catalán'),
(3, 'Inglés'),
(4, 'Japonés');


INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES 
(1, 1, 1), -- Español es oficial en España
(2, 1, 1), -- Catalán es oficial en España
(1, 2, 1), -- Español es oficial en México
(4, 3, 1), -- Japonés es oficial en Japón
(3, 1, 0), -- Inglés no es oficial en España
(3, 2, 0), -- Inglés no es oficial en México
(3, 3, 0); -- Inglés no es oficial en Japón

-- ##### INSERCIONES ADICIONALES ####
INSERT INTO pais (id, nombre, continente, poblacion) VALUES 
(6, 'Italia', 'Europa', 60000000);

-- INNER JOIN

select pais.nombre as Pais, ciudad.nombre as Ciudad
from pais
inner join ciudad on pais.id = ciudad.id_pais;

-- LEFT JOIN

select pais.nombre as Pais, ciudad.nombre as Ciudad
from pais
left join ciudad on pais.id = ciudad.id_pais;

-- RIGHT JOIN

select pais.nombre as Pais, ciudad.nombre as Ciudad
from ciudad
right join pais on ciudad.id_pais = id_pais;


-- Desarrollado por Daniel Latorre / CC 1.005.257.201