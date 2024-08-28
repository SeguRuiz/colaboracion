CREATE PROCEDURE iniciar_base_de_datos()
BEGIN
    CREATE DATABASE IF NOT EXISTS reserva_hoteles;
    SET @dbname = 'reserva_hoteles';
    SET @query = CONCAT('USE ', @dbname);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    CREATE TABLE IF NOT EXISTS clientes (
        id int auto_increment not null,
        nombre varchar(50) not null,
        apellidos varchar(100),
        correo_electronico varchar(50) not null,
        telefono_personal varchar(30),
        primary key (id),
        constraint cliente_unico unique (id, nombre, apellidos)
    );
    
    CREATE Table if NOT exists administradores(
        id INT AUTO_INCREMENT NOT NULL,
        nombre VARCHAR(50) NOT NULL,
        apellidos VARCHAR (100),
        correo_empresarial VARCHAR (100),
        PRIMARY KEY (id),
        constraint admin_unico unique (id, nombre, apellidos)
    );

    CREATE TABLE IF NOT EXISTS hoteles (
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

    CREATE TABLE IF NOT EXISTS tipos_habitaciones (
        id int auto_increment not null,
        nombre varchar(50) not null,
        limite_huespedes int not null,
        precio int not null,
        primary key (id)
    );

    CREATE TABLE IF NOT EXISTS limite_habitaciones (
        id int auto_increment not null,
        hotel_id int not null,
        tipo_habitacion_id int not null,
        limite_habitaciones int not null,
        primary key (id),
        foreign key (hotel_id) references hoteles(id) on delete cascade,
        foreign key (tipo_habitacion_id) references tipos_habitaciones(id) on delete cascade
    );
    CREATE Table if NOT EXISTS estado_habitacion(
        id INT AUTO_INCREMENT NOT NULL,
        nombre_estado VARCHAR (50) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE Table if NOT EXISTS habitacion(
        id INT AUTO_INCREMENT NOT NULL,
        hotel_id INT NOT NUll,
        tipo_id INT NOT NULL,
        estado_id int default 3 not null,
        telefono varchar(30) not null,
        primary key (id),
        foreign key (hotel_id) references hoteles(id) on delete cascade,
        foreign key (tipo_id) references tipos_habitaciones(id) on delete cascade,
        foreign key (estado_id) references estado_habitacion(id) on delete cascade
    );
    CREATE TABLE IF NOT EXISTS reservaciones (
        id int auto_increment not null,
        cliente_id int not null,
        hotel_id int not null,
        fecha_entrada date not null,
        fecha_salida date not null,
        activa bool default true,
        fecha_agregacion date DEFAULT (CURDATE()),
        primary key (id),
        foreign key (cliente_id) references clientes(id) on delete cascade,
        foreign key (hotel_id) references hoteles(id) on delete cascade,
        constraint reservacion_unica unique (id, cliente_id, fecha_entrada, fecha_salida)
    );
    CREATE TABLE IF NOT EXISTS huespedes (
        id int auto_increment not null,
        hotel_id int not null,
        reservacion_id int not null,
        primary key (id),
        foreign key (hotel_id) references hoteles(id) on delete cascade,
        foreign key (reservacion_id) references reservaciones(id) on delete cascade
    );

    CREATE TABLE IF NOT EXISTS reservas_habitaciones (
        id int auto_increment not null,
        reservacion_id int not null,
        habitacion_id int not null,
        primary key (id),
        foreign key (reservacion_id) references reservaciones(id) on delete cascade,
        foreign key (habitacion_id) references habitaciones(id) on delete cascade
    );
    

    INSERT INTO clientes (nombre, apellidos, correo_electronico, telefono_personal) VALUES 
        ('Marcos', 'Rodríguez', 'marcos.rodriguez@example.com', '+506-8888-1234'),
        ('Pedro', 'Martínez', 'pedro.martinez@example.com', '+506-8888-5678'),
        ('Ana', 'Lopes', 'ana.lopes@example.com', '+506-8888-9012');

    INSERT INTO administradores (nombre, apellidos, correo_empresarial) VALUES 
        ('Luis', 'Gómez', 'admiluis.gomez@hotelcorp.com'),
        ('Marta', 'Lara', 'admimarta.lara@hotelcorp.com');

    INSERT INTO hoteles (admin_id, nombre, ubicacion, telefono, correo) VALUES 
        (1, 'Hotel Central', 'Avenida Central, Puntarenas, Costa Rica', '+506-4567-8901', 'contacto@hotelcentral.com'),
        (2, 'Hotel Plaza', 'Calle 1, Puntarenas, Costa Rica', '+506-5678-9012', 'info@hotelplaza.com');

    INSERT INTO tipos_habitaciones (nombre, limite_huespedes, precio) VALUES 
        ('Sencilla', 1, 60000),
        ('Doble', 2, 80000),
        ('Suite', 4, 200000);

    INSERT INTO limite_habitaciones (hotel_id, tipo_habitacion_id, limite_habitaciones) VALUES
        (1, 1, 10),
        (1, 2, 10),
        (1, 3, 5),
        (2, 1, 20),
        (2, 2, 10),
        (2, 3, 10);

    INSERT INTO estado_habitacion (nombre_estado) VALUES
        ('ocupada'),
        ('reservada'),
        ('disponible');

    INSERT INTO habitaciones (hotel_id, tipo_id, estado_id, telefono) VALUES 
        (1, 1, 3, '2663-9021'),
        (1, 2, 3, '2590-2020'),
        (2, 3, 3, '2080-7088'),
        (2, 2, 3, '4567-9040');

    INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa) VALUES 
        (1, 1, '2024-09-01', '2024-09-05', true),
        (2, 2, '2024-09-10', '2024-09-15', true),
        (3, 1, '2024-09-20', '2024-09-25', false);

    INSERT INTO huespedes (hotel_id, reservacion_id) VALUES 
        (1, 1),
        (2, 2),
        (1, 3);

    INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id) VALUES 
        (1, 1),
        (2, 3),
        (3, 2);

    CREATE VIEW reservaciones_hoy AS
    SELECT 
        r.id, 
        r.cliente_id, 
        r.hotel_id, 
        r.fecha_entrada, 
        r.fecha_salida, 
        r.activa
    FROM 
        reservaciones r
    WHERE 
        r.fecha_entrada = CURRENT_DATE;

    CREATE VIEW habitaciones_reservadas_fechas AS 
    SELECT habitacion_id, reservaciones.cliente_id, reservaciones.fecha_entrada, reservaciones.fecha_salida, reservaciones.activa FROM 
    reservas_habitaciones LEFT JOIN 
    reservaciones ON 
    reservas_habitaciones.reservacion_id = reservaciones.id;
END 

USE practica;
SELECT * FROM clientes;


-- CREATE DATABASE IF NOT EXISTS reserva_hoteles;
USE reserva_hoteles;
CALL iniciar_base_de_datos();

-- DROP PROCEDURE IF EXISTS iniciar_base_de_datos;