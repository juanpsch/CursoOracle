-- Ver Comentarios de tabla
SELECT * FROM user_tab_comments;

-- Ver Comentarios de Columna
SELECT * FROM user_col_comments;

-- Agregar comentario de tabla
COMMENT ON TABLE job_copy IS 'Copia de la tabla de cargos para pruebas DDL';


---- El prefijo 'user' define el alcance a nivel de objeto al esquema del usuario -------
----- Si se quiere en todos los esquemas, en lugar de 'user' se usa 'all'

-- Ver tablas usuario
SELECT * FROM user_tables;
-- Ver tablas todas
SELECT * FROM all_tables;
-- Ver views usuario
SELECT * FROM user_views;
-- Ver views all
SELECT * FROM all_views;
-- Ver parámetros nls de la base en la vista nls_database_parameters
SELECT * FROM nls_database_parameters;
-- Ver objetos usuario
SELECT * FROM user_objects;
-- objetos all
SELECT * FROM all_objects;


-- VISTAS
-- Permiten simplificar cuando tenemos queries muy complejos

