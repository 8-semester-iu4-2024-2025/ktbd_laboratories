-- DROP TABLE JOBS;
-- DROP TABLE EMPLOYEES;

-- create JOBS
CREATE TABLE JOBS (
  job_id NUMBER PRIMARY KEY,
  job_title VARCHAR2(15) NOT NULL,
  min_salary NUMBER NOT NULL,
  max_salary NUMBER NOT NULL
);

-- create EMPLOYEES
CREATE TABLE EMPLOYEES (
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(15) NOT NULL,
  last_name VARCHAR2(15) NOT NULL,
  email VARCHAR2(15) NOT NULL,
  phone_number VARCHAR2(15) NOT NULL,
  hire_date DATE NOT NULL,
  job_id NUMBER, --FOREIGN KEY REFERENCES JOBS(job_id),
  salary NUMBER NOT NULL,
  comission_pct NUMBER NOT NULL,
  manager_id NUMBER,
  department_id NUMBER 
);


-- insert JOBS
INSERT INTO JOBS VALUES (1, 'IT_shnik', 1000, 1000000);

-- insert EMPLOYEES
INSERT INTO EMPLOYEES VALUES (1, 'Clark', 'Clark', 'Clark@keker', '88005553535', TO_DATE('12-AUG-2020'), 0, 2000, 1, 205, 1);
INSERT INTO EMPLOYEES VALUES (2, 'Ava', 'Ava', 'Ava@keker', '88005553536', TO_DATE('12-AUG-2020'), 1, 3000, 0, 1, 1);
INSERT INTO EMPLOYEES VALUES (3, 'Dave', 'Dave', 'Dave@keker', '88005553537', TO_DATE('12-AUG-2020'), 0, 4000, 0, 1, 1);
INSERT INTO EMPLOYEES VALUES (4, 'Valenok', 'Valenok', 'Valenok@keker', '88005553538', TO_DATE('12-AUG-2020'), 1, 4000, 1, 149, 60);

-- select 
SELECT first_name, last_name, salary FROM employees WHERE salary >= 3000 AND salary <= 4000 ORDER BY salary DESC; 
SELECT first_name, last_name, manager_id FROM employees WHERE manager_id=105 OR manager_id=149 OR manager_id=205;
SELECT last_name, email, phone_number FROM employees WHERE INSTR(email, 'H', 2)=2;
SELECT last_name, salary, comission_pct FROM employees WHERE comission_pct=0 ORDER BY salary DESC;
SELECT first_name, last_name, salary, phone_number FROM employees WHERE department_id=60 AND salary>=3000 ORDER BY salary DESC;
SELECT employees.first_name, employees.last_name, employees.salary, employees.job_id, employees.comission_pct FROM employees LEFT JOIN jobs ON employees.job_id = jobs.job_id WHERE employees.comission_pct>0 OR INSTR(jobs.job_title, 'IT', 1)=1;
SELECT first_name, last_name, manager_id FROM employees WHERE manager_id<>105 AND manager_id<>149 AND manager_id<>205 ORDER BY last_name;