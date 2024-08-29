-- Luis

-- Base de datos

CREATE DATABASE reserva_hoteles;
USE reserva_hoteles;


-- Tablas-personas
-- clientes 
CREATE TABLE clientes (
id int auto_increment not null,
nombre varchar(50) not null,
apellidos varchar(100),
correo_electronico varchar(50) not null,
telefono_personal varchar(30),
primary key (id), -- id es la clave primaria porque es un identificador unico de cada cliente 
constraint cliente_unico unique (id, nombre, apellidos) -- cliente_unico asegura que no haya duplicados en la combinación de id, nombre, y apellidos
);
-- "clientes en normalizacion es 3FN"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.

-- Administradores 
CREATE TABLE administradores (
id int auto_increment not null,
nombre varchar(50) not null,
apellidos varchar(100),
correo_empresarial varchar(100) not null,
primary key (id), -- id es la clave primaria porque es un identificador unico de cada administrador
constraint admin_unico unique (id, nombre, apellidos) -- la constraint admin_unico evita datos dobles en la combinacion de id, nombre, apellidos
);
-- "administradores es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.



-- Tablas-hoteles

-- hoteles
CREATE TABLE hoteles (
id int auto_increment not null,
admin_id int not null,
nombre varchar(50),
ubicacion varchar(100) not null,
telefono varchar(30) not null,
correo varchar(100) not null,
primary key (id), -- id asegura que cada hotel tenga un identificador único
foreign key (admin_id) references administradores(id) on delete cascade,-- se establece la relacion entre hoteles y administradores
constraint hotel_unico unique (id, ubicacion) -- hotel_unico asegura que no haya dos hoteles 
);
-- "hoteles es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.


-- tipos de habitaciones
CREATE TABLE tipos_habitaciones (
id int auto_increment not null, -- not null asegura que siempre se proporcionen valores válidos y necesario
nombre varchar(50) not null, --  not null asegura que siempre se proporcionen valores válidos y necesario
limite_huespedes int not null, --  not null asegura que siempre se proporcionen valores válidos y necesario
precio int not null, --  not null asegura que siempre se proporcionen valores válidos y necesario
primary key (id) -- id permite identificar de forma única cada tipo de habitación
);
-- "tipos_habitaciones es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.


-- limite de habitaciones
CREATE TABLE limite_habitaciones (
id int auto_increment not null,
hotel_id int not null,
tipo_habitacion_id int not null,
limite_habitaciones int not null,
primary key (id), -- id garantiza la unicidad de los registros en limite_habitaciones
foreign key (hotel_id) references hoteles(id) on delete cascade,-- cada valor en hotel_id y limite_habitaciones corresponda a un id existente en hoteles 
foreign key (tipo_habitacion_id) references tipos_habitaciones(id) on delete cascade -- cada tipo_habitacion_id corresponda a un id existente en tipos_habitaciones
)
-- "limite_habitaciones es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.

-- estado_habitacion
CREATE TABLE estado_habitacion (
id int auto_increment not null,
nombre_estado varchar(50) not null,
primary key (id)
)
-- "estado_habitacion es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas con unicos.
-- 2FN: Todas las columnas dependen de la llave primaria ID.
-- 3FN: No hay dependencias transitivas.
-- habitaciones

CREATE TABLE habitaciones (
id int auto_increment not null,
hotel_id int not null,
tipo_id int not null,
estado_id int default 3 not null, -- el valor por defecto 'disponible' para nuevas habitaciones.
telefono varchar(30) not null,
primary key (id), -- clave primaria id para  identificar cada habitacion de forma unica 
foreign key (hotel_id) references hoteles(id) on delete cascade, -- esta constraint (hotel_id) asegura la relación válida con la tabla hoteles.
foreign key (tipo_id) references tipos_habitaciones(id) on delete cascade, -- esta constraint (tipo_id) garantiza la relación válida con la tabla tipos_habitaciones.
foreign key (estado_id) references estado_habitacion(id) on delete cascade
);
-- "habitaciones es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.


-- Tablas-reservaciones-huespedes

-- reservaciones
CREATE TABLE reservaciones (
id int auto_increment not null,
cliente_id int not null,
hotel_id int not null,
fecha_entrada date not null,
fecha_salida date not null,
activa bool default true,
fecha_agregacion date DEFAULT (CURDATE()),
primary key (id), -- id para identificar de forma única cada reservación dentro del sistema.
foreign key (cliente_id) references clientes(id) on delete cascade, -- asegura que cada reservación esté vinculada a un cliente válido
foreign key (hotel_id) references hoteles(id) on delete cascade,-- garantiza que cada reservación esté asociada a un hotel válido
constraint reservacion_unica unique (id, cliente_id, fecha_entrada, fecha_salida) -- reservacion_unica asegura que no haya dos reservaciones iguales en la misma fecha
); 
-- Agregar columna de día
-- "reservaciones es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.



-- huespedes
CREATE TABLE huespedes (
id int auto_increment not null,
hotel_id int not null,
reservacion_id int not null,
primary key (id), -- id como identificador unico del huesped
foreign key (hotel_id) references hoteles(id) on delete cascade,  -- asegura que cada hotel_id en huespedes esté asociado a un hotel válido
foreign key (reservacion_id) references reservaciones(id) on delete cascade -- esta FOREIGN KEY para que cada huésped esté vinculado a una reservación válida.
);
-- "huespedes es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.


-- reservacion habitacion
CREATE TABLE reservas_habitaciones (
id int auto_increment not null,
reservacion_id int not null,
habitacion_id int not null,
primary key (id), -- id asegura que cada registro en reservas_habitaciones sea único
foreign key (reservacion_id) references reservaciones(id) on delete cascade, -- FOREIGN KEY Vincula cada reserva con una reservación válida.
foreign key (habitacion_id) references habitaciones(id) on delete cascade -- FOREIGN KEY  Vincula cada reserva con una habitación válida.
);
-- "reservas_habitaciones es FN3 segun la normalizacion"
-- 1FN: Todos los valores en las columnas son atómicos.
-- 2FN: Todas las columnas dependen completamente de la llave primaria (id).
-- 3FN: No hay dependencias transitivas, todas las columnas dependen únicamente de la llave primaria.
-- si es necesario 


drop database reserva_hoteles;

-- CALL iniciar_base_de_datos();

