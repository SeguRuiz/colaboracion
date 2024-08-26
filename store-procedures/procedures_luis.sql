-- Luis
USE reserva_hoteles;

-- ■ Agregar una nueva reserva.

CREATE PROCEDURE reservar_habitacion (IN id_reserva int, IN id_habitacion int)
BEGIN

INSERT INTO reservas_habitaciones (reservacion_id, habitacion_id) VALUES (id_reserva, id_habitacion);
UPDATE habitaciones SET estado = 'reservada' WHERE id = id_habitacion;
SELECT * FROM reservas_habitaciones;

END;

CREATE PROCEDURE agregar_reservacion (IN id_cliente int, IN id_hotel int, IN id_habitacion int, IN fecha_entry date, IN fecha_out date)
BEGIN

IF NOT EXISTS (SELECT * FROM reservaciones WHERE id_cliente = cliente_id AND id_hotel = hotel_id AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida) THEN
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida) VALUES (id_cliente, id_hotel, fecha_entry, fecha_out);
SELECT * FROM reservaciones;
END IF;

SELECT id INTO @id_reserva FROM reservaciones WHERE id_cliente = cliente_id AND fecha_entry = fecha_entrada AND fecha_out = fecha_salida AND id_hotel = hotel_id LIMIT 1;

IF NOT EXISTS (SELECT reservacion_id, habitacion_id FROM reservas_habitaciones WHERE reservacion_id = @id_reserva AND habitacion_id = id_habitacion) THEN
CALL reservar_habitacion(@id_reserva, id_habitacion);
END IF;

END;

call agregar_reservacion (1, 2, 2, '2024-09-16', '2024-09-15');
select * from reservaciones;


-- Eliminar procedures 
drop procedure agregar_reservacion;
drop procedure reservar_habitacion;

delete from reservaciones where id < 10;
delete from reservas_habitaciones where id < 10;
update habitaciones set estado = 'disponible' where id < 10;

