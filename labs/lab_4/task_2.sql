CREATE SEQUENCE serial;
SELECT serial.CURRVAL
  FROM dual;
SELECT serial.NEXTVAL
  FROM dual;
SELECT level
  FROM hr.employees
CONNECT BY NOCYCLE
    PRIOR hr.employees.employee_id = hr.employees.manager_id;
SELECT hr.employees.rowid
  FROM hr.employees;
SELECT ROWNUM
  FROM hr.employees;