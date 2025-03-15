SELECT first_name
      ,last_name
      ,salary
  FROM employees
 WHERE salary >= 3000
   AND salary <= 4000
 ORDER BY salary DESC;
SELECT first_name
      ,last_name
      ,manager_id
  FROM employees
 WHERE manager_id = 105
    OR manager_id = 149
    OR manager_id = 205;
SELECT last_name
      ,email
      ,phone_number
  FROM employees
 WHERE instr(
    email
   ,'H'
   ,2
) = 2;
SELECT last_name
      ,salary
      ,comission_pct
  FROM employees
 WHERE comission_pct = 0
 ORDER BY salary DESC;
SELECT first_name
      ,last_name
      ,salary
      ,phone_number
  FROM employees
 WHERE department_id = 60
   AND salary >= 3000
 ORDER BY salary DESC;
SELECT employees.first_name
      ,employees.last_name
      ,employees.salary
      ,employees.job_id
      ,employees.comission_pct
  FROM employees
  LEFT JOIN jobs
ON employees.job_id = jobs.job_id
 WHERE employees.comission_pct > 0
    OR instr(
    jobs.job_title
   ,'IT'
   ,1
) = 1;
SELECT first_name
      ,last_name
      ,manager_id
  FROM employees
 WHERE manager_id <> 105
   AND manager_id <> 149
   AND manager_id <> 205
 ORDER BY last_name;
SELECT first_name
      ,last_name
      ,hire_date
  FROM employees
 ORDER BY hire_date ASC;
SELECT department_id
      ,last_name
      ,phone_number
  FROM employees
 ORDER BY department_id
         ,last_name;
COLUMN "Подразделение" FORMAT A25
COLUMN "Подчинение" FORMAT A25
SELECT lpad(
    departments.department_name
   ,length(departments.department_name) + 2 *(level - 1)
   ,'.'
) "Подразделение"
      ,sys_connect_by_path(
    departments.department_name
   ,'/'
) "Подчинение"
  FROM departments
 INNER JOIN employees e1
ON departments.manager_id = e1.employee_id
 INNER JOIN employees e2
ON e1.manager_id = e2.employee_id
CONNECT BY NOCYCLE
    PRIOR departments.department_id = e2.department_id
START WITH upper(departments.department_name) = 'IT'
 ORDER SIBLINGS BY departments.department_name;