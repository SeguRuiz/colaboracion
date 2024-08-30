-- Monica
USE reserva_hoteles;
--para mirar los datos de cualquier tabla
-- SELECT * FROM clientes; 
-- Datos de prueba para la tabla 'clientes'
INSERT INTO clientes (nombre, apellidos, correo_electronico, telefono_personal)
VALUES 
('Mauricio', 'Perez', 'Mauricio.perez@example.com', '+506-8056-2090'),
('Laura', 'Gómez', 'laura.gomez@example.com', '+506-7654-3215'),
('Marcos', 'Rodríguez', 'marcos.rodriguez@example.com', '+506-8888-1234'),
('Pedro', 'Martínez', 'pedro.martinez@example.com', '+506-8888-5678'),
('Ana', 'Lopes', 'ana.lopes@example.com', '+506-8888-9012');

-- Datos de prueba para la tabla 'administradores'
INSERT INTO administradores (nombre, apellidos, correo_empresarial)
VALUES 
('Luis', 'Gómez', 'admiluis.gomez@hotelcorp.com'),
('Monica', 'Barrios', 'admimonica.gomez@hotelcorp.com'),
('keylor', 'Monge', 'admiluis.gomez@hotelcorp.com'),
('steven', 'Arias', 'admiluis.gomez@hotelcorp.com'),
('Marta', 'Lara', 'admimarta.lara@hotelcorp.com'),
('César', 'Miranda', 'admicesar.miranda@hotelcorp.com')


-- Datos de prueba para la tabla 'hoteles'
INSERT INTO hoteles (admin_id, nombre, ubicacion, telefono, correo)
VALUES 
(1, 'Hotel Central', 'Avenida Central, Puntarenas, Costa Rica', '+506-4567-8901', 'contacto@hotelcentral.com'),
(2, 'Hotel Plaza', 'Calle 1, Puntarenas, Costa Rica', '+506-5678-9012', 'info@hotelplaza.com'),
(3, 'Hotel Paraíso Tropical', 'avenida 5, limon, Costa Rica','+506-8978-1309', 'contact@hotelparaisotropical.com' ),
(4, 'Hotel Pacifico', 'Paseo de los Turistas, Puntarenas, Costa Rica','+506-8978-1309','info@hotelpacifico.com'),
(5, 'Hotel Montaña Verde', 'Monteverde, Puntarenas, Costa Rica','+506-5098-5893','contacto@hotelmontañaverde.com'),
(6, 'Hotel Cielo Azul', 'Santa Cruz,Guanacaste, Costa Rica', '+506-5678-9012', 'info@hotelcieloazul.com');
-- Datos de prueba para la tabla 'tipos_habitaciones'
INSERT INTO tipos_habitaciones (nombre, limite_huespedes, precio)
VALUES 
('Sencilla', 6, 60000),
('Doble', 7, 80000),
('Suite', 5, 200000);

-- Datos de prueba para la tabla 'limite_habitaciones'
INSERT INTO limite_habitaciones (hotel_id, tipo_habitacion_id, limite_habitaciones)
VALUES
(1,1,6),
(1,2,4),
(1,3,5),
(2,1,7),
(2,2,4),
(2,3,5),
(3,1,10),
(3,2,5),
(3,3,7),
(4,1,5),
(4,2,10),
(4,3,9),
(5,1,3),
(5,2,4),
(5,3,10),
(6,1,10),
(6,2,7),
(6,3,4);

-- Datos de prueba para la tablas 'estado_habitacion'
INSERT INTO estado_habitacion (nombre_estado)
VALUES
('ocupada'),
('reservada'),
('disponible');

-- Datos de prueba para la tabla 'habitaciones'
INSERT INTO habitaciones (hotel_id, tipo_id, estado_id, telefono)
VALUES 
(1, 1, 3, '2663-9021'),
(1, 3, 3, '2363-7898'),
(1, 2, 3, '2363-7890'),
(2, 2, 3, '2590-2020'),
(2, 1, 3, '3056-2020'),
(2, 3, 3, '7856-2026'),
(3, 3, 3, '2080-7088'),
(3, 1, 3, '5678-2320'),
(3, 2, 3, '3456-7990'),
(3, 3, 3, '6786-8920'),
(4, 2, 3, '4567-9040'),
(4, 1, 3, '6789-2345'),
(5, 3, 3, '4563-7840'),
(5, 1, 3, '4579-7823'),
(6, 1, 3, '5656-2020'),
(6, 3, 3, '4567-2236');


-- Datos de prueba para la tabla 'reservaciones'
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida,fecha_agregacion, activa)
VALUES 
(1, 1, '2024-05-01', '2024-09-05', '2024-02-13', true),
(3, 2, '2024-03-29', '2024-10-29', '2024-02-13', true),
(4, 4, '2025-04-13', '2024-07-12', '2024-07-23', true),
(2, 3, '2024-11-13', '2024-12-25', '2024-07-01', true),
(1, 5, '2024-03-13', '2024-04-05', '2024-07-15', false),
(3, 3, '2023-07-18', '2023-12-31', '2023-05-17', false),
(4, 4, '2023-07-22', '2023-06-28', '2023-06-23', false);


 -- Datos de prueba para la tabla 'reservas_habitaciones'
INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id)
VALUES 
(1, 2),
(2, 3),
(4, 6),
(3, 8),
(5,1),
(6,4),
(7,3);

