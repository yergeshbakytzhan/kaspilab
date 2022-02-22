-- CREATE TABLE regions(
--   region_id      NUMBER 
--       CONSTRAINT region_id_nn NOT NULL 
--  , region_name    VARCHAR2(25) );
-- CREATE UNIQUE INDEX reg_id_pk ON regions(region_id);
-- ALTER TABLE regions
--   ADD CONSTRAINT reg_id_pk
--       PRIMARY KEY (region_id);
-- CREATE TABLE countries(
--   country_id      CHAR(2) 
--       CONSTRAINT country_id_nn NOT NULL 
--  , country_name    VARCHAR2(40) 
--  , region_id       NUMBER 
--  , CONSTRAINT    country_c_id_pk 
--       PRIMARY KEY (country_id) )
--     ORGANIZATION INDEX;
-- ALTER TABLE countries
--   ADD CONSTRAINT countr_reg_fk
--           FOREIGN KEY (region_id)
--           REFERENCES regions(region_id);
-- CREATE TABLE locations( 
--   location_id    NUMBER(4)
--  , street_address VARCHAR2(40)
--  , postal_code    VARCHAR2(12)
--  , city           VARCHAR2(30)
--      CONSTRAINT loc_city_nn NOT NULL
--  , state_province VARCHAR2(25)
--  , country_id     CHAR(2));
-- CREATE UNIQUE INDEX loc_id_pk ON locations(location_id);
-- ALTER TABLE locations
--   ADD (CONSTRAINT loc_id_pk
--           PRIMARY KEY (location_id)
--       , CONSTRAINT loc_c_id_fk
--           FOREIGN KEY (country_id)
--           REFERENCES countries(country_id) );
-- CREATE TABLE departments( 
--   department_id    NUMBER(4)
--  , department_name  VARCHAR2(30)
--       CONSTRAINT  dept_name_nn  NOT NULL
--  , manager_id       NUMBER(6)
--  , location_id      NUMBER(4) ) ;
-- CREATE UNIQUE INDEX dept_id_pk ON departments(department_id);
-- ALTER TABLE departments
--   ADD (CONSTRAINT dept_id_pk
--           PRIMARY KEY (department_id)
--       , CONSTRAINT dept_loc_fk
--           FOREIGN KEY (location_id)
--           REFERENCES locations (location_id) );
-- CREATE TABLE jobs(
--   job_id         VARCHAR2(10)
--  , job_title      VARCHAR2(35)
--       CONSTRAINT job_title_nn  NOT NULL
--  , min_salary     NUMBER(6)
--  , max_salary     NUMBER(6) );
-- CREATE UNIQUE INDEX job_id_pk ON jobs (job_id) ;
-- ALTER TABLE jobs
--   ADD CONSTRAINT job_id_pk
--           PRIMARY KEY(job_id);
-- CREATE TABLE employees(
--   employee_id    NUMBER(6)
--  , first_name     VARCHAR2(20)
--  , last_name      VARCHAR2(25)
--       CONSTRAINT emp_last_name_nn  NOT NULL
--  , email          VARCHAR2(25)
--       CONSTRAINT emp_email_nn  NOT NULL
--  , phone_number   VARCHAR2(20)
--  , hire_date      DATE
--       CONSTRAINT emp_hire_date_nn  NOT NULL
--  , job_id         VARCHAR2(10)
--       CONSTRAINT     emp_job_nn  NOT NULL
--  , salary         NUMBER(8,2)
--  , commission_pct NUMBER(2,2)
--  , manager_id     NUMBER(6)
--  , department_id  NUMBER(4)
--  , CONSTRAINT emp_salary_min
--       CHECK (salary > 0) 
--  , CONSTRAINT emp_email_uk
--       UNIQUE (email) );
-- CREATE UNIQUE INDEX emp_emp_id_pk ON employees(employee_id);
-- ALTER TABLE employees
--   ADD (CONSTRAINT emp_emp_id_pk
--           PRIMARY KEY (employee_id)
--       , CONSTRAINT emp_dept_fk
--           FOREIGN KEY (department_id)
--           REFERENCES departments
--       , CONSTRAINT emp_job_fk
--           FOREIGN KEY (job_id)
--           REFERENCES jobs (job_id)
--       , CONSTRAINT emp_manager_fk
--           FOREIGN KEY (manager_id)
--           REFERENCES employees);
-- ALTER TABLE departments
--   ADD CONSTRAINT dept_mgr_fk
--       FOREIGN KEY (manager_id)
--       REFERENCES employees (employee_id);
-- CREATE TABLE job_history( 
--   employee_id   NUMBER(6)
--       CONSTRAINT jhist_employee_nn  NOT NULL
--  , start_date    DATE
--       CONSTRAINT jhist_start_date_nn  NOT NULL
--  , end_date      DATE
--       CONSTRAINT jhist_end_date_nn  NOT NULL
--  , job_id        VARCHAR2(10)
-- 	 CONSTRAINT jhist_job_nn  NOT NULL
--  , department_id NUMBER(4)
--  , CONSTRAINT jhist_date_interval
--       CHECK (end_date > start_date)) ;
-- CREATE UNIQUE INDEX jhist_emp_id_st_date_pk 
--   ON job_history (employee_id, start_date);
-- ALTER TABLE job_history
--   ADD (CONSTRAINT jhist_emp_id_st_date_pk
--           PRIMARY KEY (employee_id, start_date)
--       , CONSTRAINT jhist_job_fk
--           FOREIGN KEY (job_id)
--           REFERENCES jobs
--       , CONSTRAINT jhist_emp_fk
--           FOREIGN KEY (employee_id)
--           REFERENCES employees
--       , CONSTRAINT jhist_dept_fk
--           FOREIGN KEY (department_id)
--           REFERENCES departments);

--1. Выберите все данные из таблицы Departments.

SELECT * FROM departments


--2. Выберите поля Department_ID и Department_Name из таблицы Departments.

SELECT department_id, department_name FROM departments

--3. Выберите поле Department_Name из таблицы Departments, где Department_ID > 120.

SELECT department_name FROM departments WHERE department_id>120

--4. Выберите поля First_Name, Last_Name, Salary, Hire_Date из таблицы Employee, где Manager_ID равен 100.

SELECT first_name, last_name, salary, hire_date FROM employees WHERE manager_id = 100

--5. Отсортируйте выборку из задания 3 по полям Hire_Date, Last_Name, First_Name в таком порядке.

SELECT first_name, last_name, salary, hire_date FROM employees WHERE manager_id = 100 ORDER BY hire_date, last_name, first_name

--6. Выберите поля Department_ID и Department_Name из таблицы Departments и напишите рядом с ними однострочные комментарии с описанием этих полей.

SELECT 
department_id --Номер кафедры, 
department_name --Название кафедры
FROM departments
--7. Напишите многострочный комментарий к заданию 6 с описанием запроса.

SELECT first_name, last_name, salary, hire_date /* выбираем столбцы имя, фамилия, зарплата, день поступления */ FROM employees 

--8. К получившемуся запросу из задания 6 добавьте фильтр Manager_ID, равный 100, и перед ним сделайте многострочный комментарий, описывающий вашу доработку запроса.


SELECT first_name, last_name, salary, hire_date /* выбираем столбцы имя, фамилия, зарплата, день поступления */ FROM employees manager_id = 100 /* запрос с фильтром равный к 100 */
