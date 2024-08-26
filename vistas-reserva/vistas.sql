CREATE VIEW reservaciones_hoy AS
SELECT 
    r.id, 
    r.cliente_id, 
    r.hotel_id, 
    r.fecha_entrada, 
    r.fecha_salida, 
    r.activa
FROM 
    reservaciones r
WHERE 
    r.fecha_entrada = CURRENT_DATE;
INSERT INTO reservaciones (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa)
VALUES 
(1, 1, CURDATE(), '2024-09-05', true),
(3, 1, "2024-09-20", '2024-09-25', TRUE),
(3, 1, "2024-08-26", '2024-09-25', TRUE)
;

SELECT * FROM reservaciones_hoy;


   