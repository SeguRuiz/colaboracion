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

SELECT * FROM habitaciones

SELECT * FROM reservaciones;

SELECT * FROM habitaciones_reservadas_fechas

SELECT * FROM reservas_habitaciones;