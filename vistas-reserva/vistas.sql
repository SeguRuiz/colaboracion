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
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa)
VALUES 
(1, 1, CURDATE(), '2024-09-05', true),
(3, 1, "2024-09-20", '2024-09-25', TRUE),
(3, 1, "2024-08-26", '2024-09-25', TRUE)
;

SELECT * FROM reservaciones_hoy;

-- Vista que muestra las habitaciones ocupadas con sus fechas de reservacion
CREATE VIEW habitaciones_reservadas_fechas AS 
SELECT habitacion_id, reservaciones.id, reservaciones.cliente_id, reservaciones.hotel_id, reservaciones.fecha_entrada, reservaciones.fecha_salida, reservaciones.fecha_agregacion, reservaciones.activa, tipos_habitaciones.limite_huespedes FROM 
reservas_habitaciones LEFT JOIN 
reservaciones ON reservas_habitaciones.reservacion_id = reservaciones.id
LEFT JOIN
habitaciones ON reservas_habitaciones.habitacion_id = habitaciones.id
LEFT JOIN
tipos_habitaciones ON habitaciones.tipo_id = tipos_habitaciones.id


-- Para ver y eliminar la vista
SELECT * FROM habitaciones_reservadas_fechas;
DROP VIEW habitaciones_reservadas_fechas;


-- ver las reservaciones diarias
CREATE VIEW reservaciones_diarias AS 
SELECT fecha_agregacion, COUNT(id) AS numero_reservaciones
FROM reservaciones GROUP BY
fecha_agregacion;

DROP VIEW reservaciones_diarias

SELECT * FROM reservaciones_diarias

-- ver ocupacion de hoteles
CREATE VIEW ocupacion_hoteles AS
SELECT hotel_id, SUM(limite_huespedes) AS ocupacion
FROM habitaciones_reservadas_fechas
WHERE activa = TRUE 
GROUP BY hotel_id;

SELECT * FROM ocupacion_hoteles;

DROP VIEW ocupacion_hoteles;