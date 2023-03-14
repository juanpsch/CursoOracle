select * from employees;

-- CREAR LA TABLA EMP_HISTORY a partir de employees, pero vac�a
create table emp_history as
    (select * from employees where 1 = 2);

select * from emp_history;


-- Mergear los datos en EMP_HISTORY a partir de EMPLOYEES
MERGE INTO emp_history h
USING employees e
ON (e.EMPLOYEE_ID = h.EMPLOYEE_ID)
    WHEN MATCHED THEN
        UPDATE SET h.salary = e.salary
        WHERE h.salary != e.salary
        --[DELETE WHERE <delete_condition>]
    WHEN NOT MATCHED THEN
        INSERT (h.EMPLOYEE_ID, h.FIRST_NAME, h.LAST_NAME, h.EMAIL, h.PHONE_NUMBER, h.HIRE_DATE, h.JOB_ID, h.SALARY, h.COMMISSION_PCT, h.MANAGER_ID, h.DEPARTMENT_ID)
        values (e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.EMAIL, e.PHONE_NUMBER, e.HIRE_DATE, e.JOB_ID, e.SALARY, e.COMMISSION_PCT, e.MANAGER_ID, e.DEPARTMENT_ID)
        --WHERE <insert_condition>
;


UPDATE EMP_HISTORY
    SET salary = 2700
    WHERE salary = 2600
    ;


--Seleccion de version de dato de FLASHBACK
select VERSIONS_STARTTIME, VERSIONS_ENDTIME, EMPLOYEE_ID
    from emp_history
    versions between scn minvalue and maxvalue
    where employee_id=183
    ;
    
    
---- CREAR TABLA poni�ndole nombres a las CONSTRAINTS
CREATE TABLE hr.copy_emp
    (legajo NUMBER(3) CONSTRAINT legajo_pk PRIMARY KEY,   ------PRIMARY KEY
    apellido VARCHAR2(30) CONSTRAINT apellido_nn NOT NULL, -----NOT NULL
    nombre VARCHAR2(30),
    salario NUMBER(7,2),
    dpto NUMBER(4),
    correo VARCHAR2(35),
    fec_alta DATE DEFAULT SYSDATE,
    CONSTRAINT correo_un UNIQUE(correo),        ---CONSTRAINT DE UNIQUE CONSTRAINT 
    CONSTRAINT salario_ch CHECK(salario > 0),   ---CONSTRAINT DE CHECK
    CONSTRAINT dpto_fk FOREIGN KEY (dpto)       ------FOREIGN KEY
        REFERENCES departments(department_id)   ------FOREIGN KEY
        ON DELETE SET NULL                      ------poner en nulo la referencia al padre
        --CASCADE                               ------Borrar los registros correspondientes
    )
;

select * from departments;

DELETE FROM departments
    where department_id = 60
;

select * from copy_emp;


SELECT * FROM user_constraints
    WHERE table_name = 'COPY_EMP'
;


DESC departments;


    
DROP TABLE hr.copy_emp;



      
    
select * from employees;
    
select * from emp_history;


    
    