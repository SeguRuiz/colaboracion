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
primary key (id),
constraint cliente_unico unique (id, nombre, apellidos)  
);

-- Administradores 
CREATE TABLE administradores (
id int auto_increment not null,
nombre varchar(50) not null,
apellidos varchar(100),
correo_empresarial varchar(100) not null,
primary key (id),
constraint admin_unico unique (id, nombre, apellidos)
);



-- Tablas-hoteles

-- hoteles
CREATE TABLE hoteles (
id int auto_increment not null,
admin_id int not null,
nombre varchar(50),
ubicacion varchar(100) not null,
telefono varchar(30) not null,
correo varchar(100) not null,
primary key (id),
foreign key (admin_id) references administradores(id) on delete cascade,
constraint hotel_unico unique (id, ubicacion)
);

-- limite habitaciones hoteles


-- tipos de habitaciones
CREATE TABLE tipos_habitaciones (
id int auto_increment not null,
nombre varchar(50) not null,
limite_huespedes int not null,
precio int not null,
primary key (id)
);

-- habitaciones
CREATE TABLE habitaciones (
id int auto_increment not null,
hotel_id int not null,
tipo_id int not null,
estado varchar(35) default 'disponible',
telefono varchar(30) not null,
primary key (id),
foreign key (hotel_id) references hoteles(id) on delete cascade,
foreign key (tipo_id) references tipos_habitaciones(id) on delete cascade 
);



-- Tablas-reservaciones-huespedes

-- reservaciones
CREATE TABLE reservaciones (
id int auto_increment not null,
cliente_id int not null,
hotel_id int not null,
fecha_entrada date not null,
fecha_salida date not null,
activa bool default true,
primary key (id),
foreign key (cliente_id) references clientes(id) on delete cascade,
foreign key (hotel_id) references hoteles(id) on delete cascade,
constraint reservacion_unica unique (id, cliente_id, fecha_entrada, fecha_salida)
); 


-- huespedes
CREATE TABLE huespedes (
id int auto_increment not null,
hotel_id int not null,
reservacion_id int not null,
primary key (id),
foreign key (hotel_id) references hoteles(id) on delete cascade,
foreign key (reservacion_id) references reservaciones(id) on delete cascade
);


-- reservacion habitacion
CREATE TABLE reservas_habitaciones (
id int auto_increment not null,
reservacion_id int not null,
habitacion_id int not null,
primary key (id),
foreign key (reservacion_id) references reservaciones(id) on delete cascade,
foreign key (habitacion_id) references habitaciones(id) on delete cascade
);





-- si es necesario 
drop database reserva_hoteles;