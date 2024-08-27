-- Luis
USE reserva_hoteles;

-- ■ Agregar una nueva reserva.

CREATE PROCEDURE reservar_habitacion (IN id_reserva int, IN id_habitacion int)
BEGIN

INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id) VALUES (id_reserva, id_habitacion);
UPDATE habitaciones SET estado_id = 2 WHERE id = id_habitacion;


END;

CREATE PROCEDURE agregar_reservacion (IN id_cliente int, IN id_hotel int, IN id_habitacion int, IN fecha_entry date, IN fecha_out date)
BEGIN

IF NOT EXISTS (SELECT * FROM reservaciones WHERE id_cliente = cliente_id AND id_hotel = hotel_id AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida) THEN
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida) VALUES (id_cliente, id_hotel, fecha_entry, fecha_out);

END IF;

SELECT id INTO @id_reserva FROM reservaciones WHERE id_cliente = cliente_id AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida AND id_hotel = hotel_id LIMIT 1;

IF NOT EXISTS (SELECT reservacion_id, habitacion_id FROM reservas_habitaciones WHERE reservacion_id = @id_reserva AND habitacion_id = id_habitacion) THEN
CALL reservar_habitacion(@id_reserva, id_habitacion);
END IF;

END;

call agregar_reservacion (1, 1, 3, '2024-09-11', '2024-11-05');

select * from reservaciones;


-- Eliminar procedures 
drop procedure agregar_reservacion;
drop procedure reservar_habitacion;

delete from reservaciones where id < 10;
delete from reservas_habitaciones where id < 10;
update habitaciones set estado_id = 3 where id < 10;

-- ■ Consultar la disponibilidad de habitaciones por fecha.

-- Vista que muestra las habitaciones ocupadas con sus fechas de reservacion
CREATE VIEW habitaciones_reservadas_fechas AS 
SELECT habitacion_id, reservaciones.cliente_id, reservaciones.fecha_entrada, reservaciones.fecha_salida FROM 
reservas_habitaciones LEFT JOIN 
reservaciones ON 
reservas_habitaciones.reservacion_id = reservaciones.id;  

-- Para ver y eliminar la vista
SELECT * FROM habitaciones_reservadas_fechas;
DROP VIEW habitaciones_reservadas_fechas;

-- Procedure 
CREATE PROCEDURE verificar_habitaciones (IN fecha_consulta date)
BEGIN
SELECT * from habitaciones_reservadas_fechas WHERE fecha_consulta NOT BETWEEN fecha_entrada AND fecha_salida; 
END;

CALL verificar_habitaciones('2024-05-12');



-- eliminar procedure
drop procedure verificar_habitaciones; 
