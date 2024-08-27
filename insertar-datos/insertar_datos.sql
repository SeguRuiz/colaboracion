-- Monica
USE reserva_hoteles;
--para mirar los datos de cualquier tabla
SELECT * FROM; 
-- Datos de prueba para la tabla 'clientes'
INSERT INTO clientes (nombre, apellidos, correo_electronico, telefono_personal)
VALUES 
('Marcos', 'Rodríguez', 'marcos.rodriguez@example.com', '+506-8888-1234'),
('Pedro', 'Martínez', 'pedro.martinez@example.com', '+506-8888-5678'),
('Ana', 'Lopes', 'ana.lopes@example.com', '+506-8888-9012');

-- Datos de prueba para la tabla 'administradores'
INSERT INTO administradores (nombre, apellidos, correo_empresarial)
VALUES 
('Luis', 'Gómez', 'admiluis.gomez@hotelcorp.com'),
('Marta', 'Lara', 'admimarta.lara@hotelcorp.com');

-- Datos de prueba para la tabla 'hoteles'
INSERT INTO hoteles (admin_id, nombre, ubicacion, telefono, correo)
VALUES 
(1, 'Hotel Central', 'Avenida Central, Puntarenas, Costa Rica', '+506-4567-8901', 'contacto@hotelcentral.com'),
(2, 'Hotel Plaza', 'Calle 1, Puntarenas, Costa Rica', '+506-5678-9012', 'info@hotelplaza.com');

-- Datos de prueba para la tabla 'tipos_habitaciones'
INSERT INTO tipos_habitaciones (nombre, limite_huespedes, precio)
VALUES 
('Sencilla', 1, 60000),
('Doble', 2, 80000),
('Suite', 4, 200000);

-- Datos de prueba para la tabla 'limite_habitaciones'
INSERT INTO limite_habitaciones (hotel_id, tipo_habitacion_id, limite_habitaciones)
VALUES
(1, 1, 10),
(1, 2, 10),
(1, 3, 5),
(2, 1, 20),
(2, 2, 10),
(2, 3, 10)

-- Datos de prueba para la tablas 'estado_habitacion'
INSERT INTO estado_habitacion (nombre_estado)
VALUES
('ocupada'),
('reservada'),
('disponible')

-- Datos de prueba para la tabla 'habitaciones'
INSERT INTO habitaciones (hotel_id, tipo_id, estado_id, telefono)
VALUES 
(1, 1, 3, '2663-9021'),
(1, 2, 3, '2590-2020'),
(2, 3, 3, '2080-7088'),
(2, 2, 3, '4567-9040');

-- Datos de prueba para la tabla 'reservaciones'
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa)
VALUES 
(1, 1, '2024-09-01', '2024-09-05', true),
(2, 2, '2024-09-10', '2024-09-15', true),
(3, 1, '2024-09-20', '2024-09-25', false);

-- Datos de prueba para la tabla 'huespedes'

INSERT INTO huespedes (hotel_id, reservacion_id)
VALUES 
(1, 1),
(2, 2),
(1, 3);
 -- Datos de prueba para la tabla 'reservas_habitaciones'
INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id)
VALUES 
(1, 1),
(2, 3),
(3, 2);


