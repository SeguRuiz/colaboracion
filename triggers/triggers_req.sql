-- Implementar un trigger que actualice automáticamente la disponibilidad de habitaciones 
-- cuando se realice una reserva o se cancele una existente.

CREATE TRIGGER actualizar_estado_habitaciones BEFORE UPDATE ON reservaciones
FOR EACH ROW
BEGIN 
  IF NEW.activa = FALSE OR NEW.activa = 0 THEN
     SELECT habitacion_id INTO @id_habitacion FROM reservas_habitaciones WHERE reservacion_id = NEW.id;
     UPDATE habitaciones SET estado_id = 3 WHERE id = @id_habitacion;
  END IF;
  
END; 

DROP TRIGGER actualizar_estado_habitaciones;

UPDATE reservaciones SET activa = true WHERE id = 1;

SELECT * FROM habitaciones

SELECT * FROM habitaciones_reservadas_fechas

SELECT * FROM reservas_habitaciones;