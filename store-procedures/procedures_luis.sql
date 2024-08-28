-- Luis
USE reserva_hoteles;

-- ■ Agregar una nueva reserva.

CREATE PROCEDURE reservar_habitacion (IN id_reserva int, IN id_habitacion int)
BEGIN

INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id) VALUES (id_reserva, id_habitacion);
UPDATE habitaciones SET estado_id = 2 WHERE id = id_habitacion;


END;

CREATE PROCEDURE agregar_reservacion (IN id_cliente int, IN id_habitacion int, IN fecha_entry date, IN fecha_out date)
BEGIN

SELECT hotel_id INTO @id_hotel FROM habitaciones WHERE id = id_habitacion;

IF NOT EXISTS (SELECT * FROM reservaciones WHERE id_cliente = cliente_id AND hotel_id = @id_hotel AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida) THEN
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida) VALUES (id_cliente, @id_hotel, fecha_entry, fecha_out);

END IF;

SELECT id INTO @id_reserva FROM reservaciones WHERE id_cliente = cliente_id AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida AND @id_hotel = hotel_id LIMIT 1;

IF NOT EXISTS (SELECT reservacion_id, habitacion_id FROM reservas_habitaciones WHERE reservacion_id = @id_reserva AND habitacion_id = id_habitacion) THEN
CALL reservar_habitacion(@id_reserva, id_habitacion);
END IF;

END;

call agregar_reservacion (2, 2, '2024-02-13', '2024-11-11');

select * from reservaciones;


-- Eliminar procedures 
drop procedure agregar_reservacion;
drop procedure reservar_habitacion;

-- ■ Consultar la disponibilidad de habitaciones por fecha.

-- Procedure 
CREATE PROCEDURE verificar_habitaciones (IN fecha_consulta date)
BEGIN
SELECT * from habitaciones_reservadas_fechas WHERE fecha_consulta NOT BETWEEN fecha_entrada AND fecha_salida OR activa = false; 
END;

CALL verificar_habitaciones('2024-10-12');


-- eliminar procedure
drop procedure verificar_habitaciones; 

