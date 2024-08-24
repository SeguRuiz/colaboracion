# 1FN

Para afirmar que nuestra base de datos está normalizada en la primera forma normal se debe de
verificar que:

Los valores almacenados en las columnas de nuestras tablas son atómicos (indivisibles), i.e,
no pueden tener múltiples valores en una sóla columna.

Los datos relacionados deben de estar agrupados en tablas separadas

Eliminar columnas duplicadas

Las tablas deben de contener una llave primaria única (PK)


# 2FN 

Se debe cumplir con las reglas de la Primer Forma Normal (1NF)

Los valores de las columnas de una fila dependen totalmente de la llave primaria de esa fila

En caso de no cumplirse la regla 2, se deben de crear tablas más pequeñas y separadas para
aquellos grupos de datos que se relacionan

# 3FN

Se debe cumplir con las reglas de la Segunda Forma Normal (2NF)

Garantizar que todos las columnas (que no son PK ni FK) dependan únicamente de la llave
primaria (PK)

Eliminar aquellos campos que no dependan de la llave primaria (mover a otra tabla)