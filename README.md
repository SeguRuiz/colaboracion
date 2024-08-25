## Esquema de Base de Datos - Reserva Hoteles
# Tabla: "clientes"
## Primera Forma Normal (1FN)
- Todos los campos (nombre, apellidos, correo_electronico, telefono_personal) contienen dentro de si valores indivisibles. 
- No hay columnas duplicadas en la tabla.
-  La tabla tiene una llave primaria que es el (id), por lo que cada registro es unico.
## Segunda Forma Normal (2FN)
- cumple con la primera forma normal
- Todas las columnas (nombre, apellidos, correo_empresarial) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id) por lo que no hay dependencias transitivas.


# Tabla: hoteles
## Primera Forma Normal (1FN)
- Todos los campos (admin_id, nombre, ubicacion, telefono, correo) tienen valores indivisibles
- Los datos relacionados con los hoteles están agrupados en esta tabla separada.
- No existen columnas duplicadas en esta tabla.
- La tabla tiene una llave primaria (id), por lo que cada hotel sera unico
## Segunda Forma Normal (2FN)
- Todas las columnas (admin_id, nombre, ubicacion, telefono, correo) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id) no existen campos que dependan de las otras columnas.


# Tabla: tipos_habitaciones
## Primera Forma Normal (1FN)
- Todos los valores (nombre, limite_huespedes, precio) en las columnas son atómicos es decir cada valor es unico.
- Los datos relacionados con los tipos de habitaciones están agrupados en esta tabla separada.
- No hay columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (nombre, limite_huespedes, precio) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.


# Tabla: administradores
## Primera Forma Normal (1FN)
- Todos los valores en las columnas son atómicos es decir que (nombre, apellidos, correo_empresarial) contienen uno solo valor y no varios.
- No existen columnas duplicadas.
- Esta tabla tiene un (id) por lo que cada registro es unico.
## Segunda Forma Normal (2FN)
- Todas las columnas (nombre, apellidos, correo_empresarial) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id)


# Tabla: habitaciones
## Primera Forma Normal (1FN)
- Todas las columnas contienen valores (hotel_id, tipo_id, estado, telefono) indivisibles, es decir son unicos
- Los datos relacionados con las habitaciones están agrupados en esta tabla separada.
- No existen columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (hotel_id, tipo_id, estado, telefono) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

# Tabla: reservaciones
## Primera Forma Normal (1FN)
- Cada columna tiene valores unicos (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa) e indivisibles.
- Los datos relacionados con las reservaciones están agrupados en esta tabla que esta separada.
- No hay columnas duplicadas.
- La tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (cliente_id, hotel_id, fecha_entrada, fecha_salida, activa) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

# Tabla: huespedes
## Primera Forma Normal (1FN)
-  Cada columna tiene valores atómicos 
- Los datos relacionados con los huéspedes están agrupados en esta tabla separada.
- No hay columnas duplicadas.
- la tabla tiene una llave primaria (id).
## Segunda Forma Normal (2FN)
- Todas las columnas (hotel_id, reservacion_id) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

# Tabla: reservas_habitaciones
## Primera Forma Normal (1FN)
- Cada columna tiene valores que son completamente unicos.
- Los datos que estan relacionados a las reservas estan separados.
- No hay columnas dobles 
- La tabala tiene una llave primaria que es el (id)
## Segunda Forma Normal (2FN)
- Todas las columnas (reservacion_id, habitacion_id) dependen completamente de la llave primaria (id).
## Tercera Forma Normal (3FN)
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas.

# Tabla: limite_habitaciones
## Primera Forma Normal (1FN)
- Todos los valores en las columnas (hotel_id, tipo_habitacion_id, limite_habitaciones) son atómicos, es decir, cada valor es indivisible.
- Los datos relacionados con el límite de habitaciones están agrupados en esta tabla separada.
- No hay columnas duplicadas en esta tabla.
- La tabla tiene una llave primaria (id), asegurando que cada registro sea único.
## Segunda Forma Normal (2FN)
- La tabla cumple con la Primera Forma Normal (1FN).
- Todas las columnas (hotel_id, tipo_habitacion_id, limite_habitaciones) dependen completamente de la llave primaria (id) no hay columnas que dependan de una clave primaria compuesta 
## Tercera Forma Normal (3FN)
- La tabla cumple con la Segunda Forma Normal (2FN).
- Todas las columnas dependen únicamente de la llave primaria (id). No hay dependencias transitivas, es decir, ninguna columna depende de otra columna que no sea la llave primaria.