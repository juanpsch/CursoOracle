create table JOBS_COPY as select * from JOBS;

SELECT * FROM jobs_prueba_ddl;


ALTER TABLE jobs_copy
ADD (fec_alta DATE DEFAULT SYSDATE, numero NUMBER(3));

ALTER TABLE jobs_copy MODIFY job_id char(2);

ALTER TABLE jobs_copy MODIFY numero CONSTRAINT numero_chk CHECK (numero > 20);

DESC jobs_prueba_ddl;

SELECT * FROM user_constraints
    WHERE 1 = 1
    -- AND table_Name like 'JOBS%'
    AND CONSTRAINT_NAME like 'NUMERO%'
    ;
    

ALTER TABLE jobs_prueba_ddl RENAME COLUMN job_id TO idjob;

RENAME jobs_copy to jobs_prueba_ddl;

ALTER TABLE jobs_prueba_ddl DROP COLUMN idjob;

ALTER TABLE jobs_prueba_ddl SET UNUSED (numero);

ALTER TABLE jobs_prueba_ddl DROP UNUSED COLUMNS;

desc jobs_prueba_ddl;

-- Borrado de tablas
DROP TABLE jobs_prueba_ddl_v2; -- Va a la papelera
DROP TABLE jobs_prueba_ddl_v2 PURGE; -- No va a la papelera, se borra definitivamente

-- VER OBJETOS EN LA PAPELERA
SELECT * FROM recyclebin;

-- FLASHBACK
FLASHBACK TABLE jobs_prueba_ddl_v2 TO BEFORE DROP RENAME TO jobs_prueba_ddl_v2;
SELECT * FROM jobs_prueba_ddl_v2;

-- Purgar de la papelera
PURGE TABLE copy_emp; -- Una tabla
PURGE RECYCLEBIN; --Toda la papelera





