### Esquema de Base de Datos - Reserva Hoteles
## Tabla : "clientes"
## Primera Forma Normal (1FN)
- Todos los campos (nombre, apellidos, correo_electronico, telefono_personal) contienen dentro de si valores indivisibles. 
- No hay columnas duplicadas en la tabla.
-  La tabla tiene una llave primaria que es el (id), por lo que cada registro es unico.
## Segunda Forma Normal (2FN)
- cumple con la primera forma normal
- Todas las columnas (nombre, apellidos, correo_empresarial) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id) por lo que no hay dependencias transitivas.


## Tabla: hoteles
## Primera Forma Normal (1FN)
- Todos los campos (admin_id, nombre, ubicacion, telefono, correo) tienen valores indivisibles
- Los datos relacionados con los hoteles están agrupados en esta tabla separada.
- No existen columnas duplicadas en esta tabla.
- La tabla tiene una llave primaria (id), por lo que cada hotel sera unico
## Segunda Forma Normal (2FN)
- Todas las columnas (admin_id, nombre, ubicacion, telefono, correo) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id) no existen campos que dependan de las otras columnas.


## Tabla: tipos_habitaciones
## Primera Forma Normal (1FN)
- Todos los valores (nombre, limite_huespedes, precio) en las columnas son atómicos es decir cada valor es unico.
- Los datos relacionados con los tipos de habitaciones están agrupados en esta tabla separada.
- No hay columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (nombre, limite_huespedes, precio) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.


## Tabla: administradores
## Primera Forma Normal (1FN)
- Todos los valores en las columnas son atómicos es decir que (nombre, apellidos, correo_empresarial) contienen uno solo valor y no varios.
- No existen columnas duplicadas.
- Esta tabla tiene un (id) por lo que cada registro es unico.
## Segunda Forma Normal (2FN)
- Todas las columnas (nombre, apellidos, correo_empresarial) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id)


## Tabla: habitaciones
## Primera Forma Normal (1FN)
- Todas las columnas contienen valores (hotel_id, tipo_id, estado, telefono) indivisibles, es decir son unicos
- Los datos relacionados con las habitaciones están agrupados en esta tabla separada.
- No existen columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (hotel_id, tipo_id, estado, telefono) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

## tabla: reservaciones
## Primera Forma Normal (1FN)
- Cada columna tiene valores unicos (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa) e indivisibles.
- Los datos relacionados con las reservaciones están agrupados en esta tabla que esta separada.
- No hay columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

## Tabla: huespedes
## Primera Forma Normal (1FN)
-  Cada columna tiene valores atómicos 
- Los datos relacionados con los huéspedes están agrupados en esta tabla separada.
- No hay columnas duplicadas.
- la tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (hotel_id, reservacion_id) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

## tabla : reservas_habitaciones
## Primera Forma Normal (1FN)
- Cada columna tiene valores que son completamente unicos.
- Los datos que estan relacionados a las reservas estan separados.
- No hay columnas dobles 
- La tabla tiene una llave primaria que es el (id)
## Segunda Forma Normal (2FN)
- Todas las columnas (reservacion_id, habitacion_id) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

## Tabla: limite_habitaciones
## Primera Forma Normal (1FN)
- Todos los valores en las columnas (hotel_id, tipo_habitacion_id, limite_habitaciones) son atómicos, es decir, cada valor es indivisible.
- Los datos relacionados con el límite de habitaciones están agrupados en esta  separada.
- No hay columnas duplicadas en esta .
- La tabla tiene una llave primaria (id), asegurando que cada registro sea único.
## Segunda Forma Normal (2FN)
- La tabla cumple con la Primera Forma Normal (1FN).
- Todas las columnas (hotel_id, tipo_habitacion_id, limite_habitaciones) dependen completamente de la llave primaria (id) no hay columnas que dependan de una clave primaria compuesta 
## Tercera Forma Normal (3FN)
- La tabla cumple con la Segunda Forma Normal (2FN).
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas, es decir, ninguna columna depende de otra columna que no sea la llave primaria.


## Tabla estado_habitacion
## Primera Forma Normal (1FN)
- los valores en la columna son atomicos 
- La tabla tiene una llave primaria (id), asegurando que cada registro sea único.
## Segunda Forma Normal (2FN)
- La tabla cumple con la Primera Forma Normal (1FN).
- los valores dependen de la llave primaria
## Tercera Forma Normal (3FN)
- La tabla cumple con la Segunda Forma Normal (2FN).
- no tiene dependencias transitivas. 

### Explicación de Constraints

