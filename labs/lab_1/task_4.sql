SELECT first_name
      ,last_name
      ,salary
FROM hr.employees
WHERE salary >= 3000
      AND salary <= 4000
ORDER BY salary DESC
FOR UPDATE NOWAIT;
SELECT first_name
      ,last_name
      ,manager_id
FROM hr.employees
WHERE manager_id = 105
      OR manager_id = 149
      OR manager_id = 205
FOR UPDATE NOWAIT;
SELECT last_name
      ,email
      ,phone_number
FROM hr.employees
WHERE instr(
    email
   ,'H'
   ,2
) = 2
FOR UPDATE NOWAIT;
SELECT last_name
      ,salary
      ,commission_pct
FROM hr.employees
WHERE commission_pct = 0
ORDER BY salary DESC
FOR UPDATE NOWAIT;
SELECT first_name
      ,last_name
      ,salary
      ,phone_number
FROM hr.employees
WHERE department_id = 60
      AND salary >= 3000
ORDER BY salary DESC
FOR UPDATE NOWAIT;
SELECT hr.employees.first_name
      ,hr.employees.last_name
      ,hr.employees.salary
      ,hr.employees.job_id
      ,hr.employees.commission_pct
FROM hr.employees
LEFT JOIN hr.jobs
ON hr.employees.job_id = hr.jobs.job_id
WHERE hr.employees.commission_pct > 0
      OR instr(
    hr.jobs.job_title
   ,'IT'
   ,1
) = 1
FOR UPDATE NOWAIT;
SELECT first_name
      ,last_name
      ,manager_id
FROM hr.employees
WHERE manager_id <> 105
      AND manager_id <> 149
      AND manager_id <> 205
ORDER BY last_name
FOR UPDATE NOWAIT;
SELECT first_name
      ,last_name
      ,hire_date
FROM hr.employees
ORDER BY hire_date ASC
FOR UPDATE NOWAIT;
SELECT department_id
      ,last_name
      ,phone_number
FROM hr.employees
ORDER BY department_id
        ,last_name
FOR UPDATE NOWAIT;
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
FROM hr.departments
LEFT JOIN hr.employees e1
ON departments.manager_id = e1.employee_id
LEFT JOIN hr.employees e2
ON e1.manager_id = e2.employee_id
CONNECT BY NOCYCLE
    PRIOR e2.department_id = departments.department_id
START WITH upper(departments.department_name) = 'IT'
ORDER SIBLINGS BY departments.department_name
FOR UPDATE NOWAIT;