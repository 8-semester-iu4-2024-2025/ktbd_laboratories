-- DROP TABLE EMPLOYEES;

-- create
CREATE TABLE EMPLOYEES (
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(15) NOT NULL,
  last_name VARCHAR2(15) NOT NULL,
  email VARCHAR2(15) NOT NULL,
  phone_number VARCHAR2(15) NOT NULL,
  hire_date DATE NOT NULL,
  job_id NUMBER,
  salary integer NOT NULL,
  comission_pct integer NOT NULL,
  manager_id NUMBER,
  department_id NUMBER 
);

-- insert
INSERT INTO EMPLOYEES VALUES (1, 'Clark', 'Clark', 'Clark@keker', '88005553535', TO_DATE('12-AUG-2020'), 1, 2000, 0, 1, 1);
INSERT INTO EMPLOYEES VALUES (2, 'Ava', 'Ava', 'Ava@keker', '88005553536', TO_DATE('12-AUG-2020'), 1, 3000, 0, 1, 1);
INSERT INTO EMPLOYEES VALUES (3, 'Dave', 'Dave', 'Dave@keker', '88005553537', TO_DATE('12-AUG-2020'), 1, 4000, 1, 1, 1);

-- fetch 
SELECT first_name, last_name, salary FROM employees WHERE salary >= 3000 AND salary <= 4000 ORDER BY salary DESC; 
SELECT first_name, last_name, manager_id FROM employees WHERE manager_id=105 OR manager_id=149 OR manager_id=205;
SELECT last_name, email, phone_number FROM employees WHERE INSTR(email, 'H', 2)=2;
SELECT last_name, salary, comission_pct FROM employees WHERE comission_pct=0 ORDER BY salary DESC;
SELECT first_name, last_name, salary, phone_number FROM employees WHERE department_id=60 AND salary>=3000 ORDER BY salary DESC;