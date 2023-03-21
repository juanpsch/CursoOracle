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
-- ver objetos all
SELECT * FROM all_objects;
-- ver usuarios
SELECT * FROM all_users;
-- ver priviliegios de tablas creados por el usuario
SELECT * FROM user_tab_privs_made;


-- VISTAS
-- Permiten simplificar cuando tenemos queries muy complejos
-- También sirve para darle permisos más selectivos los datos que puede ver un usuarios
-- Hay vistas simples y compuestas:
----- Una vista que accede a muchas tablas es compleja
----- Una tabla que agrupa es compleja
----- Una vista con clausula DISTINCT es compleja
----- En las vistas complejas no se pueden hacer ciertas acciones DML
----- Una vista que no tiene devuelve todos los campos mandatorios, tampoco
-------permitiría hacer ciertas acciones DML



-- CREACION DE VISTAS
--- Por ejemplo esta vista recupera los empleados del dpto 60 y permite dar de alta o baja o modificacion
--- Si no tiene el Read Only
--- El check option va a restringir estas modificaciones al alcance de la vista
CREATE VIEW emp_it_v
    AS SELECT * FROM employees
        WHERE department_id = 60
    --WITH READ ONLY -- Solo Lectura
    WITH CHECK OPTION CONSTRAINT emp_it_v_chk -- Restringe modificaciones al alcance de la vista    
;

SELECT * FROM emp_it_v;

-- Ejemplo de modif otro empleado que no es del dpto       
UPDATE emp_it_v
    SET salary = 2541
    WHERE employee_id = 100
;
-- Ejemplo de borrar otro empleado que no es del dpto       
DELETE emp_it_v    
    WHERE employee_id = 100
;
-- Ejemplo de insertar otro empleado que no es del dpto       
INSERT INTO emp_it_v    
    VALUES (5, 'PEPE', 'CORTIZONA', 'pepe.cortizona@jkl.com', '012312312', SYSDATE, 'IT_PROG', 7000, NULL, 102, 100)
;




DESC emp_it_v;

DROP VIEW emp_it_v;



-- Crear usuario
CREATE USER walter identified by walter DEFAULT TABLESPACE users PROFILE DEFAULT;

-- Privilegios
GRANT SELECT ON employees TO WALTER;

REVOKE SELECT ON employees FROM WALTER;


