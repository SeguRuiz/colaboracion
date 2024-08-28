-- Luis 
USE reserva_hoteles;

-- ○ Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM hoteles WHERE ubicacion LIKE '%Costa Rica';

-- ○ Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT * FROM reservaciones 
WHERE MONTH(fecha_agregacion) = MONTH(ADDDATE(CURDATE(), INTERVAL -1 MONTH)) 
AND cliente_id IN (SELECT id FROM clientes WHERE correo_electronico = 'marcos.rodriguez@example.com');

-- ○ Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
SELECT hotel_id, SUM(limite_huespedes) AS ocupacion
FROM habitaciones_reservadas_fechas
WHERE activa = TRUE AND ADDDATE(CURDATE(), INTERVAL -1 MONTH) BETWEEN fecha_entrada AND fecha_salida 
GROUP BY hotel_id
ORDER BY ocupacion DESC


-- ○ Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.
SELECT * FROM hoteles
WHERE id NOT IN 
(SELECT hotel_id FROM habitaciones_reservadas_fechas WHERE ADDDATE(CURDATE(), INTERVAL -1 MONTH) 
BETWEEN fecha_entrada AND fecha_salida) 
OR NOT EXISTS (SELECT hotel_id FROM habitaciones_reservadas_fechas WHERE id = hotel_id);

SELECT * FROM hoteles
WHERE id NOT IN 
(SELECT hotel_id FROM habitaciones_reservadas_fechas WHERE MONTH(fecha_agregacion) = MONTH(ADDDATE(CURDATE(), INTERVAL -1 MONTH))) 
OR NOT EXISTS (SELECT hotel_id FROM habitaciones_reservadas_fechas WHERE id = hotel_id);

-- ○ Consulta para calcular el promedio de reservas diarias en un hotel.
SELECT AVG(numero_reservaciones) AS promedio_reservaciones_diarias FROM reservaciones_diarias;

