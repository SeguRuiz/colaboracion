-- Implementar un trigger que actualice automáticamente la disponibilidad de habitaciones 
-- cuando se realice una reserva o se cancele una existente.

CREATE TRIGGER actualizar_estado_habitaciones AFTER UPDATE ON reservaciones
FOR EACH ROW
BEGIN 
     SELECT habitacion_id INTO @id_habitacion FROM reservas_habitaciones WHERE reservacion_id = NEW.id;
  IF NOT EXISTS (SELECT * FROM habitaciones_reservadas_fechas WHERE activa = 1 AND habitacion_id = @id_habitacion) THEN
        UPDATE habitaciones SET estado_id = 3 WHERE id = @id_habitacion;
  ELSE
         UPDATE habitaciones SET estado_id = 2 WHERE id = @id_habitacion;
  END IF;
  
END; 

DROP TRIGGER actualizar_estado_habitaciones;

UPDATE reservaciones SET activa = FALSE WHERE id = 8;

-- fecha de reservacion inmutable
CREATE TRIGGER update_inmutable_reservas BEFORE UPDATE ON reservaciones
FOR EACH ROW
BEGIN
SET NEW.fecha_agregacion = CURDATE();
END;

CREATE TRIGGER insert_inmutable_reservas BEFORE INSERT ON reservaciones
FOR EACH ROW
BEGIN
SET NEW.fecha_agregacion = CURDATE();
END;

drop trigger insert_inmutable_reservas;
drop trigger update_inmutable_reservas;

-- evitar fechas imposibles y reservaciones que chocan

CREATE TRIGGER fechas_imposibles BEFORE UPDATE ON reservaciones
FOR EACH ROW
BEGIN
SELECT habitacion_id INTO @id_habitacion FROM reservas_habitaciones WHERE reservas_habitaciones.reservacion_id = NEW.id;
CALL comprobar_fechas(NEW.fecha_entrada, NEW.fecha_salida, @id_habitacion);
END;