## 1. Tabla clientes
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id
- esta tabla cuenta con la constraint cliente_unico con UNIQUE y se eligio porque asegura que al darse la combinacion de id, nombre, y apellidos no se dupliquen los datos.
## 2. Tabla administradores
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id
- esta tabla cuenta con la constraint admin_unico con UNIQUE y se eligio porque asegura que no existan administradores duplicados con el mismo id, nombre, y apellidos.
## 3. Tabla hoteles
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id
- Esta tabla tiene una FOREIGN KEY llamada (admin_id) la cual cumple la funcion de establecer una relacion entre hoteles y administradores pero asegurando que los admin_id dentro de la tabla hoteles corresponda a un dato existente y se decidio agregar la opcion de on delete cascade para garantizar que al eliminar un administrador, los demas hoteles asociados también se eliminarán.
- Se opto por colocar en esta tabla la  constraint hotel_unico  para asegurar que no haya dos hoteles que contengan dentro de si la misma  combinación de id y ubicacion, para optimizar la gestion de las ubicaciones 
## 4. Tabla tipos_habitaciones
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- Se opto colocar NOT NUL en las columnas  (nombre, limite_huespedes, precio) para asegurar que los valores que se deseen ingresar a ellas sean validos esto perimite una buena gestion de las habitaciones. 
## 5. Tabla limite_habitaciones
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- Se eligio FOREIGN KEY (hotel_id) lo que asegura que cada valor dentro de hotel_id en limite_habitaciones corresponda a un id existente en hoteles con el fin de mantener la integridad referencial entre las conexiones de las tablas.
- se creo la FOREIGN KEY (tipo_habitacion_id) para asegurar que cada tipo_habitacion corresponda a un id, que ya existe en tipos_habitaciones, esto permite garantizar que solo se referenceen los tipos de habitaciones validos 
## 6. Tabla habitaciones
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- FOREIGN KEY (hotel_id) fue creada con la finalidad de asegurar que cada hotel_id dentro de la tabla habitaciones este asociado a un dato existente de hotel en la tabla hoteles, lo cual es critico para mantener la integridad de la informacion.
- FOREIGN KEY (tipo_id) esto se creo para asegurar que cada tipo_id en habitaciones sea un tipo de habitación válido según la tabla tipos_habitaciones.
- - En esta tabla se agrego el valor por defecto para estado como disponible, se hizo asi porque asi es util para un manejo simple de las habitaciones.
## 7. Tabla reservaciones
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- la FOREIGN KEY (cliente_id) es una constraint que asegura cada reservación y optimiza que esté vinculada a un cliente válido, lo cual es esencial para mantener la integridad referencial en el sistema.
- FOREIGN KEY (hotel_id) asegura que cada reservacion que se haga este asociada a un hotel valido, esto se creo asi con el fin de reforzar la consistencia de los datos del sistema.
- Se creo la constraint reservacion_unica, para asegurar que no haya dos reservaciones que sean iguales para un mismo cliente en una misma fecha y asi evitar la duplicacion de los datos dandole a (id, cliente_id, fecha_entrada, fecha_salida) un UNIQUE
## 8. Tabla huespedes
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- La FOREIGN KEY (hotel_id) se creo con el fin de asegurar que cada hotel_id en la tabla huespedes tenga una relacion valida a un hotel existente y asi mantener la integridad de las referencias 
- FOREIGN KEY (reservacion_id) fue creada con el proposito de garantizar que  cada cliente registrado en la tabla huespedes esté vinculado a una reservación válida y asi se asegura que la relacion entre huespedes y reservaciones es correcta 
## 9. Tabla reservas_habitaciones
- Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- Se eligio la FOREIGN KEY (reservacion_id) para garantizar que cada reserva de habitacion que haga un cliente este vinulada a una reservacion que sea valida, para mantener la consistencia en la gestión de las reservaciones.
- Se opto por crear la FOREIGN KEY (habitacion_id), para asegurar que las reservaciones hechas esten vinculadas a una habitacion valida, con el proposito de mantener la integridad de los datos que estan en la tabla habitacion y sus reservaciones correspondientes 
## 10. Tabla estado_habitacion // agregar al mapa
-  Se eligio como PRIMARY KEY a (id) porque se necesita un identificador unico y el id evita tener en el sistema dos registros con el mismo id.
- se creo porque define una constraint única en la columna nombre_estado,para que no pueda haber dos registros en la tabla con el mismo valor en nombre_estado.
## diagrama Entidad-Relación (ER):
Entidad-Relación (ER):
![image](https://github.com/user-attachments/assets/4902ddf3-fc72-4b02-b8ea-10a88e55758e)
