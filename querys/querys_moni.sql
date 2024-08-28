SELECT hoteles.nombre, COUNT (reservaciones.id) AS total_reservas FROM hoteles LEFT JOIN reservaciones ON hoteles.id = reservaciones.hotel_id
GROUP BY hoteles.id, hoteles.nombre
ORDER BY total_reservas DESC;


SELECT COUNT(habitacion.id) AS habitaciones_disponibles FROM habitacion
LEFT JOIN reservas_habitaciones ON habitacion.id = reservas_habitaciones.habitacion_id
LEFT JOIN reservaciones ON reservas_habitaciones.reservacion_id = reservaciones.id
WHERE habitacion.hotel_id = [2] 
    AND habitacion.estado_id = (SELECT id FROM estado_habitacion WHERE nombre_estado = 'disponible')
    AND (reservaciones.fecha_entrada IS NULL OR reservaciones.fecha_salida < '[2024-09-05]' OR reservaciones.fecha_entrada > '[2024-09-01]');

SELECT 
    id,
    nombre,
    ubicacion,
    telefono,
    correo
FROM hoteles WHERE nombre LIKE '%[Hotel Plaza]%';


SELECT 
    id,
    nombre,
    ubicacion,
    telefono,
    correo
FROM  hoteles
WHERE ubicacion LIKE '[Avenida Central, Puntarenas, Costa Rica]%';
