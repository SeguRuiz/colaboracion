-- Monica
USE reserva_hoteles;
--para mirar los datos de cualquier tabla
SELECT * FROM clientes; 
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
('Marta', 'Lara', 'admimarta.lara@hotelcorp.com');


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
(6,1,6),
(11,2,7),
(16,3,3),
(7,4,2),
(12,5,1);
SELECT id FROM clientes;
SELECT id FROM tipos_habitaciones;


-- Datos de prueba para la tablas 'estado_habitacion'
INSERT INTO estado_habitacion (nombre_estado)
VALUES
('ocupada'),
('reservada'),
('disponible')

-- Datos de prueba para la tabla 'habitaciones'
INSERT INTO habitaciones (hotel_id, tipo_id, estado_id, telefono)
VALUES 
(6, 1, 3, '2663-9021'),
(20, 2, 3, '2590-2020'),
(19, 3, 3, '2080-7088'),
(10, 2, 3, '4567-9040'),
(14, 3, 3, '4563-7840');


-- Datos de prueba para la tabla 'reservaciones'
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa)
VALUES 
(1, 10, '2024-07-01', '2024-09-05', true),
(3, 20, '2024-07-29', '2024-07-29', true),
(3, 21, '2024-09-20', '2024-09-25', false),
(1, 8, '2023-07-15', '2023-07-20', false),
(2, 9, '2024-07-29', '2024-07-30', true),
(3, 10, '2023-07-18', '2023-12-31', false),
(4, 15, '2023-07-22', '2023-06-28', true);

-- Datos de prueba para la tabla 'huespedes'

INSERT INTO huespedes (hotel_id, reservacion_id)
VALUES 
(19, 25),
(20, 26),
(14, 34);
 -- Datos de prueba para la tabla 'reservas_habitaciones'
INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id)
VALUES 
(28, 16),
(27, 19),
(23, 20),
(24, 17),
(26, 19),
(27, 18);

