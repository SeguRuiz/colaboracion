-- Consulta para obtener los hoteles con mayor numero de reservas
SELECT hoteles.nombre, COUNT (reservaciones.id) AS total_reservas FROM hoteles LEFT JOIN reservaciones ON hoteles.id = reservaciones.hotel_id
GROUP BY hoteles.id, hoteles.nombre
ORDER BY total_reservas DESC;

-- Consulta para obtener habitaciones en una fecha
SELECT COUNT(habitaciones.id) AS habitaciones_disponibles FROM habitaciones
LEFT JOIN reservas_habitaciones ON habitaciones.id = reservas_habitaciones.habitacion_id
LEFT JOIN reservaciones ON reservas_habitaciones.reservacion_id = reservaciones.id
WHERE habitaciones.hotel_id = 2 
    AND habitaciones.estado_id = (SELECT id FROM estado_habitacion WHERE nombre_estado = 'disponible')
    AND (reservaciones.fecha_entrada IS NULL OR reservaciones.fecha_salida < '2024-09-05' OR reservaciones.fecha_entrada > '2024-09-01');

-- Consulta para buscar hoteles por nombre
SELECT 
    id,
    nombre,
    ubicacion,
    telefono,
    correo
FROM hoteles WHERE nombre LIKE '%Hotel Plaza%';


SELECT 
    id,
    nombre,
    ubicacion,
    telefono,
    correo
FROM  hoteles
WHERE ubicacion LIKE 'Avenida Central, Puntarenas, Costa Rica%';
