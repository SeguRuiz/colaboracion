-- Luis 
USE reserva_hoteles;

-- ○ Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM hoteles WHERE ubicacion LIKE '%Costa Rica';

-- ○ Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT * FROM reservaciones 
WHERE MONTH(fecha_agregacion) = MONTH(ADDDATE(CURDATE(), INTERVAL -1 MONTH)) 
AND cliente_id IN (SELECT id FROM clientes WHERE correo_electronico = 'marcos.rodriguez@example.com');

-- ○ Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
SELECT habitaciones_ocupacion.hotel_id, SUM(habitaciones_ocupacion.limite_huespedes) 
AS maximo_ocupacion 
FROM habitaciones_ocupacion
WHERE nombre IS NOT NULL AND limite_huespedes IS NOT NULL 
AND habitaciones_ocupacion.id IN (SELECT habitacion_id FROM habitaciones_reservadas_fechas WHERE ADDDATE(CURDATE(), INTERVAL -2 MONTH) BETWEEN fecha_entrada AND fecha_salida)
GROUP BY
hotel_id; 

-- ○ Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.
SELECT habitaciones.hotel_id AS 'hotel', habitaciones.id AS 'habitacion' FROM habitaciones WHERE habitaciones.id IN 
(SELECT habitacion_id FROM habitaciones_reservadas_fechas WHERE estado_id = 3 AND id IN (SELECT id FROM reservaciones WHERE MONTH(fecha_agregacion) = MONTH(ADDDATE(CURDATE(), INTERVAL -1 MONTH))) 
AND CURDATE())) OR
habitaciones.id NOT IN (SELECT habitacion_id FROM reservas_habitaciones WHERE habitacion_id = habitaciones.id);

-- ○ Consulta para calcular el promedio de reservas diarias en un hotel.
SELECT AVG(numero_reservaciones) AS promedio_reservaciones_diarias FROM reservaciones_diarias;

