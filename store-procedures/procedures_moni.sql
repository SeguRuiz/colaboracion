-- Calcular la ocupación de un hotel en un rango de fechas.
CREATE Procedure ocupacion_hotel ( IN idHotel INT, IN fechaInicio DATE, IN fechaFin DATE )
BEGIN
    SELECT habitaciones.id AS habitacion_id, habitaciones.estado, COUNT(reservas_habitaciones.id) AS num_reservas,
        (SELECT COUNT(*) FROM habitaciones WHERE habitaciones.hotel_id = idHotel) AS total_habitaciones,
        hoteles.nombre AS nombre_hotel
    FROM 
        habitaciones
    LEFT JOIN 
        reservas_habitaciones ON habitaciones.id = reservas_habitaciones.habitacion_id
    LEFT JOIN 
        reservaciones ON reservas_habitaciones.reservacion_id = reservaciones.id
    JOIN
        hoteles ON habitaciones.hotel_id = hoteles.id
    WHERE 
        habitaciones.hotel_id = idHotel 
        AND (reservaciones.fecha_entrada <= fechaFin OR reservaciones.fecha_entrada IS NULL)
        AND (reservaciones.fecha_salida >= fechaInicio OR reservaciones.fecha_salida IS NULL)
    GROUP BY 
        habitaciones.id 
    ORDER BY 
        habitaciones.id;

DROP PROCEDURE IF EXISTS ocupacion_hotel;

-- Ejecutar el Procedimiento con el id del hotel y el rango de fecha
CALL ocupacion_hotel(1, '2024-08-01', '2024-08-15');
CALL ocupacion_hotel(2, '2024-03-31', '2024-09-25');
---------------------------------------------------------------------------------------------------------------------
-- Cancelar una reserva existente.

CREATE PROCEDURE cancelar_reserva (IN idReservacion INT)

BEGIN UPDATE reservaciones SET activa = FALSE WHERE id = idReservacion;

DELETE FROM reservas_habitaciones WHERE reservacion_id = idReservacion;

UPDATE habitaciones h JOIN reservas_habitaciones rh ON h.id = rh.habitacion_id SET h.estado = 'disponible' WHERE rh.reservacion_id
-------------------------------------------------------------------------------------------------------------------------------
-- estado actual de la reserva
SELECT * FROM reservaciones WHERE id = 3; 
SELECT * FROM reservas_habitaciones WHERE reservacion_id = 3;
SELECT * FROM habitaciones WHERE id IN (SELECT habitacion_id FROM reservas_habitaciones WHERE reservacion_id = 3);
------------------------------------------------------------------------------------------------------------------------
-- eliminar la reserva por id
CALL cancelar_reserva(3);
-------------------------------------------------------------------------------------------------------------------------
-- verificacion de que la reservacion se elimino
SELECT * FROM reservaciones WHERE id = 3;
SELECT * FROM reservas_habitaciones WHERE reservacion_id = 3;
SELECT * FROM habitaciones WHERE id IN (SELECT habitacion_id FROM reservas_habitaciones WHERE reservacion_id = 3);
