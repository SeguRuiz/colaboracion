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
    r.fecha_agregacion = CURDATE();


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

-- numero de reservaciones de los clientes
CREATE VIEW reservaciones_clientes AS
SELECT clientes.*, COUNT(reservaciones.id) AS numero_reservaciones
FROM clientes LEFT JOIN 
reservaciones ON reservaciones.cliente_id = clientes.id
GROUP BY clientes.id

DROP VIEW reservaciones_clientes;

SELECT * FROM reservaciones_clientes;

-- reservaciones diarias por hotel
CREATE VIEW reservaciones_hoteles AS 
SELECT hotel_id,fecha_agregacion, COUNT(id) AS numero_reservaciones
FROM reservaciones GROUP BY
fecha_agregacion, hotel_id;

SELECT * FROM reservaciones_hoteles

DROP VIEW reservaciones_hoteles

-- Info_habitaciones
CREATE VIEW info_habitaciones AS
SELECT habitaciones.id, hoteles.nombre AS nombre_hotel, tipos_habitaciones.nombre AS nombre_habitacion FROM habitaciones
LEFT JOIN tipos_habitaciones
ON habitaciones.tipo_id = tipos_habitaciones.id 
LEFT JOIN hoteles
ON habitaciones.hotel_id = hoteles.id

SELECT * FROM info_habitaciones;

DROP VIEW info_habitaciones

-- Verificar limites de hoteles
CREATE VIEW limite_hoteles AS 
SELECT hotel_id,SUM(tipos_habitaciones.limite_huespedes * limite_habitaciones) AS limite_huespedes_hotel FROM limite_habitaciones 
LEFT JOIN tipos_habitaciones ON limite_habitaciones.tipo_habitacion_id = tipos_habitaciones.id
GROUP BY hotel_id;


SELECT * FROM limite_hoteles;

DROP VIEW limite_hoteles;